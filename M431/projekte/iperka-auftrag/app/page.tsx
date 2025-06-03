"use client";

import { useEffect, useState } from "react";
import { DndContext, closestCenter } from "@dnd-kit/core";
import { Column } from "@/components/Column";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import { v4 as uuidv4 } from "uuid";
import RepeatSelector, { Repeat } from "@/components/RepeatSelector";

type Status = "not-started" | "in-progress" | "finished";

interface Task {
    id: string;
    title: string;
    description: string;
    status: Status;
    repeat: Repeat;
}

const statuses: { label: string; value: Status }[] = [
    { label: "Not Started", value: "not-started" },
    { label: "In Progress", value: "in-progress" },
    { label: "Finished", value: "finished" },
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
        const { over, active } = event;
        if (!over) return;

        setTasks((prev) =>
            prev.map((task) =>
                task.id === active.id ? { ...task, status: over.id } : task
            )
        );
    };

    if (!isHydrated) return null;

    return (
        <main className="p-6 space-y-6">
            <div className="max-w-xl space-y-4">
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
                <RepeatSelector value={repeat} onChange={setRepeat} />
                <Button onClick={addTask}>Add Task</Button>
            </div>

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
        </main>
    );
}