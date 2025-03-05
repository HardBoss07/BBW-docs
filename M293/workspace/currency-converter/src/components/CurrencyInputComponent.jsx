/**
 * CurrencyInputComponent.jsx
 * @author Matteo Bosshard
 * @version 05.03.2025
 */
export default function CurrencyInput({ value, onChange }) {
    return (
        <input
            type="number"
            value={value}
            onChange={onChange}
            placeholder="Enter CHF amount"
        />
    );
}

