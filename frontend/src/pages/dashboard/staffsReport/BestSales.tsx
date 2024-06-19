import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";

export default function BestSales() {
  const [data, setData] = useState<
    {
      staffID: string;
      staffName: string;
      totalOrder: number;
    }[]
  >([]);

  useEffect(() => {
    const fetchData = async () => {
      const fetchedData = await GET("/api/Report/SalesReport");
      const staffData = fetchedData.map((account: any) => ({
        staffID: account?.accountId,
        staffName: account?.name,
        totalOrder: account?.totalOrders,
      }));
      setData(staffData);
    };
    fetchData();
  }, []);

  const sortData = data.sort((a, b) => b.totalOrder - a.totalOrder);

  return (
    <div className="bg-white p-6 rounded-lg border border-gray-200 shadow-lg">
      <div className="mb-4">
        <h1 className="text-2xl font-bold text-gray-800">Best Sales Staff</h1>
        <p className="text-gray-600">
          List of top-performing sales staff based on total orders.
        </p>
      </div>
      <div className="overflow-x-auto">
        <table className="min-w-full bg-white border border-gray-200 rounded-lg">
          <thead>
            <tr className="w-full bg-gray-100">
              <th className="px-6 py-3 border-b text-left text-sm font-semibold text-gray-700">
                Rank
              </th>
              <th className="px-6 py-3 border-b text-left text-sm font-semibold text-gray-700">
                #ID
              </th>
              <th className="px-6 py-3 border-b text-left text-sm font-semibold text-gray-700">
                Staff Name
              </th>
              <th className="px-6 py-3 border-b text-left text-sm font-semibold text-gray-700">
                Total Orders
              </th>
            </tr>
          </thead>
          <tbody>
            {sortData.map((staff, index) => (
              <tr
                key={staff.staffID}
                className={`${index % 2 === 0 ? "bg-gray-50" : "bg-white"}`}
              >
                <td className="px-6 py-4 border-b text-gray-900 text-2xl">
                  {index == 0 && "🥇"}
                  {index == 1 && "🥈"}
                  {index == 2 && "🥉"}
                  {index > 2 && <div className="ml-3">{index + 1}</div>}
                </td>
                <td className="px-6 py-4 border-b text-sm text-gray-900">
                  {staff.staffID}
                </td>
                <td className="px-6 py-4 border-b text-sm text-gray-900">
                  {staff.staffName}
                </td>
                <td className="px-6 py-4 border-b text-sm text-gray-900">
                  {staff.totalOrder}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
