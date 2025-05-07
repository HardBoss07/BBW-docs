import {useEffect, useState} from "react";

export default function Categories() {
    const [buttons, setButtons] = useState([]);
    const [joke, setJoke] = useState({});

    useEffect(() => {

        const fetchData = async () => {
            try {
                const response = await fetch('https://api.chucknorris.io/jokes/categories');
                const json = await response.json();
                setButtons(json);
            } catch (error) {
                console.log("error", error);
            }
        };

        fetchData();

    }, []);

    const getJoke = async (category) => {
        try {
            const response = await fetch(`https://api.chucknorris.io/jokes/random?category=${category}`);
            const json = await response.json();
            setJoke(json);
        } catch (error) {
            console.log("error", error);
        }
    }


    return (
        <div>
            <h1>Chuck Norris Jokes By Category</h1>
            <div className="buttons">
                {buttons.map((item) => {
                    return (
                        <button
                            key={item}
                            onClick={() => getJoke(item)}
                        >{item}</button>
                    )
                })}
            </div>
            <div>
                {joke.value}
            </div>
        </div>
    );
}