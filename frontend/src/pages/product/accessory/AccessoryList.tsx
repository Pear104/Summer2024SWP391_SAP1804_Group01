import { Pagination } from "antd";
import { useEffect } from "react";
import { GET } from "../../../utils/request";
import { useLocation, useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";
import { useQueries } from "@tanstack/react-query";
import AccessoryItem from "./AccessoryItem";
import { getAccessoryPrice } from "../../../utils/getPrice";
import LoadingItem from "./components/LoadingItem";
import Filter from "./components/Filter";

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
      <Filter />
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
            {accessories?.data && accessories?.data.accessories?.length == 0 ? (
              <section className="bg-white dark:bg-gray-900">
                <div className="py-8 px-4 mx-auto max-w-screen-xl lg:py-16 lg:px-6">
                  <div className="mx-auto max-w-screen-sm text-center">
                    <h1 className="mb-4 text-7xl tracking-tight font-extrabold lg:text-9xl text-primary-600 dark:text-primary-500">
                      Oops
                    </h1>
                    <p className="mb-4 text-3xl tracking-tight font-bold text-gray-900 md:text-4xl dark:text-white pt-3">
                      There is no accessories available
                    </p>
                    <p className="mb-4 text-lg font-light text-gray-500 dark:text-gray-400">
                      Sorry for this inconvenience. Please come back later.
                    </p>
                  </div>
                </div>
              </section>
            ) : (
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
            )}
          </>
        )}
      </div>
    </div>
  );
}
