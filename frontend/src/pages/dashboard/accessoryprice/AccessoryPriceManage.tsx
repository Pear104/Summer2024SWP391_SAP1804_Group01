import { Divider, Empty } from "antd";
import { useEffect } from "react";
// import MaterialPriceItem from "./components/MaterialPriceItem";
import MaterialPriceItem from "./components/MaterialPriceItem";
import { GET } from "../../../utils/request";
// import { useLocation, useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";
import { useQueries } from "@tanstack/react-query";

export default function AccessoryPriceManage() {
  // const location = useLocation();
  // const url = new URL(window.location.href);
  // const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);

  useEffect(() => {
    setQueryUrl("/api/MaterialPrices?");
  }, []);
  const [materialPriceList] = useQueries({
    queries: [
      {
        queryKey: ["materialPrices", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: 0,
      },
    ],
  });
  console.log(queryUrl);
  console.log(materialPriceList?.data);
  console.log(materialPriceList?.data?.length);
  const renderItemRateCard = (price: any) => (
    <MaterialPriceItem key={price.materialPriceId} materialItem={price} />
  );
  return (
    <div className="p-4">
      <div className="flex justify-between items-center mx-auto mb-8">
        <div className="flex justify-start space-x-1 items-center w-full">
          <Divider
            orientation="center"
            className="text-2xl font-semibold uppercase"
          >
            Material Price
          </Divider>
        </div>
      </div>
      <div className="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 justify-items-center">
        {materialPriceList?.data && materialPriceList?.data?.length > 0 ? (
          materialPriceList?.data?.map(renderItemRateCard)
        ) : (
          <td colSpan={100} className="py-20 w-full">
            <Empty description="No Price Rate Found" />
          </td>
        )}
      </div>
    </div>
  );
}
