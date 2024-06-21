import { useQueries } from "@tanstack/react-query";
import { useEffect, useState } from "react";
import { IoBagHandle, IoCart, IoPeople, IoPieChart } from "react-icons/io5";
import { GET } from "../../../utils/request";
import { useSearchStore } from "../../../store/searchStore";

export default function DashBoardStatsGrid() {
  const [data, setData] = useState<any>();
  useEffect(() => {
    (async () => {
      const data = await GET("/api/Report/BasicReport/");
      setData(data);
      console.log("startGriddata");
      console.log(data);
    })();
  }, []);

  return (
    <div className="flex gap-4 w-full">
      <BoxWrapper>
        <div className="rounded-full h-12 w-12 flex items-center justify-center bg-sky-500">
          <IoBagHandle className="text-2xl text-white" />
        </div>
        <div className="pl-4">
          <span className="text-sm text-gray-500 font-light">Total Sales</span>
          <div className="flex items-center">
            <strong className="text-xl text-gray-700 font-semibold">
              ${parseFloat(data?.totalSale).toFixed(2)}
            </strong>
            {/* <span className="text-sm text-green-500 pl-2">+234</span> */}
          </div>
        </div>
      </BoxWrapper>
      {/* <BoxWrapper>
        <div className="rounded-full h-12 w-12 flex items-center justify-center bg-orange-600">
          <IoPieChart className="text-2xl text-white" />
        </div>
        <div className="pl-4">
          <span className="text-sm text-gray-500 font-light">
            Total Expenses
          </span>
          <div className="flex items-center">
            <strong className="text-xl text-gray-700 font-semibold">
              $3423
            </strong>
            <span className="text-sm text-green-500 pl-2">-343</span>
          </div>
        </div>
      </BoxWrapper> */}
      <BoxWrapper>
        <div className="rounded-full h-12 w-12 flex items-center justify-center bg-yellow-400">
          <IoPeople className="text-2xl text-white" />
        </div>
        <div className="pl-4">
          <span className="text-sm text-gray-500 font-light">
            Total Customers
          </span>
          <div className="flex items-center">
            <strong className="text-xl text-gray-700 font-semibold">
              {data?.totalCustomer}
            </strong>
            {/* <span className="text-sm text-red-500 pl-2">-30</span> */}
          </div>
        </div>
      </BoxWrapper>
      <BoxWrapper>
        <div className="rounded-full h-12 w-12 flex items-center justify-center bg-green-600">
          <IoCart className="text-2xl text-white" />
        </div>
        <div className="pl-4">
          <span className="text-sm text-gray-500 font-light">Total Orders</span>
          <div className="flex items-center">
            <strong className="text-xl text-gray-700 font-semibold">
              {data?.totalOrder}
            </strong>
            {/* <span className="text-sm text-red-500 pl-2">-43</span> */}
          </div>
        </div>
      </BoxWrapper>
    </div>
  );
}
function BoxWrapper({ children }: { children: any }) {
  return (
    <div className="bg- rounded-sm p-4 flex-1 border border-gray-200 flex items-center">
      {children}
    </div>
  );
}
