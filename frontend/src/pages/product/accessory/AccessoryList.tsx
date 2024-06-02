import { Pagination, Skeleton } from "antd";
import { useEffect } from "react";
import { GET } from "../../../utils/request";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";
import { useQuery } from "@tanstack/react-query";
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
  const { data, isLoading, error } = useQuery({
    queryKey: ["accessories", queryUrl],
    queryFn: () => GET(queryUrl),
  });

  if (isLoading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error: {error.message}</div>;
  }

  return (
    <div className="flex items-center justify-around flex-col mb-20 px-36">
      <div className="w-[400] px-20">
        <div>Showing {data.accessories.length} of products</div>
        <div className="font-bold text-3xl libre-baskerville-regular flex justify-around my-10">
          DATJ's ACCESSORY PRODUCTS
        </div>

        <div className="grid grid-cols-4 gap-3">
          {data &&
            data.accessories.map((accessory: any) => {
              return (
                <AccessoryItem
                  key={accessory.accessoryId}
                  accessory={accessory}
                />
              );
            })}
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
        </div>
        <div className="mt-10 flex justify-center">
          <Pagination
            showTotal={(total, range) =>
              `${range[0]}-${range[1]} of ${total} items`
            }
            current={Number(params.get("PageNumber")) || 1}
            defaultCurrent={
              (data && data.currentPage && data.currentPage.toString()) || "1"
            }
            total={data && data.totalCount}
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
    </div>
  );
}
