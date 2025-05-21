import React, { useRef, useState, useEffect } from "react";

export default function CrudCrud() {
    const [persons, setPersons] = useState([]);
    const [lastID, setLastID] = useState("");
    const hasRun = useRef(false);

    const BASE_URL = "https://crudcrud.com/api/aad3a6d821074413a43d6b5c3f66b1bb";
    const API_URL = BASE_URL + "/persons";

    const newPerson1 = {
        firstName: "Max",
        lastName: "Mustermann",
        birthDate: "2025-05-21",
    };
    const newPerson2 = {
        firstName: "Manfred",
        lastName: "Müller",
        birthDate: "2025-02-07",
    };
    const newPerson3 = {
        firstName: "Marvin",
        lastName: "Schmid",
        birthDate: "2025-04-15",
    };
    const newPerson4 = {
        firstName: "Otto",
        lastName: "Burr",
        birthDate: "2025-12-19",
    };

    const PERSONS_POOL = [newPerson1, newPerson2, newPerson3, newPerson4];

    useEffect(() => {
        if (hasRun.current) return;
        hasRun.current = true;
        (async () => {
            await addPerson(newPerson2);
            await getPersons();
        })();
    }, []);

    async function getPersons() {
        try {
            const res = await fetch(API_URL);
            if (!res.ok) throw new Error(res.statusText);
            const data = await res.json();
            setPersons(data);

            if (data.length > 0 && !userModifiedID) {
                setLastID(data[data.length - 1]._id);
            }
        } catch (e) {
            console.error("getPersons", e);
        }
    }

    async function addPerson(person) {
        try {
            const res = await fetch(API_URL, {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(person),
            });
            if (!res.ok) throw new Error("Failed to add person");
        } catch (e) {
            console.error("post failed", e);
        }
    }

    async function handleAddPerson() {
        const rand = Math.floor(Math.random() * PERSONS_POOL.length);
        await addPerson(PERSONS_POOL[rand]);
        setUserModifiedID(false);
        await getPersons();
    }

    async function deletePerson(id) {
        try {
            const res = await fetch(`${API_URL}/${id}`, {
                method: "DELETE",
            });
            if (!res.ok) throw new Error("Failed to delete person");
        } catch (e) {
            console.error(e);
        }
    }

    async function handleDeletePerson() {
        if (!lastID) return;
        await deletePerson(lastID);
        setUserModifiedID(false);
        await getPersons();
    }

    async function updatePerson(id, person) {
        try {
            const res = await fetch(`${API_URL}/${id}`, {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(person),
            });
            if (!res.ok) throw new Error("Failed to update person");
        } catch (e) {
            console.error("failed to update person", e);
        }
    }

    async function handleUpdatePerson() {
        if (!lastID) return;
        await updatePerson(lastID, newPerson4);
        setUserModifiedID(false);
        await getPersons();
    }

    const [userModifiedID, setUserModifiedID] = useState(false);

    function handleIDChange(e) {
        setLastID(e.target.value);
        setUserModifiedID(true);
    }

    return (
        <>
            <h1>CRUD person</h1>
            <div>
                <button onClick={handleAddPerson}>Add Person</button>
                <button onClick={handleDeletePerson}>Delete Person</button>
                <button onClick={handleUpdatePerson}>Update Person</button>
            </div>
            <div>
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Birth Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    {persons.map((person) => (
                        <tr key={person._id}>
                            <td>{person._id}</td>
                            <td>{person.firstName}</td>
                            <td>{person.lastName}</td>
                            <td>{new Date(person.birthDate).toLocaleDateString("de-CH")}</td>
                        </tr>
                    ))}
                    </tbody>
                </table>
            </div>
            <div>
                <h2>Selected ID</h2>
                <input
                    value={lastID}
                    onChange={handleIDChange}
                    style={{ width: `${Math.max(lastID.length, 4)}ch` }}
                    placeholder="Enter ID"
                />
            </div>
        </>
    );
}