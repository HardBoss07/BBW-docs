"use client";

import {useWeatherData} from "./useWeatherData";
import WeatherChart from "./WeatherChart";
import {Droplets, ThermometerSun, CloudRain} from "lucide-react";

export default function WeatherForecast() {
    const {weather, error} = useWeatherData();

    if (error) return <p className="text-red-500">Error: {error}</p>;
    if (!weather) return <p className="text-gray-600">Loading weather data...</p>;

    const sliceCount = 24;
    const labels = weather.time.slice(0, sliceCount).map((d) => d.getHours() + ":00");

    const now = new Date();
    const nowHour = now.getHours();
    const nowIndex = weather.time.findIndex((d) => d.getHours() === nowHour);

    const currentTemp = weather.temperature2m[nowIndex] ?? "--";
    const currentRain = weather.rain[nowIndex] ?? "--";
    const currentHumidity = weather.relativeHumidity2m[nowIndex] ?? "--";

    return (
        <div
            className="w-full rounded-2xl shadow-lg bg-white/60 backdrop-blur-md p-6 transition hover:shadow-xl border border-gray-200">
            <h2 className="text-xl font-bold text-gray-800 mb-4">Today’s Forecast</h2>

            <div
                className="grid grid-cols-2 gap-2 text-sm text-gray-700 gap-2 sm:gap-4 mb-4">
                <div className="flex items-center gap-2">
                    <ThermometerSun className="w-5 h-5 text-orange-500"/>
                    <span>Temp:</span>
                    <span className="font-semibold text-gray-900">{currentTemp}°C</span>
                </div>
                <div className="flex items-center gap-2">
                    <CloudRain className="w-5 h-5 text-blue-500"/>
                    <span>Rain:</span>
                    <span className="font-semibold text-gray-900">{currentRain} mm</span>
                </div>
                <div className="flex items-center gap-2">
                    <Droplets className="w-5 h-5 text-emerald-500"/>
                    <span>Humidity:</span>
                    <span className="font-semibold text-gray-900">{currentHumidity}%</span>
                </div>
            </div>

            <div className="h-64">
                <WeatherChart
                    labels={labels}
                    temperatures={weather.temperature2m.slice(0, sliceCount)}
                    rain={weather.rain.slice(0, sliceCount)}
                    humidity={weather.relativeHumidity2m.slice(0, sliceCount)}
                />
            </div>
        </div>
    );
}