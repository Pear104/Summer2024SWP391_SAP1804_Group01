export default function SearchBarMainLayout() {
  return (
    <div className="bg-gray-100 p-4">
      <div className="container mx-auto">
        <input
          type="text"
          placeholder="Search..."
          className="w-full p-2 border border-gray-300 rounded"
        />
      </div>
    </div>
  );
}
