"use client";

import {useState, useEffect} from "react";

export type Repeat =
    | "none"
    | "daily"
    | "weekly-monday"
    | "weekly-tuesday"
    | "weekly-wednesday"
    | "weekly-thursday"
    | "weekly-friday"
    | "weekly-saturday"
    | "weekly-sunday";

const repeatOptions: { label: string; value: Repeat }[] = [
    {label: "Does not repeat", value: "none"},
    {label: "Every day", value: "daily"},
    {label: "Every Monday", value: "weekly-monday"},
    {label: "Every Tuesday", value: "weekly-tuesday"},
    {label: "Every Wednesday", value: "weekly-wednesday"},
    {label: "Every Thursday", value: "weekly-thursday"},
    {label: "Every Friday", value: "weekly-friday"},
    {label: "Every Saturday", value: "weekly-saturday"},
    {label: "Every Sunday", value: "weekly-sunday"},
];

interface RepeatSelectorProps {
    value?: Repeat;
    onChange: (value: Repeat) => void;
}

export default function RepeatSelector({
                                           value = "none",
                                           onChange,
                                       }: RepeatSelectorProps) {
    const [selected, setSelected] = useState<Repeat>(value);

    useEffect(() => {
        onChange(selected);
    }, [selected, onChange]);

    return (
        <div className="space-y-1">
            <label className="block text-sm font-medium text-gray-700">
                Repeat
            </label>
            <select
                className="w-full border rounded-md p-2 text-sm"
                value={selected}
                onChange={(e) => setSelected(e.target.value as Repeat)}
            >
                {repeatOptions.map((option) => (
                    <option key={option.value} value={option.value}>
                        {option.label}
                    </option>
                ))}
            </select>
        </div>
    );
}
