import { Pagination, Skeleton } from "antd";
import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";
import { useQuery } from "@tanstack/react-query";
import { ChevronDown } from "lucide-react";
import { useNavigate } from "react-router-dom";

const DiamondItem = ({ diamond }: { diamond: any }) => {
  return (
    <a
      className="flex items-center w-full justify-around hover:bg-slate-100"
      href="/product/diamond/detail"
    >
      <div
        className="my-2 aspect-square bg-cover bg-center bg-no-repeat w-[100px]"
        style={{
          // backgroundImage: `url(/images/face-without-mouth_1f636.png)`,
          backgroundImage: `url(${diamond.imageUrl})`,
        }}
      ></div>
      <div className="w-[80px] flex justify-center">{diamond.shape}</div>
      <div className="w-[80px] flex justify-center">Price</div>
      <div className="w-[80px] flex justify-center">{diamond.carat}</div>
      <div className="w-[80px] flex justify-center">{diamond.color}</div>
      <div className="w-[80px] flex justify-center">{diamond.clarity}</div>
      <div className="w-[80px] flex justify-center">{diamond.cut}</div>
      <div className="w-[80px] flex justify-center">{diamond.lab}</div>
      <div className="w-[80px] flex justify-center">
        <div className="border-2 border-stone-800 hover:font-bold rounded-full px-4 py-2 text-sm hover:bg-black hover:text-white transition-all">
          VIEW
        </div>
      </div>
    </a>
  );
};

const HeaderFilterItem = ({
  property,
  params,
  setFilterProperty,
  setQueryUrl,
  url,
}: {
  property: string;
  url: URL;
  params: URLSearchParams;
  setFilterProperty: any;
  setQueryUrl: any;
}) => {
  const navigate = useNavigate();
  return (
    <div
      className="w-[80px] text-center flex gap-2 items-center"
      onClick={() => {
        setFilterProperty(property);
        params.set("SortBy", property);
        // url.search = params.toString();
        console.log(params.toString());
        // navigate(url.toString());
        navigate("/product/diamond?" + params.toString());
        // setQueryUrl("/api/Diamonds?" + params.toString());
        // console.log(params.toString());
      }}
    >
      {property} <ChevronDown size={20} />
    </div>
  );
};

export default function DiamondList() {
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);

  const navigate = useNavigate();

  const [filterProperty, setFilterProperty] = useState();
  const [queryUrl, setQueryUrl] = useState("/api/Diamonds");

  const { data, isLoading } = useQuery({
    queryKey: ["diamonds", filterProperty, queryUrl],
    queryFn: () => GET(queryUrl),
  });

  return (
    <div className="flex items-center justify-around flex-col mb-20">
      <div className="font-bold" id="table-header">
        Diamond table
      </div>
      <div className="w-full px-20 mt-10">
        <div className="font-bold mulish-regular flex items-center w-full justify-around mb-4">
          <div className="w-[100px] text-center">View</div>
          <HeaderFilterItem
            property="Shape"
            url={url}
            params={params}
            setFilterProperty={setFilterProperty}
            setQueryUrl={setQueryUrl}
          />
          <HeaderFilterItem
            property="Price"
            url={url}
            params={params}
            setQueryUrl={setQueryUrl}
            setFilterProperty={setFilterProperty}
          />
          <HeaderFilterItem
            property="Carat"
            url={url}
            params={params}
            setQueryUrl={setQueryUrl}
            setFilterProperty={setFilterProperty}
          />
          <HeaderFilterItem
            property="Color"
            url={url}
            params={params}
            setQueryUrl={setQueryUrl}
            setFilterProperty={setFilterProperty}
          />
          <HeaderFilterItem
            property="Clarity"
            url={url}
            params={params}
            setQueryUrl={setQueryUrl}
            setFilterProperty={setFilterProperty}
          />
          <HeaderFilterItem
            property="Cut"
            url={url}
            params={params}
            setQueryUrl={setQueryUrl}
            setFilterProperty={setFilterProperty}
          />
          <HeaderFilterItem
            property="Lab"
            url={url}
            params={params}
            setQueryUrl={setQueryUrl}
            setFilterProperty={setFilterProperty}
          />
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
            current={Number(params.get("PageNumber")) || 1}
            defaultCurrent={(data && data.currentPage.toString()) || "1"}
            total={data && data.totalCount}
            pageSize={Number(params.get("PageSize")) || 20}
            showSizeChanger={false}
            onChange={(page, pageSize) => {
              document
                .getElementById("table-header")
                ?.scrollIntoView({ block: "end", behavior: "smooth" });
              params.set("PageNumber", page.toString());
              url.search = params.toString();
              setQueryUrl("/api/Diamonds?" + params.toString());
              console.log(url.pathname + "?" + params.toString());
              navigate(url.pathname + "?" + params.toString());
            }}
          />
        </div>
      </div>
    </div>
  );
}
