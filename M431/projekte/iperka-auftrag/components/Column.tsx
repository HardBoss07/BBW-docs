"use client";

import {useDroppable} from "@dnd-kit/core";
import {TaskCard} from "./TaskCard";

export function Column({
                           id,
                           title,
                           tasks,
                       }: {
    id: string;
    title: string;
    tasks: { id: string; title: string; description: string }[];
}) {
    const {setNodeRef} = useDroppable({id});

    return (
        <div ref={setNodeRef} className="bg-gray-100 rounded-xl p-4 min-h-[300px]">
            <h2 className="text-lg font-bold mb-4">{title}</h2>
            <div className="space-y-4">
                {tasks.map((task) => (
                    <TaskCard key={task.id} task={task}/>
                ))}
            </div>
        </div>
    );
}
