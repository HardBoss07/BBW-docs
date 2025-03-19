"use client"

import {useState} from "react";
import InputComponent from "@/app/components/InputComponent";

interface PlayerComponentProps {
    title: string;
}

export default function PlayerComponent({title}: PlayerComponentProps) {
    const [name, setName] = useState<string>('');
    const [score, setScore] = useState<number | string>(0);


    return (
        <div className="bg-gray-200 min-h-10">
            <InputComponent title={title} placeholder="Name" value={name} readonly={false} onChange={(e => setName(e.target.value))} />
            <InputComponent title="Score:" placeholder="Score:" value={score} readonly={true} onChange={(e => setScore(e.target.value))} />
        </div>
    )
}