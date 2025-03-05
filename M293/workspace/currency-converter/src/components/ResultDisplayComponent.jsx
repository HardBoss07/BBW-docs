/**
 * ResultDisplayComponent.jsx
 * @author Matteo Bosshard
 * @version 05.03.2025
 */
export default function ResultDisplay({ result }) {
    return (
        <div className="result">
            <h2>Conversions</h2>
            <pre>{result}</pre>
        </div>
    );
}
