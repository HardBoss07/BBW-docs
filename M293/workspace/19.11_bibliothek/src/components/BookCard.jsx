/**
 * A BookCard component that displays a book's cover image, title, and author.
 * @param book
 * @returns {JSX.Element}
 */
export default function BookCard({ book }) {
  return (
    <div className="book-card">
      <img src={book.cover} alt={book.title} />
      <div className="info">
        <h3>{book.title}</h3>
        <p>{book.author}</p>
      </div>
    </div>
  );
}
