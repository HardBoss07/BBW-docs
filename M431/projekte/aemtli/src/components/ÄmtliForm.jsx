import {useState} from "react";

const ÄmtliForm = ({people, addÄmtli}) => {
    const [description, setDescription] = useState("")
    const handleDescriptionChange = (event) => {
        setDescription(event.target.value)
    }

    const [due, setDue] = useState("")
    const handleDueChange = (event) => {
        const input = event.target.value
        if (Number.isInteger(Number(input))) {
            setDue(input)
        }
    }

    return (<>
        <form onSubmit={addÄmtli}>
            Wer? <select name="person">
            {people.map(person => <option key={person.id} value={person.id}>{person.name}</option>)}
        </select>
            Was? <input name="description" onChange={handleDescriptionChange} value={description}/>
            In wievielen Tagen? <input name="due" onChange={handleDueChange} value={due}/>
            Wetterabhängig? <select name="weather">
            <option value="false">Nein</option>
            <option value="true">Ja</option>
        </select>

            <button type="submit">Add Ämtli</button>
        </form>
    </>)
}

export default ÄmtliForm