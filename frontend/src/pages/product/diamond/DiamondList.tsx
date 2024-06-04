import { Pagination, Skeleton } from "antd";
import { GET } from "../../../utils/request";
import { useQueries } from "@tanstack/react-query";
import { useNavigate } from "react-router-dom";
import DiamondItem from "./components/DiamondItem";
import SortItem from "./components/SortItem";
import Filter from "./components/Filter";
import { useSearchStore } from "../../../store/searchStore";
import { useEffect } from "react";
import scrollTo from "../../../utils/scroll";
import { getDiamondPrice } from "../../../utils/getPrice";

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
  // scrollTo("table-header");
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  console.log("query url: " + queryUrl);
  useEffect(() => {
    setQueryUrl("/api/Diamonds?");
  }, []);

  const [diamond, diamondPrice] = useQueries({
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
    ],
  });

  if (diamond?.data && diamondPrice?.data) {
    console.log("i am bug");
    console.log(diamond?.data);
  }

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
          {(diamond?.isLoading || diamondPrice?.isLoading) && (
            <Skeleton
              active
              paragraph={{
                rows: 20,
              }}
            />
          )}
          {diamond?.data &&
            diamondPrice?.data &&
            diamond?.data?.diamonds?.map((diamond: any, index: number) => {
              return (
                <DiamondItem
                  key={index}
                  diamond={diamond}
                  price={getDiamondPrice(
                    diamond,
                    diamondPrice.data
                  ).toLocaleString("en-US", {
                    style: "currency",
                    currency: "USD",
                    maximumFractionDigits: 0,
                  })}
                />
              );
            })}
        </div>
        <div className="mt-10 flex justify-center">
          {diamond?.data && diamond?.data.diamonds.length == 0 ? (
            <div className="text-center text-2xl">No Diamonds Found.</div>
          ) : (
            <Pagination
              showTotal={(total, range) =>
                `${range[0]}-${range[1]} of ${total} items`
              }
              current={Number(params.get("PageNumber")) || 1}
              defaultCurrent={
                (diamond?.data && diamond?.data.currentPage.toString()) || "1"
              }
              total={diamond?.data && diamond?.data.totalCount}
              pageSize={Number(params.get("PageSize")) || 20}
              showSizeChanger={false}
              onChange={(page, _pageSize) => {
                scrollTo("table-header");
                params.set("PageNumber", page.toString());
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
