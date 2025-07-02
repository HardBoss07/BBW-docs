import {useState, useMemo} from 'react';
import './css/library.css';
import {books} from './components/Books.jsx';
import BookCard from './components/BookCard.jsx';
import SearchBar from './components/SearchBar.jsx';
import NavBar from "./components/NavBar.jsx";

function App() {
    const [search, setSearch] = useState("");

    const filteredBooks = useMemo(() => {
        const lower = search.toLowerCase();
        return books.filter((b) => b.title.toLowerCase().includes(lower));
    }, [search]);

    return (
        <>
            <NavBar/>
            <header className="header">
                <h1>Meine Bibliothek</h1>
            </header>

            <div className="main-content">
                <aside className="side-menu">
                    <SearchBar search={search} setSearch={setSearch}/>
                </aside>

                <main className="items">
                    {filteredBooks.map(book => (
                        <BookCard key={book.id} book={book}/>
                    ))}
                </main>
            </div>
        </>
    );
}

export default App;
