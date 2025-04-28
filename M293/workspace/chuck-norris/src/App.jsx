import {useState, useEffect} from 'react'
import './App.css'

function App() {
    const [data, setData] = useState([]);
    const [data2, setData2] = useState([]);

    const getNewData = async() => {
        await fetch('https://jsonplaceholder.typicode.com/posts?_limit=10')
            .then(response => response.json())
            .then(data => {
                console.log(data)
                setData2(data)
            })
            .catch(error => console.error(error));
    }

    useEffect(() => {
        fetch('https://jsonplaceholder.typicode.com/posts?_limit=10')
            .then(response => response.json())
            .then(json => {
                console.log(json)
                setData(json)
            })
            .catch(error => console.error(error));
    }, []);

    return (
        <>
            <div>
                <h1>Data1</h1>
                {data.map(item => (
                    <p key={item.id}>{item.title}</p>
                ))}
            </div>
            <button onClick={getNewData}>get data2</button>
            <div>
                <h1>Data2</h1>
                {data2.map(item => (
                    <p key={item.id}>{item.title}</p>
                ))}
            </div>
        </>

    );
}

export default App
