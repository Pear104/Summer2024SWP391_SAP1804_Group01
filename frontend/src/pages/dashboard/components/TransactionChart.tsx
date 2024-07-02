import React, { useEffect, useState } from "react";
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

interface TransactionData {
  name: string;
  Income: number;
}

const TransactionChart: React.FC = () => {
  const [_data, setData] = useState<any[]>([]);
  const [formattedData, setFormattedData] = useState<TransactionData[]>([]);
  const [firstMonth, setFirstMonth] = useState("");
  const [lastMonth, setLastMonth] = useState("");

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

  const getLast12Months = () => {
    const months = [];
    const currentDate = new Date();
    currentDate.setMonth(currentDate.getMonth() + 1); // Move to next month to include current month
    for (let i = 0; i < 12; i++) {
      currentDate.setMonth(currentDate.getMonth() - 1);
      const month = getMonthName(currentDate.getMonth() + 1);
      const year = currentDate.getFullYear();
      months.push(`${month} ${year}`);
    }
    return months.reverse(); // Reverse to get in ascending order
  };

  const parseDate = (dateString: string) => {
    const [month, year] = dateString.split(" ");
    return {
      month: getMonthNumber(month as keyof typeof monthMap),
      year: parseInt(year),
    };
  };

  const monthMap: Record<string, number> = {
    Jan: 1,
    Feb: 2,
    Mar: 3,
    Apr: 4,
    May: 5,
    Jun: 6,
    Jul: 7,
    Aug: 8,
    Sep: 9,
    Oct: 10,
    Nov: 11,
    Dec: 12,
  };

  const getMonthNumber = (monthName: keyof typeof monthMap) => {
    return monthMap[monthName];
  };

  const filterDataByRange = (
    data: any[],
    firstMonth: string,
    lastMonth: string
  ) => {
    const { month: firstMonthNumber, year: firstYear } = parseDate(firstMonth);
    const { month: lastMonthNumber, year: lastYear } = parseDate(lastMonth);

    return data.filter((item: any) => {
      const itemDate = new Date(item.year, item.month - 1);
      const startDate = new Date(firstYear, firstMonthNumber - 1);
      const endDate = new Date(lastYear, lastMonthNumber - 1);

      return itemDate >= startDate && itemDate <= endDate;
    });
  };

  const compareDates = (date1: string, date2: string) => {
    const [month1, year1] = date1.split(" ");
    const [month2, year2] = date2.split(" ");
    const parsedDate1 = new Date(
      parseInt(year1),
      getMonthNumber(month1 as keyof typeof monthMap) - 1
    );
    const parsedDate2 = new Date(
      parseInt(year2),
      getMonthNumber(month2 as keyof typeof monthMap) - 1
    );
    return parsedDate1 < parsedDate2;
  };

  useEffect(() => {
    (async () => {
      const data = await GET("/api/Report/TransactionReport");
      setData(data);

      const filteredData = filterDataByRange(data, firstMonth, lastMonth);
      const formattedData = filteredData.map((item: any) => ({
        name: getMonthName(item.month) + " " + item.year,
        Income: item.income,
      }));
      setFormattedData(formattedData);
    })();
  }, [firstMonth, lastMonth]);
  console.log(data);
  useEffect(() => {
    const months = getLast12Months();
    setFirstMonth(months[0]);
    setLastMonth(months[months.length - 1]);
  }, []);

  const months = getLast12Months();

  return (
    <div className="h-[26rem] bg-white p-4 rounded-sm border border-gray-200 flex flex-col flex-grow">
      <strong className="text-gray-700 font-medium">Transactions</strong>
      <div className="flex space-x-2 mb-3 text-center mt-2">
        <h2 className="p-2">From</h2>
        <select
          value={firstMonth}
          onChange={(e) => setFirstMonth(e.target.value)}
          className="border rounded px-2 py-1"
        >
          {months.map((month) => (
            <option key={month} value={month}>
              {month}
            </option>
          ))}
        </select>
        <h2 className="p-2">To</h2>
        <select
          value={lastMonth}
          onChange={(e) => setLastMonth(e.target.value)}
          className="border rounded px-2 py-1"
        >
          {months
            .filter((month) => compareDates(firstMonth, month))
            .map((month) => (
              <option key={month} value={month}>
                {month}
              </option>
            ))}
        </select>
      </div>
      <div className="mt-3 w-full flex-1 text-xs">
        <ResponsiveContainer width="100%" height="100%">
          <BarChart
            className="items-center"
            width={500}
            height={300}
            data={formattedData}
            margin={{
              top: 20,
              right: 10,
              left: 10,
              bottom: 0,
            }}
          >
            <CartesianGrid strokeDasharray="3 3 0 0" vertical={false} />
            <XAxis dataKey="name" />
            <YAxis
              tickFormatter={(value) => `$${value.toLocaleString("en-US")}`}
            />
            <Tooltip
              formatter={(value: number) =>
                `$${value.toLocaleString("en-US", {
                  minimumFractionDigits: 2,
                  maximumFractionDigits: 2,
                })}`
              }
            />
            <Legend />
            <Bar dataKey="Income" fill="#0ea5e9" />
          </BarChart>
        </ResponsiveContainer>
      </div>
    </div>
  );
};

export default TransactionChart;
