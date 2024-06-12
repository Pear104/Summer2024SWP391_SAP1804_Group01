import { Pagination, Skeleton } from "antd";
import { useEffect } from "react";
import { GET } from "../../../utils/request";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";
import { useQueries } from "@tanstack/react-query";
import AccessoryItem from "./AccessoryItem";
import { getAccessoryPrice } from "../../../utils/getPrice";

export default function AccessoryList() {
  useEffect(() => {
    setQueryUrl("/api/Accessories?");
  }, []);

  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);

  const [accessories, materialPrice, priceRate] = useQueries({
    queries: [
      {
        queryKey: ["accessories", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: Infinity,
      },
      {
        queryKey: ["materialPrice"],
        queryFn: () => GET("/api/MaterialPrices/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["priceRate"],
        queryFn: () => GET("/api/PriceRate/latest"),
      },
    ],
  });

  if (accessories.error) {
    return <div>Error: {accessories.error.message}</div>;
  }

  return (
    <div className="flex items-center justify-around flex-col mb-20 px-20">
      <div className="w-full">
        <div className="font-bold text-3xl libre-baskerville-regular flex justify-around my-10">
          DATJ's ACCESSORY PRODUCTS
        </div>
        {accessories.isLoading && (
          <Skeleton
            active
            paragraph={{
              rows: 20,
            }}
          />
        )}
        {accessories?.data && (
          <>
            <div className="grid grid-cols-4 gap-3">
              {accessories.data.accessories.map((accessory: any) => {
                return (
                  <AccessoryItem
                    key={accessory.accessoryId}
                    accessory={accessory}
                    price={
                      materialPrice?.data && priceRate?.data
                        ? getAccessoryPrice(
                            accessory,
                            materialPrice.data,
                            3,
                            priceRate?.data.percent
                          ).toLocaleString("en-US", {
                            style: "currency",
                            currency: "USD",
                            maximumFractionDigits: 0,
                          })
                        : 0
                    }
                  />
                );
              })}
            </div>
            <div className="mt-10 flex justify-center">
              <Pagination
                showTotal={(total, range) =>
                  `${range[0]}-${range[1]} of ${total} items`
                }
                current={Number(params.get("PageNumber")) || 1}
                defaultCurrent={
                  (accessories?.data &&
                    accessories?.data.currentPage.toString()) ||
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
          </>
        )}
      </div>
    </div>
  );
}
