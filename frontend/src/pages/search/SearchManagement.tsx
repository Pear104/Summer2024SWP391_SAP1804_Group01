import ProductGrid from "./components/ProductGrid";
import SearchBarMainLayout from "./components/SearchBarMainLayout";

export default function SearchManagement() {
  return (
    <div className="min-h-screen flex flex-col">
      <div className="px-96 py-24">
        {" "}
        <SearchBarMainLayout />
      </div>
      <ProductGrid />
    </div>
  );
}
