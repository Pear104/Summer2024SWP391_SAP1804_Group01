import { useQueries } from "@tanstack/react-query";
import DiamondCard from "./DiamondCard";
import AccessoryCard from "./AccessoryCard";
import { useLocation, useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";
import { useEffect } from "react";
import { GET } from "../../../utils/request";
import { Pagination } from "antd";

export default function ProductGrid() {
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const location = useLocation();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  useEffect(() => {
    setQueryUrl(`/api/Search${location.search}`);
  }, [location.search, setQueryUrl]);

  const [productsQuery] = useQueries({
    queries: [
      {
        queryKey: ["products", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: 0,
      },
    ],
  });
  const products = productsQuery.data;
  return (
    <div className="container mx-auto p-4">
      <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
        {products?.diamonds?.map((diamond: any) => (
          <DiamondCard key={diamond.diamondId} diamond={diamond} />
        ))}
        {products?.accessorys?.map((accessory: any) => (
          <AccessoryCard key={accessory.accessoryId} accessory={accessory} />
        ))}
      </div>
      <div className="mt-10 flex justify-center">
        {products &&
        products.diamonds?.length == 0 &&
        products.accessories?.length == 0 ? (
          <div className="text-center text-2xl">No Diamonds Found.</div>
        ) : (
          <Pagination
            showTotal={(total, range) =>
              `${range[0]}-${range[1]} of ${total} items`
            }
            current={Number(params.get("PageNumber")) || 1}
            defaultCurrent={
              (products && products?.currentPage?.toString()) || "1"
            }
            total={products && products.totalCount}
            pageSize={Number(params.get("PageSize")) || 10}
            showSizeChanger={false}
            onChange={(page, _pageSize) => {
              params.set("PageNumber", page.toString());
              navigate(url.pathname + "?" + params.toString());
              setQueryUrl("/api/Search?" + params.toString());
            }}
          />
        )}
      </div>
    </div>
  );
}
