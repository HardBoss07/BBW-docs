/**
 * CurrencyCheckboxComponent.jsx
 * @author Matteo Bosshard
 * @version 05.03.2025
 */
export default function CurrencyCheckbox({currency, checked, onChange })   {
    return (
        <label className="checkbox">
            <input
                type="checkbox"
                checked={checked}
                onChange={() => onChange(currency)}
            />
            Convert to {currency.toUpperCase()}
        </label>
    );
}