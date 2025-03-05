/**
 * HeaderComponent.jsx
 * @author Matteo Bosshard
 * @version 05.03.2025
 */
export default function ButtonComponent({ text, onClick }) {
    return (
        <div>
            <button className="button" onClick={onClick}>
                {text}
            </button>
        </div>
    );
}