import { useEffect, useState } from "react";
import { PieChart, Pie, Cell, ResponsiveContainer, Legend } from "recharts";
import { GET } from "../../../utils/request";

const RADIAN = Math.PI / 180;
const COLORS = ["#00C49F", "#FFBB28", "#FF8042"];

const renderCustomizedLabel = ({
  cx,
  cy,
  midAngle,
  innerRadius,
  outerRadius,
  percent,
}: {
  cx: any;
  cy: any;
  midAngle: any;
  innerRadius: any;
  outerRadius: any;
  percent: any;
}) => {
  const radius = innerRadius + (outerRadius - innerRadius) * 0.5;
  const x = cx + radius * Math.cos(-midAngle * RADIAN);
  const y = cy + radius * Math.sin(-midAngle * RADIAN);

  return (
    <text
      x={x}
      y={y}
      fill="white"
      textAnchor={x > cx ? "start" : "end"}
      dominantBaseline="central"
    >
      {`${(percent * 100).toFixed(0)}%`}
    </text>
  );
};

export default function BuyerProfilePieChart() {
  const [data, setData] = useState<{ name: string; value: number }[]>([]);
  useEffect(() => {
    (async () => {
      const fetchedData = await GET("/api/Accounts");
      let maleCount = 0;
      let femaleCount = 0;
      let otherCount = 0;

      // Female
      //   Male
      //   Other
      fetchedData.forEach((account: any) => {
        if (account?.role == "Customer") {
          switch (account?.gender) {
            case "Male":
              maleCount++;
              break;
            case "Female":
              femaleCount++;
              break;
            default:
              otherCount++;
              break;
          }
        }
      });
      const data = [
        { name: "Male", value: maleCount },
        { name: "Female", value: femaleCount },
        { name: "Other", value: otherCount },
      ];
      setData(data);
    })();
  }, []);

  return (
    <div className="w-[20rem] h-[26rem] bg-white p-4 rounded-sm border border-gray-200 flex flex-col">
      <strong className="text-gray-700 font-medium">Buyer Profile</strong>
      <div className="mt-3 w-full flex-1 text-xs">
        <ResponsiveContainer width="100%" height="100%">
          <PieChart width={400} height={300}>
            <Pie
              data={data}
              cx="50%"
              cy="45%"
              labelLine={false}
              label={renderCustomizedLabel}
              outerRadius={105}
              fill="#8884d8"
              dataKey="value"
            >
              {data.map((_, index) => (
                <Cell
                  key={`cell-${index}`}
                  fill={COLORS[index % COLORS.length]}
                />
              ))}
            </Pie>
            <Legend />
          </PieChart>
        </ResponsiveContainer>
      </div>
    </div>
  );
}
