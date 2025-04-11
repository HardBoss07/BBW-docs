export default function Dropdown({ label, name, value, onChange, options }) {
    return (
        <label>
            {label}:
            <select name={name} value={value} onChange={onChange} required>
                <option value="">Bitte wählen</option>
                {options.map((opt) => (
                    <option key={opt} value={opt}>
                        {opt}
                    </option>
                ))}
            </select>
        </label>
    );
}
