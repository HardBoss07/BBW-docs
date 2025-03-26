"use client"
import {useState} from "react";
import '../mvp.css';

export default function MyForm() {
    const [name, setName] = useState("");

    const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        alert("The name you entered was: " + name);
    }

    return (
        <form onSubmit={handleSubmit}>
            <label>Enter your name:
                <input
                    type="text"
                    value={name}
                    onChange={ (e) => setName (e. target. value) }
                />
            </label>
            <input type="submit" />
        </form>
    )
}