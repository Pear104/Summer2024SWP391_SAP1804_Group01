import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";
import { Link } from "react-router-dom";

export default function RecentOrders() {
  const [data, setData] = useState<
    {
      customerID: string;
      customerName: string;
      gender: string;
      totalOrder: number;
      totalSpend: number;
    }[]
  >([]);
  useEffect(() => {
    const fetchData = async () => {
      const fetchedData = await GET("/api/Accounts");
      const customerData = fetchedData
        .filter((account: any) => account?.role === "Customer")
        .map((account: any) => {
          // const totalSpend = account?.ordersOfCustomer.reduce(
          //   (sum: number, order: any) => sum + (order?.totalPrice || 0),
          //   0
          // );
          const totalSpend = account?.ordersOfCustomer
            .filter((order: any) => order?.orderStatus === "Completed")
            .reduce(
              (sum: number, order: any) => sum + (order?.totalPrice || 0),
              0
            );
          return {
            customerID: account?.accountId,
            customerName: account?.name,
            gender: account?.gender,
            totalOrder: account?.ordersOfCustomer.length,
            totalSpend: totalSpend,
          };
        });

      setData(customerData);
    };

    fetchData();
  }, []);
  const sortData = data.sort((a, b) => b.totalSpend - a.totalSpend);
  return (
    <div className="bg-white px-4 pt-3 pb-4 rounded-sm border border-gray-200 flex-1">
      <strong className="text-gray-700 font-medium">Best Customers</strong>
      <div className="border-x border-gray-200 rounded-sm mt-3">
        <table className="w-full text-gray-700 text-left">
          <thead>
            <tr>
              <th className="px-4 py-2 bg-gray-100 font-semibold">#ID</th>
              <th className="px-4 py-2 bg-gray-100 font-semibold">
                Customer Name
              </th>
              <th className="px-4 py-2 bg-gray-100 font-semibold">Gender</th>
              <th className="px-4 py-2 bg-gray-100 font-semibold">
                Total Order
              </th>
              <th className="px-4 py-2 bg-gray-100 font-semibold">
                Total Spend
              </th>
            </tr>
          </thead>
          <tbody>
            {sortData
              .filter((customer) => customer.totalSpend > 0)
              .slice(0, 5)
              .map((customer) => (
                <tr key={customer.customerID}>
                  <td className="px-4 py-2">
                    {/* <Link to={`/customer/${customer.id}`}>#{customer.id}</Link> */}
                    #{customer.customerID}
                  </td>
                  <td className="px-4 py-2">
                    <Link
                      to={`/admin/customers/detail/${customer.customerID}`}
                      className="hover:underline"
                    >
                      {customer.customerName}
                    </Link>
                  </td>
                  <td className="px-4 py-2">
                    {/* <Link to={`/customer/${customer.customer_id}`}>
                    {customer.customer_name}
                  </Link> */}
                    {customer.gender}
                  </td>
                  <td className="px-4 py-2">{customer.totalOrder}</td>
                  <td className="px-4 py-2">
                    ${customer.totalSpend.toFixed(2)}
                  </td>
                </tr>
              ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
