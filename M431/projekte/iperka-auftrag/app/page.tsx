"use client"; // for app/ directory (remove if using pages/)

import { useState } from "react";
import {
  DndContext,
  closestCenter,
  useDraggable,
  useDroppable,
} from "@dnd-kit/core";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import { v4 as uuidv4 } from "uuid";

type Status = "not-started" | "in-progress" | "finished";

interface Task {
  id: string;
  title: string;
  description: string;
  status: Status;
}

const statuses: { label: string; value: Status }[] = [
  { label: "Not Started", value: "not-started" },
  { label: "In Progress", value: "in-progress" },
  { label: "Finished", value: "finished" },
];

export default function Kanban() {
  const [tasks, setTasks] = useState<Task[]>([]);
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");

  const addTask = () => {
    if (!title.trim()) return;
    setTasks([
      ...tasks,
      { id: uuidv4(), title, description, status: "not-started" },
    ]);
    setTitle("");
    setDescription("");
  };

  const handleDragEnd = (event: any) => {
    const { over, active } = event;
    if (over) {
      setTasks((prev) =>
          prev.map((task) =>
              task.id === active.id ? { ...task, status: over.id } : task
          )
      );
    }
  };

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

function Column({
                  id,
                  title,
                  tasks,
                }: {
  id: Status;
  title: string;
  tasks: Task[];
}) {
  const { setNodeRef } = useDroppable({ id });

  return (
      <div ref={setNodeRef} className="bg-gray-100 rounded-xl p-4 min-h-[300px]">
        <h2 className="text-lg font-bold mb-4">{title}</h2>
        <div className="space-y-4">
          {tasks.map((task) => (
              <TaskCard key={task.id} task={task} />
          ))}
        </div>
      </div>
  );
}

function TaskCard({ task }: { task: Task }) {
  const { attributes, listeners, setNodeRef, transform } = useDraggable({
    id: task.id,
  });

  const style = transform
      ? {
        transform: `translate(${transform.x}px, ${transform.y}px)`,
      }
      : undefined;

  return (
      <Card ref={setNodeRef} style={style} {...listeners} {...attributes}>
        <CardContent className="pt-4 space-y-1 cursor-grab">
          <h3 className="font-medium">{task.title}</h3>
          <p className="text-sm text-gray-600">{task.description}</p>
        </CardContent>
      </Card>
  );
}