import {useEffect, useState} from "react";

type WeatherData = {
    time: Date[];
    temperature2m: number[];
    rain: number[];
    relativeHumidity2m: number[];
};

const CACHE_KEY = "weatherDataCache";
const CACHE_TTL = 1000 * 60 * 60; // 1 hour

async function fetchWeatherData(): Promise<WeatherData> {
    const url = "https://api.open-meteo.com/v1/forecast";
    const params = {
        latitude: 47.5056,
        longitude: 8.7241,
        hourly: ["temperature_2m", "rain", "relative_humidity_2m"],
        timezone: "auto",
    };

    const queryString = new URLSearchParams({
        latitude: String(params.latitude),
        longitude: String(params.longitude),
        hourly: params.hourly.join(","),
        timezone: params.timezone,
    }).toString();

    const response = await fetch(`${url}?${queryString}`);
    if (!response.ok) throw new Error("Failed to fetch weather data");

    const data = await response.json();

    return {
        time: data.hourly.time.map((t: string) => new Date(t)),
        temperature2m: data.hourly.temperature_2m,
        rain: data.hourly.rain,
        relativeHumidity2m: data.hourly.relative_humidity_2m,
    };
}

export function useWeatherData() {
    const [weather, setWeather] = useState<WeatherData | null>(null);
    const [error, setError] = useState<string | null>(null);

    useEffect(() => {
        const cached = localStorage.getItem(CACHE_KEY);

        if (cached) {
            try {
                const parsed = JSON.parse(cached);
                const now = Date.now();

                if (now - parsed.timestamp < CACHE_TTL) {
                    const cachedData: WeatherData = {
                        time: parsed.data.time.map((t: string) => new Date(t)),
                        temperature2m: parsed.data.temperature2m,
                        rain: parsed.data.rain,
                        relativeHumidity2m: parsed.data.relativeHumidity2m,
                    };
                    setWeather(cachedData);
                    return;
                }
            } catch {
                // ignore and fetch fresh
            }
        }

        fetchWeatherData()
            .then((data) => {
                setWeather(data);
                localStorage.setItem(
                    CACHE_KEY,
                    JSON.stringify({timestamp: Date.now(), data})
                );
            })
            .catch((e) => setError(String(e)));
    }, []);

    return {weather, error};
}