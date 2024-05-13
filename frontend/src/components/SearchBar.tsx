import { Search, X } from "lucide-react";
import { useState } from "react";

export default function SearchBar() {
  const [focus, setFocus] = useState(false);
  const [keyword, setKeyword] = useState("");
  return (
    <div
      className={`flex border-2 py-1 ${
        focus ? "border-black rounded-md" : "border-transparent"
      }`}
    >
      <form
        action="./search"
        method="GET"
        className="flex justify-end rounded-md overflow-hidden w-[240px]"
      >
        {focus && (
          <input
            type="text"
            placeholder="Search..."
            name="keyword"
            className="w-full px-4 outline-none"
            onBlur={() => {
              console.log("test 123");
              setFocus(false);
            }}
            onChange={(e) => {
              console.log(e.target.value);
              setKeyword(e.target.value);
            }}
          />
        )}
        <div
          className="text-black px-3 text-lg font-bold py-1"
          // type="submit"
          onClick={() => setFocus(!focus)}
        >
          {focus && keyword.length != 0 ? (
            <X size={20} absoluteStrokeWidth />
          ) : (
            <Search size={20} absoluteStrokeWidth />
          )}
        </div>
      </form>
    </div>
  );
}
