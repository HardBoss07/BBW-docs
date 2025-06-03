"use client";

import {Card, CardContent} from "@/components/ui/card";
import {useDraggable} from "@dnd-kit/core";

export function TaskCard({task}: { task: { id: string; title: string; description: string } }) {
    const {attributes, listeners, setNodeRef, transform} = useDraggable({
        id: task.id,
    });

    const style = transform
        ? {
            transform: `translate(${transform.x}px, ${transform.y}px)`,
        }
        : undefined;

    return (
        <Card
            ref={setNodeRef}
            {...attributes}
            {...listeners}
            style={style}
            className="cursor-grab"
        >
            <CardContent className="pt-4 space-y-1">
                <h3 className="font-medium">{task.title}</h3>
                <p className="text-sm text-gray-600">{task.description}</p>
            </CardContent>
        </Card>
    );
}
