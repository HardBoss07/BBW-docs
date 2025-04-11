import { useState } from 'react'
import TextInput from "./components/TextInput.jsx";
import Dropdown from "./components/Dropdown.jsx";
import RadioGroup from "./components/RadioGroup.jsx";
import './App.css'

function App() {
  const [formData, setFormData] = useState({
      nachname: '',
      vorname: '',
      datum: '',
      beruf: '',
      geschlecht: '',
  });

    const handleChange = (e) => {
        const { name, value } = e.target
        setFormData({ ...formData, [name]: value })
    }

    const handleSubmit = async (e) => {
        e.preventDefault()

        try {
            const response = await fetch('https://webhook.site/158370c6-4ace-40c0-aa88-d701adcfd9df', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(formData),
            })

            if (response.ok) {
                alert('Formular erfolgreich gesendet!')
            } else {
                alert('Fehler beim Senden.')
            }
        } catch (error) {
            alert('Netzwerkfehler: ' + error.message)
        }
    }

    return (
        <div className="form-wrapper">
            <h1>Formular</h1>
            <form onSubmit={handleSubmit}>
                <TextInput
                    label="Nachname"
                    name="nachname"
                    value={formData.nachname}
                    onChange={handleChange}
                />
                <TextInput
                    label="Vorname"
                    name="vorname"
                    value={formData.vorname}
                    onChange={handleChange}
                />
                <label>
                    Datum:
                    <input
                        type="date"
                        name="datum"
                        value={formData.datum}
                        onChange={handleChange}
                        required
                    />
                </label>

                <RadioGroup
                    name="beruf"
                    label="Berufswahl"
                    options={[
                        'ApplikationsentwicklerIn',
                        'PlattformentwicklerIn',
                        'EntwicklerIn Digital Business',
                    ]}
                    selected={formData.beruf}
                    onChange={handleChange}
                />

                <Dropdown
                    label="Geschlecht"
                    name="geschlecht"
                    value={formData.geschlecht}
                    onChange={handleChange}
                    options={['Männlich', 'Weiblich', 'Divers']}
                />

                <button type="submit">Absenden</button>
            </form>
        </div>
    );
}

export default App
