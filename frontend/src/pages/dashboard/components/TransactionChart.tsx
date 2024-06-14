import React, { useEffect, useState } from "react";
import axios from "axios";
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from "recharts";
import { GET } from "../../../utils/request";

const TransactionChart: React.FC = () => {
  const [data, setData] = useState([]);
  const [formattedData, setFormattedData] = useState([]);
  const getMonthName = (monthNumber: number) => {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[monthNumber - 1];
  };
  useEffect(() => {
    (async () => {
      const data = await GET("/api/Transactions");
      setData(data);
      const formattedData = data.map((item: any) => ({
        name: getMonthName(item.month),
        Income: item.income,
      }));
      setFormattedData(formattedData);
    })();
  }, []);
  console.log("DATA");
  console.log(data);
  console.log(formattedData);
  return (
    <div className="h-[22rem] bg-white p-4 rounded-sm border border-gray-200 flex flex-col flex-1 items-center">
      <div className="items-center flex flex-col">
        <strong className="text-gray-700 font-medium">Transactions</strong>
        <div className="mt-3 w-full flex-1 text-xs">
          {/* <ResponsiveContainer width="100%" height="100%"> */}
          <BarChart
            className="items-center"
            width={700}
            height={300}
            data={formattedData}
            margin={{
              top: 20,
              right: 10,
              left: -10,
              bottom: 0,
            }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="name" />
            <YAxis />
            <Tooltip />
            <Legend />
            <Bar dataKey="Income" fill="#0ea5e9" />
          </BarChart>
          {/* </ResponsiveContainer> */}
        </div>
      </div>
    </div>
  );
};

export default TransactionChart;
