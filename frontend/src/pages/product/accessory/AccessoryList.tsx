import { Pagination, Skeleton } from "antd";
import { useEffect } from "react";
import { GET } from "../../../utils/request";
import { useLocation, useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";
import { useQueries } from "@tanstack/react-query";
import AccessoryItem from "./AccessoryItem";
import { getAccessoryPrice } from "../../../utils/getPrice";
import LoadingItem from "./components/LoadingItem";

export default function AccessoryList() {
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const location = useLocation();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  useEffect(() => {
    setQueryUrl(`/api/Accessories${location.search}`);
  }, []);

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

  return (
    <div className="flex items-center justify-around flex-col mb-20 px-20">
      <div className="w-full">
        <div className="font-bold text-3xl libre-baskerville-regular flex justify-around my-10">
          DATJ's ACCESSORY PRODUCTS
        </div>

        {accessories.isLoading && (
          <div className="grid grid-cols-4 gap-x-3 gap-y-10">
            {/* Fake 12 loading items */}
            {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].map((item) => (
              <LoadingItem key={item} />
            ))}
          </div>
        )}
        {accessories?.data && (
          <>
            <div className="grid grid-cols-4 gap-x-3">
              {accessories?.data?.accessories?.map((accessory: any) => (
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
              ))}
            </div>
            <div className="mt-10 flex justify-center">
              <Pagination
                showTotal={(total, range) =>
                  `${range[0]}-${range[1]} of ${total} items`
                }
                current={Number(params.get("PageNumber")) || 1}
                defaultCurrent={
                  (accessories?.data &&
                    accessories?.data?.currentPage?.toString()) ||
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
