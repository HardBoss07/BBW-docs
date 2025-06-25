import { useState } from 'react'
import './css/library.css'
import {books} from "./components/Books.jsx";
import BookCard from "./components/BookCard.jsx";

function App() {
  return (
    <>
        <header className="header">
            <h1>Meine Bibliothek</h1>
        </header>
        <div className="book-list">
            {books.map(book => (
                <BookCard key={book.id} book={book} />
            ))}
        </div>
    </>
  )
}

export default App
