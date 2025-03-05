/**
 * App.jsx
 * @author Matteo Bosshard
 * @version 05.03.2025
 */
import { useState } from 'react';
import './App.css';
import Header from "./components/HeaderComponent.jsx";
import CurrencyCheckbox from "./components/CurrencyCheckboxComponent.jsx";
import ResultDisplay from "./components/ResultDisplayComponent.jsx";
import CurrencyInput from "./components/CurrencyInputComponent.jsx";
import ButtonComponent from "./components/ButtonComponent.jsx";

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
        jpy: 168.04,
    };

    const handleCheckboxChange = (currency) => {
        setChecked((prevState) => ({
            ...prevState,
            [currency]: !prevState[currency],
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
                const convertedValue = (parseFloat(chf) * exchangeRates[currency]).toFixed(2);
                conversions.push(`${chf} CHF is converted to ${convertedValue} ${currency.toUpperCase()}`);
            }
        });

        setResult(conversions.length > 0 ? conversions.join('\n') : 'No currency selected.');
    };

    const clear = () => {
        setCHF('');
        setChecked({
            usd: false,
            eur: false,
            jpy: false,
        });
        setResult('');
    };

    return (
        <>
            <Header />
            <div className="main">
                <CurrencyInput value={chf} onChange={(e) => setCHF(e.target.value)} />
                <CurrencyCheckbox currency="usd" checked={checked.usd} onChange={handleCheckboxChange} />
                <CurrencyCheckbox currency="eur" checked={checked.eur} onChange={handleCheckboxChange} />
                <CurrencyCheckbox currency="jpy" checked={checked.jpy} onChange={handleCheckboxChange} />
            </div>
            <div className="result">
                <ButtonComponent text={"Convert CHF to Selected Currencies"} onClick={convert} />
                <ButtonComponent text={"Clear"} onClick={clear} />

                <ResultDisplay result={result} />
            </div>
        </>
    );
}

export default App;