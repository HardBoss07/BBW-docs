export default function InputComponent({ title, value, onChange }) {
    return (
        <div>
            <h4>{title}</h4>
            <input type="number" min="0" value={value} onChange={onChange} />
        </div>
    );
}
