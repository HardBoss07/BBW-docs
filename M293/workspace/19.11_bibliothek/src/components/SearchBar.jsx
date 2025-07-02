export default function SearchBar({search, setSearch}) {
    return (
        <div className="search-bar">
            <input
                type="text"
                placeholder="Buchtitel suchen..."
                value={search}
                onChange={(e) => setSearch(e.target.value)}
            />
        </div>
    );
}