import { Pagination, Skeleton } from "antd";
import { useEffect } from "react";
import { GET } from "../../../utils/request";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";
import { useQueries, useQuery } from "@tanstack/react-query";
import AccessoryItem from "./AccessoryItem";

export default function AccessoryList() {
  // const [accessories, setAccessories] = useState([]);

  useEffect(() => {
    setQueryUrl("/api/Accessories?");
  }, []);

  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);

  const [accessories, materialPrice] = useQueries({
    queries: [
      {
        queryKey: ["accessories"],
        queryFn: () => GET("/api/Accessories/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["materialPrice"],
        queryFn: () => GET("/api/MaterialPrices/"),
        staleTime: Infinity,
      },
    ],
  });

  if (accessories.isLoading) {
    return <div>Loading...</div>;
  }

  if (accessories.error) {
    return <div>Error: {accessories.error.message}</div>;
  }
  if (materialPrice.data) {
    console.log(materialPrice.data);
  }

  return (
    <div className="flex items-center justify-around flex-col mb-20 px-36">
      {accessories.data && materialPrice.data && (
        <div className="w-[400] px-20">
          <div>Showing {accessories.data.accessories.length} of products</div>
          <div className="font-bold text-3xl libre-baskerville-regular flex justify-around my-10">
            DATJ's ACCESSORY PRODUCTS
          </div>

          <div className="grid grid-cols-4 gap-3">
            {accessories.data.accessories.map((accessory: any) => {
              return (
                <AccessoryItem
                  key={accessory.accessoryId}
                  accessory={accessory}
                  price={(
                    materialPrice.data.find(
                      (price: any) => price.karat == accessory.karat
                    ).unitPrice * accessory.karat
                  ).toLocaleString("en-US", {
                    style: "currency",
                    currency: "USD",
                    maximumFractionDigits: 0,
                  })}
                />
              );
            })}
          </div>
          <div>
            {accessories.isLoading && (
              <Skeleton
                active
                paragraph={{
                  rows: 20,
                }}
              />
            )}
          </div>
          <div className="mt-10 flex justify-center">
            <Pagination
              showTotal={(total, range) =>
                `${range[0]}-${range[1]} of ${total} items`
              }
              current={Number(params.get("PageNumber")) || 1}
              defaultCurrent={
                (accessories.data.currentPage &&
                  accessories.data.currentPage.toString()) ||
                "1"
              }
              total={accessories.data.totalCount}
              pageSize={Number(params.get("PageSize")) || 20}
              showSizeChanger={false}
              onChange={(page, _pageSize) => {
                params.set("PageNumber", page.toString());
                navigate(url.pathname + "?" + params.toString());
                setQueryUrl("/api/Accessories?" + params.toString());
              }}
            />
          </div>
        </div>
      )}
    </div>
  );
}
