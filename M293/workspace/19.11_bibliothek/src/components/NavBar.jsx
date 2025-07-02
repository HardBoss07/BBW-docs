import { useState } from "react";

export default function NavBar() {
    const [open, setOpen] = useState(false);

    return (
        <nav className="navbar">
            <div className="navbar-toggle" onClick={() => setOpen(!open)}>
                ☰
            </div>
            <div className={`navbar-links ${open ? "open" : ""}`}>
                <a href="/">Page 1</a>
                <a href="/">Page 2</a>
                <a href="/">Page 3</a>
            </div>
        </nav>
    );
}
