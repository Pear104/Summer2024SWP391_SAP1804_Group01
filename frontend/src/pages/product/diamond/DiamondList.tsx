import { Pagination, Skeleton } from "antd";
import { useState } from "react";
import { GET } from "../../../utils/request";
import { useQuery } from "@tanstack/react-query";
import { useNavigate } from "react-router-dom";
import DiamondItem from "./components/DiamondItem";
import SortItem from "./components/SortItem";
import Filter from "./components/Filter";

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

  const [filterProperty, setFilterProperty] = useState();
  const [queryUrl, setQueryUrl] = useState(
    "/api/Diamonds?" + params.toString()
  );

  const { data, isLoading } = useQuery({
    queryKey: ["diamonds", filterProperty, queryUrl],
    queryFn: () => GET(queryUrl),
  });

  return (
    <div className="flex items-center justify-around flex-col mb-20">
      <Filter />
      <div className="font-bold" id="table-header">
        Diamond table
      </div>
      <div className="w-full px-20 mt-10">
        <div className="font-bold mulish-regular flex items-center w-full justify-around mb-4">
          <div className="w-[100px] text-center">View</div>
          {properties.map((property) => {
            return (
              <SortItem
                key={property}
                property={property}
                params={params}
                setFilterProperty={setFilterProperty}
              />
            );
          })}
          <div className="w-[80px] text-center flex gap-2 items-center">
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
              document
                .getElementById("table-header")
                ?.scrollIntoView({ block: "end", behavior: "smooth" });
              params.set("PageNumber", page.toString());
              url.search = params.toString();
              setQueryUrl("/api/Diamonds?" + params.toString());
              navigate(url.pathname + "?" + params.toString());
            }}
          />
        </div>
      </div>
    </div>
  );
}
