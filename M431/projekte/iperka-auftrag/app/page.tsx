"use client";

import {useEffect, useState} from "react";
import {DndContext, closestCenter} from "@dnd-kit/core";
import {Column} from "@/components/Column";
import {Input} from "@/components/ui/input";
import {Textarea} from "@/components/ui/textarea";
import {Button} from "@/components/ui/button";
import {v4 as uuidv4} from "uuid";
import RepeatSelector, {Repeat} from "@/components/RepeatSelector";
import WeatherForecast from "@/components/WeatherForecast"; // import your weather component

type Status = "not-started" | "in-progress" | "finished";

interface Task {
    id: string;
    title: string;
    description: string;
    status: Status;
    repeat: Repeat;
}

const statuses: { label: string; value: Status }[] = [
    {label: "Not Started", value: "not-started"},
    {label: "In Progress", value: "in-progress"},
    {label: "Finished", value: "finished"},
];

export default function KanbanPage() {
    const [isHydrated, setIsHydrated] = useState(false);
    const [tasks, setTasks] = useState<Task[]>([]);
    const [title, setTitle] = useState("");
    const [description, setDescription] = useState("");
    const [repeat, setRepeat] = useState<Repeat>("none");

    useEffect(() => {
        setIsHydrated(true);
    }, []);

    const addTask = () => {
        if (!title.trim()) return;

        const newTask: Task = {
            id: uuidv4(),
            title,
            description,
            status: "not-started",
            repeat,
        };

        setTasks([...tasks, newTask]);

        // Clear form
        setTitle("");
        setDescription("");
        setRepeat("none");
    };

    const handleDragEnd = (event: any) => {
        const {over, active} = event;
        if (!over) return;

        setTasks((prev) =>
            prev.map((task) =>
                task.id === active.id ? {...task, status: over.id} : task
            )
        );
    };

    if (!isHydrated) return null;

    return (
        <main className="p-6 min-h-screen bg-gray-50">
            <div className="max-w-7xl mx-auto bg-white p-6 rounded shadow-md space-y-6">

                {/* Top Row: Form + Forecast */}
                <div className="flex flex-col lg:flex-row gap-6">
                    {/* Task form */}
                    <div className="flex-1 space-y-4">
                        <Input
                            placeholder="Task title"
                            value={title}
                            onChange={(e) => setTitle(e.target.value)}
                        />
                        <Textarea
                            placeholder="Description"
                            value={description}
                            onChange={(e) => setDescription(e.target.value)}
                        />
                        <RepeatSelector value={repeat} onChange={setRepeat}/>
                        <Button onClick={addTask}>Add Task</Button>
                    </div>

                    {/* Weather Forecast */}
                    <div className="w-full lg:w-96">
                        <WeatherForecast/>
                    </div>
                </div>

                {/* Kanban Board */}
                <DndContext onDragEnd={handleDragEnd} collisionDetection={closestCenter}>
                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                        {statuses.map((col) => (
                            <Column
                                key={col.value}
                                id={col.value}
                                title={col.label}
                                tasks={tasks.filter((t) => t.status === col.value)}
                            />
                        ))}
                    </div>
                </DndContext>
            </div>
        </main>
    );
}
