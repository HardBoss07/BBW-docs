"use client";

import {Chart as ChartJS, CategoryScale, LinearScale, LineElement, PointElement, Title, Tooltip, Legend} from "chart.js";
import {Line} from "react-chartjs-2";

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

type Props = {
    labels: string[];
    temperatures: number[];
    rain: number[];
    humidity: number[];
};

export default function WeatherChart({labels, temperatures, rain, humidity}: Props) {
    const data = {
        labels,
        datasets: [
            {
                label: "Temp (°C)",
                data: temperatures,
                borderColor: "#f97316",
                backgroundColor: "#f97316",
                tension: 0.4,
                yAxisID: "y",
            },
            {
                label: "Rain (mm)",
                data: rain,
                borderColor: "#3b82f6",
                backgroundColor: "#3b82f6",
                tension: 0.4,
                yAxisID: "y1",
            },
            {
                label: "Humidity (%)",
                data: humidity,
                borderColor: "#10b981",
                backgroundColor: "#10b981",
                tension: 0.4,
                yAxisID: "y2",
            },
        ],
    };

    const options = {
        responsive: true,
        maintainAspectRatio: false,
        interaction: {
            mode: "index" as const,
            intersect: false,
        },
        stacked: false,
        plugins: {
            legend: {
                position: "top" as const,
            },
        },
        scales: {
            y: {
                type: "linear" as const,
                position: "left" as const,
                ticks: {
                    color: "#f97316",
                },
            },
            y1: {
                type: "linear" as const,
                position: "right" as const,
                grid: {
                    drawOnChartArea: false,
                },
                ticks: {
                    color: "#3b82f6",
                },
            },
            y2: {
                type: "linear" as const,
                position: "right" as const,
                grid: {
                    drawOnChartArea: false,
                },
                ticks: {
                    color: "#10b981",
                },
            },
        },
    };

    return <Line options={options} data={data}/>;
}