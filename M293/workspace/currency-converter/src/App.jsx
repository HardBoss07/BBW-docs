/**
 * App.jsx
 * @author Matteo Bosshard
 * @version 19.02.2025
 */

import {useState} from 'react';
import './App.css';

function App() {
    const [chf, setCHF] = useState('');
    const [result, setResult] = useState('');
    const [checked, setChecked] = useState({
        usd: false,
        eur: false,
        jpy: false,
    });

    const exchangeRates = {
        usd: 1.11,
        eur: 1.06,
        jpy: 168.04
    };

    const handleCheckboxChange = (currency) => {
        setChecked(prevState => ({
            ...prevState,
            [currency]: !prevState[currency]
        }));
    };

    const convert = () => {
        if (!chf || isNaN(chf) || chf <= 0) {
            setResult('Please enter a valid CHF amount.');
            return;
        }

        let conversions = [];
        Object.keys(checked).forEach((currency) => {
            if (checked[currency]) {
                let convertedValue = (parseFloat(chf) * exchangeRates[currency]).toFixed(2);
                conversions.push(`${chf} CHF is converted to ${convertedValue} ${currency.toUpperCase()}`);
            }
        });

        setResult(conversions.length > 0 ? conversions.join('\n') : 'No currency selected.');
    };

    return (
        <>
            <div className="header">
                <h1>Currency Converter by Matteo Bosshard</h1>
                <img src="../public/img.png" alt="currency image"/>
            </div>
            <div className="main">
                <input
                    type="number"
                    value={chf}
                    onChange={(e) => setCHF(e.target.value)}
                    placeholder="Enter CHF amount"
                />
                <br/>
                <label className="checkbox">
                    <input
                        type="checkbox"
                        checked={checked.usd}
                        onChange={() => handleCheckboxChange('usd')}
                    />
                    Convert to USD
                </label>
                <label className="checkbox">
                    <input
                        type="checkbox"
                        checked={checked.eur}
                        onChange={() => handleCheckboxChange('eur')}
                    />
                    Convert to EUR
                </label>
                <label className="checkbox">
                    <input
                        type="checkbox"
                        checked={checked.jpy}
                        onChange={() => handleCheckboxChange('jpy')}
                    />
                    Convert to JPY
                </label>
            </div>
            <div className="result">
                <button className="button" onClick={convert}>
                    Convert CHF to Selected Currencies
                </button>

                <h2>Conversions</h2>
                <pre>{result}</pre>
            </div>
        </>
    );
}

export default App;
