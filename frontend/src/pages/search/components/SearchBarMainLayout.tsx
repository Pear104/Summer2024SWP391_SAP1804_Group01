import { Search } from "lucide-react";
import { useState } from "react";

export default function SearchBarMainLayout() {
  const [_keyword, setKeyword] = useState("");
  return (
    <div className="border-2 py-1 border-slate-200 rounded-md md:min-w-[200px] md:fixed md:left-1/2 md:transform md:-translate-x-1/2">
      <form
        action="/search"
        method="GET"
        className="flex justify-end rounded-md overflow-hidden"
      >
        <input
          type="text"
          placeholder="Search..."
          name="keyword"
          className="w-full px-4 outline-none flex-grow"
          onChange={(e) => {
            setKeyword(e.target.value);
          }}
        />
        <button
          type="submit"
          className="flex justify-center items-center rounded-md cursor-pointer px-3"
        >
          <Search size={20} absoluteStrokeWidth />
        </button>
      </form>
    </div>
  );
}
