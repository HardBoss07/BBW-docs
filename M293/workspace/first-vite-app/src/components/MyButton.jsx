/**
 * MyButton
 * @author Matteo Bosshard
 * @version 19.02.2025
 */

export default function MyButton() {
    function onClick() {
        alert("This Button was Clicked!");
    }

    return (
        <>
            <h2>My Button</h2>
            <button onClick={onClick}>Click me!</button>
        </>
    )
}