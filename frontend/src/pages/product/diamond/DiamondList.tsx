import { Pagination, Skeleton } from "antd";
import { GET } from "../../../utils/request";
import { useQueries } from "@tanstack/react-query";
import { useLocation, useNavigate } from "react-router-dom";
import DiamondItem from "./components/DiamondItem";
import SortItem from "./components/SortItem";
import Filter from "./components/Filter";
import { useSearchStore } from "../../../store/searchStore";
import { useEffect } from "react";
import scrollTo from "../../../utils/scroll";
import { getDiamondPrice } from "../../../utils/getPrice";
import LoadingItem from "./components/LoadingItem";

export default function DiamondList() {
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);

  const properties = [
    "Shape",
    "Price",
    "Carat",
    "Color",
    "Clarity",
    "Cut",
    "Lab",
  ];

  const navigate = useNavigate();
  const location = useLocation();
  // scrollTo("table-header");
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  console.log("query url: " + queryUrl);
  useEffect(() => {
    setQueryUrl(`/api/Diamonds${location.search}`);
  }, []);

  const [diamond, diamondPrice, priceRate] = useQueries({
    queries: [
      {
        queryKey: ["diamonds", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: Infinity,
      },
      {
        queryKey: ["diamondPrices"],
        queryFn: () => GET("/api/DiamondPrices/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["priceRate"],
        queryFn: () => GET("/api/PriceRate/latest"),
      },
    ],
  });

  return (
    <div className="flex items-center justify-around flex-col mb-20">
      <Filter />
      <div
        className="font-bold text-3xl libre-baskerville-regular"
        id="table-header"
      >
        DATJ's DIAMOND PRODUCTS
      </div>
      <div className="w-full px-20 mt-10">
        <div className="border-y border-black py-5 font-bold mulish-regular flex items-center w-full justify-around mb-4">
          <div className="w-[100px] text-center justify-center">View</div>
          {properties.map((property) => {
            return (
              <SortItem
                type="diamond"
                key={property}
                property={property}
                params={params}
                setQueryUrl={setQueryUrl}
              />
            );
          })}
          <div className="w-[80px] text-center flex gap-2 items-center justify-center">
            Detail
          </div>
        </div>
        <div>
          {diamond?.isLoading &&
            [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].map((key) => (
              <LoadingItem key={key} />
            ))}
          {diamond?.data?.diamonds?.map((diamond: Diamond, index: number) => (
            <DiamondItem
              key={index}
              diamond={diamond}
              price={
                diamondPrice?.data && priceRate?.data ? (
                  getDiamondPrice(
                    diamond,
                    diamondPrice.data,
                    priceRate?.data.percent
                  ).toLocaleString("en-US", {
                    style: "currency",
                    currency: "USD",
                    maximumFractionDigits: 0,
                  })
                ) : (
                  <Skeleton.Input active={true} size={"small"} />
                )
              }
            />
          ))}
        </div>
        <div className="mt-10 flex justify-center">
          {diamond?.data && diamond?.data.diamonds?.length == 0 ? (
            <section className="bg-white dark:bg-gray-900">
              <div className="py-8 px-4 mx-auto max-w-screen-xl lg:py-16 lg:px-6">
                <div className="mx-auto max-w-screen-sm text-center">
                  <h1 className="mb-4 text-7xl tracking-tight font-extrabold lg:text-9xl text-primary-600 dark:text-primary-500">
                    Oops
                  </h1>
                  <p className="mb-4 text-3xl tracking-tight font-bold text-gray-900 md:text-4xl dark:text-white pt-3">
                    There is no diamonds available
                  </p>
                  <p className="mb-4 text-lg font-light text-gray-500 dark:text-gray-400">
                    Sorry for this inconvenience. Please come back later.
                  </p>
                </div>
              </div>
            </section>
          ) : (
            <Pagination
              showTotal={(total, range) =>
                `${range[0]}-${range[1]} of ${total} items`
              }
              current={Number(params.get("PageNumber")) || 1}
              defaultCurrent={
                (diamond?.data && diamond?.data.currentPage?.toString()) || "1"
              }
              total={diamond?.data && diamond?.data.totalCount}
              pageSize={Number(params.get("PageSize")) || 10}
              showSizeChanger={false}
              onChange={(page, _pageSize) => {
                scrollTo("table-header");
                params.set("PageNumber", page.toString());
                params.set("IsAvailability", "true");
                navigate(url.pathname + "?" + params.toString());
                setQueryUrl("/api/Diamonds?" + params.toString());
              }}
            />
          )}
        </div>
      </div>
    </div>
  );
}
