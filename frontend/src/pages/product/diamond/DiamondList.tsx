import { Pagination, Skeleton } from "antd";
import { GET } from "../../../utils/request";
import { useQuery } from "@tanstack/react-query";
import { useNavigate } from "react-router-dom";
import DiamondItem from "./components/DiamondItem";
import SortItem from "./components/SortItem";
import Filter from "./components/Filter";
import { useSearchStore } from "../../../store/searchStore";
import { useEffect } from "react";
import scrollTo from "../../../utils/scroll";

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
  scrollTo("table-header");
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  console.log("query url: " + queryUrl);
  useEffect(() => {
    setQueryUrl("/api/Diamonds?");
  }, []);
  const { data, isLoading } = useQuery({
    queryKey: ["diamonds", queryUrl],
    queryFn: () => GET(queryUrl),
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
          {isLoading && (
            <Skeleton
              active
              paragraph={{
                rows: 20,
              }}
            />
          )}
          {data &&
            data.diamonds.map((diamond: any) => {
              return (
                <DiamondItem
                  key={diamond.certificateNumber}
                  diamond={diamond}
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
            defaultCurrent={(data && data.currentPage.toString()) || "1"}
            total={data && data.totalCount}
            pageSize={Number(params.get("PageSize")) || 20}
            showSizeChanger={false}
            onChange={(page, _pageSize) => {
              scrollTo("table-header");
              params.set("PageNumber", page.toString());
              navigate(url.pathname + "?" + params.toString());
              setQueryUrl("/api/Diamonds?" + params.toString());
            }}
          />
        </div>
      </div>
    </div>
  );
}
