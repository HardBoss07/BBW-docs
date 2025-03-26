"use client";
import { useState } from "react";
import '../mvp.css';

export default function MyPost() {
    const [inputs, setInputs] = useState({
        title: "",
        message: "",
        showByUser: "nickname",
        sport: false,
        news: false,
        people: true,
        visibility: "Public"
    });

    const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        alert("Send new Post: " + JSON.stringify(inputs));
    };

    const handleOnChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
        const { name, value } = e.target;
        setInputs((prevInputs) => ({ ...prevInputs, [name]: value }));
    };

    const toggleOnChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const name = e.target.name;
        const checked = e.target.checked;
        setInputs((prevInputs) => ({ ...prevInputs, [name]: checked }));
    }

    return (
        <div>
            <h1>New Post</h1>
            <form onSubmit={handleSubmit}>
                <label>Title:
                    <input
                        type="text"
                        name="title"
                        value={inputs.title}
                        onChange={handleOnChange}
                    />
                </label>
                <label>Message:
                    <textarea
                        name="message"
                        value={inputs.message}
                        onChange={handleOnChange}
                    />
                </label>
                <label>Show user by:
                    <select
                        name="showByUser"
                        value={inputs.showByUser}
                        onChange={handleOnChange}
                    >
                        <option value="nickname">Nickname</option>
                        <option value="emailadresse">Email-Adresse</option>
                        <option value="none">keine Anzeige</option>
                    </select>
                </label>
                <label>Tags :</label>
                <label>
                    <input
                        type="checkbox"
                        name="sport"
                        checked={inputs.sport}
                        onChange={(e) => toggleOnChange(e)}
                    />Sport
                </label>
                <label>
                    <input
                        type="checkbox"
                        name="news"
                        checked={inputs.news}
                        onChange={(e) => toggleOnChange(e)}
                    />News
                </label>
                <label>
                    <input
                        type="checkbox"
                        name="people"
                        checked={inputs.people}
                        onChange={(e) => toggleOnChange(e)}
                    />People
                </label>
                <label>
                    <input
                        type="radio"
                        name="visibility"
                        checked={inputs.visibility === "Private"}
                        value="Private"
                        onChange={(e) => handleOnChange(e)}
                    />Private
                </label>
                <label>
                    <input
                        type="radio"
                        name="visibility"
                        checked={inputs.visibility === "Public"}
                        value="Public"
                        onChange={(e) => handleOnChange(e)}
                    />Public
                </label>
                <input type="submit"/>
            </form>
        </div>
    );
}