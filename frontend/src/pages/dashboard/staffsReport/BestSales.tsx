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
      const staffData = fetchedData
        //.filter((account: any) => account?.role === "DeliveryStaff")
        .map((account: any) => {
          return {
            staffID: account?.accountId,
            staffName: account?.name,
            totalOrder: account?.ordersOfstaff.length,
          };
        });

      setData(staffData);
    };

    fetchData();
  }, []);
  const sortData = data.sort((a, b) => b.totalOrder - a.totalOrder);
  return (
    <div className="bg-white px-4 pt-3 pb-4 rounded-sm border border-gray-200 flex-1">
      <strong className="text-gray-700 font-medium">Best staffs</strong>
      <div className="border-x border-gray-200 rounded-sm mt-3">
        <table className="w-full text-gray-700 text-left">
          <thead>
            <tr>
              <th className="px-4 py-2 bg-gray-100 font-semibold">#ID</th>
              <th className="px-4 py-2 bg-gray-100 font-semibold">
                Staff Name
              </th>
              <th className="px-4 py-2 bg-gray-100 font-semibold">Gender</th>
              <th className="px-4 py-2 bg-gray-100 font-semibold">
                Total Order
              </th>
            </tr>
          </thead>
          <tbody>
            {sortData
              .filter((staff) => staff.totalOrder > 0)
              .map((staff) => (
                <tr key={staff.staffID}>
                  <td className="px-4 py-2">{staff.staffID}</td>
                  <td className="px-4 py-2">{staff.staffName}</td>
                  <td className="px-4 py-2">{staff.totalOrder}</td>
                </tr>
              ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
