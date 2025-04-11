export default function RadioGroup ({ label, name, options, selected, onChange }) {
    return (
        <fieldset>
            <legend>{label}</legend>
            {options.map((option) => (
                <label key={option}>
                    <input
                        type="radio"
                        name={name}
                        value={option}
                        checked={selected === option}
                        onChange={onChange}
                        required
                    />
                    {option}
                </label>
            ))}
        </fieldset>
    );
}
