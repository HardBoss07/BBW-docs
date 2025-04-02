import React, { useState } from "react";
import InputComponent from "./InputComponent.jsx";

export default function FormComponent() {
    const [speed, setSpeed] = useState(0);
    const [time, setTime] = useState(0);
    const [way, setWay] = useState(0);

    const onSubmit = () => {
        setWay(time * speed);
    };

    return (
        <>
            <form onSubmit={(e) => e.preventDefault()}>
                <InputComponent title="Geschwindigkeit" value={speed} onChange={(e) => setSpeed(Number(e.target.value))} />
                <InputComponent title="Zeit" value={time} onChange={(e) => setTime(Number(e.target.value))} />
            </form>
            <h4>Weg</h4>
            <input type="number" value={way} readOnly />
            <button onClick={onSubmit}>Berechnen</button>
        </>
    );
}
