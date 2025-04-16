import {useState, useEffect} from 'react'
import './App.css'

function App() {
    const [data, setData] = useState([]);

    useEffect(() => {
        fetch('https://jsonplaceholder.typicode.com/posts ?_ limit=10')
            .then(response => response.json())
            .then(json => {
                console.log(json)
                setData(json)
            })
            .catch(error => console.error(error));
    }, []);

    return (
        <div>
            {data.map(item => (
                <p key={item.id}>{item.title}</p>
            ))}
        </div>

    );
}

export default App
