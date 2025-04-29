import {useState} from "react";

export default function Random() {
    const [chuckNorrisRandom, setChuckNorrisRandom] = useState([]);

    const getChuckNorrisRandom = async() => {
        await fetch('https://api.chucknorris.io/jokes/random')
            .then(response => response.json())
            .then(data => {
                console.log(data)
                setChuckNorrisRandom(data)
            })
            .catch(error => console.error(error));
    }

    return (
        <div>
            <h1>Random Chuck Norris Joke</h1>
            <button onClick={getChuckNorrisRandom}>Random Chuck Norris Joke</button>
            <br/>
            {chuckNorrisRandom.value}
        </div>
    );
}