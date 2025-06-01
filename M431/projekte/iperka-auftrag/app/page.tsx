"use client"; // Only needed in `app/` router

import { useState } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { Button } from "@/components/ui/button";
import {
  Select,
  SelectTrigger,
  SelectValue,
  SelectContent,
  SelectItem,
} from "@/components/ui/select";

interface Task {
  title: string;
  description: string;
  status: "todo" | "in-progress" | "done";
}

export default function Home() {
  const [tasks, setTasks] = useState<Task[]>([]);
  const [title, setTitle] = useState("");
  const [description, setDescription] = useState("");
  const [status, setStatus] = useState<Task["status"]>("todo");

  const addTask = () => {
    if (!title.trim()) return;
    setTasks([...tasks, { title, description, status }]);
    setTitle("");
    setDescription("");
    setStatus("todo");
  };

  return (
      <main className="p-6 max-w-2xl mx-auto space-y-6">
        <Card>
          <CardContent className="space-y-4 pt-6">
            <Input
                placeholder="Title"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
            />
            <Textarea
                placeholder="Description"
                value={description}
                onChange={(e) => setDescription(e.target.value)}
            />
            <Select value={status} onValueChange={(v) => setStatus(v as Task["status"])}>
              <SelectTrigger>
                <SelectValue placeholder="Select status" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="todo">To Do</SelectItem>
                <SelectItem value="in-progress">In Progress</SelectItem>
                <SelectItem value="done">Done</SelectItem>
              </SelectContent>
            </Select>
            <Button onClick={addTask}>Add Task</Button>
          </CardContent>
        </Card>

        <div className="space-y-4">
          {tasks.map((task, idx) => (
              <Card key={idx} className="border-l-4" style={{ borderColor: getStatusColor(task.status) }}>
                <CardContent className="pt-4">
                  <h2 className="text-lg font-semibold">{task.title}</h2>
                  <p className="text-sm text-gray-600">{task.description}</p>
                  <p className="text-xs mt-1 text-gray-400 uppercase">{task.status}</p>
                </CardContent>
              </Card>
          ))}
        </div>
      </main>
  );
}

function getStatusColor(status: Task["status"]): string {
  switch (status) {
    case "todo":
      return "#fbbf24"; // amber
    case "in-progress":
      return "#3b82f6"; // blue
    case "done":
      return "#10b981"; // green
    default:
      return "#d1d5db"; // gray
  }
}
