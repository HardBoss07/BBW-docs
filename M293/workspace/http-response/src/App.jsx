import {useState} from 'react'
import './App.css'

export default function App() {
    const [formData, setFormData] = useState({fname: '', lname: ''});
    const [answer, setAnswer] = useState('none');

    const handleChange = (e) => {
        setFormData({...formData, [e.target.name]: e.target.value});
    };
    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await fetch('https://webhook.site/158370c6-4ace-40c0-aa88-d701adcfd9df', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData),
            });
            console.log('Status:', response.status);
            if (!response.ok) {
                throw new Error(
                    `HTTP-Fehler! Status: ${response.status} `);
            }
            const data = await response.json();
            console.log('fname:', data.fname);
            console.log('lname:', data.lname);
            setAnswer(data.fname + ' ' + data.lname);
        } catch (error) {
            console.error('Fehler beim Senden der Anfrage:', error);
        }
    };

    return (
        <>
            <form onSubmit={handleSubmit}>
                <input name="fname" value={formData.fname} onChange={handleChange} placeholder="First Name"/><br/>
                <input name="lname" value={formData.lname} onChange={handleChange} placeholder="Last Name"/><br/>
                <button type="submit">Submit</button>
            </form>
            <output>{answer}</output>
        </>
    );
}
