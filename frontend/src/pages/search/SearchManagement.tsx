import ProductGrid from "./components/ProductGrid";
import SearchBarMainLayout from "./components/SearchBarMainLayout";

export default function SearchManagement() {
  return (
    <div className="min-h-screen flex flex-col">
      <SearchBarMainLayout />
      <ProductGrid />
    </div>
  );
}
