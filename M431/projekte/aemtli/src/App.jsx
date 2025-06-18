import {useEffect, useState} from 'react'
import Ämtlis from "./components/Ämtli.jsx";
import ÄmtliForm from "./components/ÄmtliForm.jsx";
import axios from "axios";

const people = [{id: 0, name: 'Ich'}, {id: 1, name: 'Papa'}]
const dayOffset = 24 * 60 * 60 * 1000;
const initialÄmtlis = [{
    id: 0, person: 1, description: "Hund spazieren", due: new Date(), weather: false
}, {
    id: 1, person: 0, description: "Bad putzen", due: new Date(Date.now() + dayOffset), weather: false
}, {
    id: 2, person: 0, description: "Woche planen", due: new Date(Date.now() + 5 * dayOffset), weather: false
}]

function App() {
    const [ämtlis, setÄmtlis] = useState(initialÄmtlis)

    const sortÄmtlis = (ämtlis => ämtlis.sort((a, b) => a.due.getTime() - b.due.getTime()))

    const addÄmtli = (event) => {
        event.preventDefault()

        const person = Number(event.target.person.value)
        const description = event.target.description.value
        const due = new Date(Date.now() + dayOffset * Number(event.target.due.value))
        const weather = event.target.weather.value === "true"

        const maxId = Math.max(...ämtlis.map(ämtli => ämtli.id))
        const newÄmtli = {id: maxId + 1, person, description, due, weather}
        const newÄmtlis = ämtlis.concat(newÄmtli)

        setÄmtlis(sortÄmtlis(newÄmtlis))
    }

    const ämtliDone = (id) => () => {
        setÄmtlis(ämtlis.filter(ämtli => ämtli.id !== id))
    }

    const [weather, setWeather] = useState([]);
    useEffect(() => {
        //TODO: add value of API key here
       /* const api_key = "TODO"
        axios
            .get(`https://api.openweathermap.org/data/2.5/weather?q=Winterthur&units=metric&appid=${api_key}`)
            .then(res => res.data)
            .then(res => {
                setWeather(res)
            })*/
    }, []);

    return (<>
        <h1>Add Ämtli</h1>
        <ÄmtliForm people={people} addÄmtli={addÄmtli}/>
        <h1>Ämtli zu erledigen</h1>
        <Ämtlis ämtlis={ämtlis} people={people} weather={weather} ämtliDone={ämtliDone}/>
    </>)
}

export default App