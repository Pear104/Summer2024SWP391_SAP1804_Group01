import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../utils/request";
import SaleUpdateComponent from "./SaleUpdateComponent";
const formatDate = (dateString: any) => {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
};
export default function OrderRow({ order }: { order: any }) {
  if (!order) {
    return (
      <>
        <tr>
          <td colSpan={9}>
            <div className="text-center items-center">
              <p>There are no orders!!!</p>
            </div>
          </td>
        </tr>
      </>
    );
  }
  //   const [saleStaffs, deliveryStaffs] = useQueries({
  //     queries: [
  //       {
  //         queryKey: ["saleStaffs"],
  //         queryFn: () => GET("/api/Accounts?Role=SaleStaff"),
  //         staleTime: Infinity,
  //       },
  //       {
  //         queryKey: ["deliveryStaffs"],
  //         queryFn: () => GET("/api/Accounts?Role=DeliveryStaff"),
  //         staleTime: Infinity,
  //       },
  //     ],
  //   });

  return (
    <>
      <tr key={order.orderId}>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            {"#"}
            {order.orderId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div>{formatDate(order.createdAt)}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {order.customerName}
            {" #"}
            {order.customerId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{order.shippingAddress}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{order.phoneNumber}</div>
        </td>

        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {(
              order.totalPrice *
              (1 - order.totalDiscountPercent / 100)
            ).toLocaleString("en-US", {
              style: "currency",
              currency: "USD",
              maximumFractionDigits: 0,
            })}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <SaleUpdateComponent
            orderId={order.orderId}
            currentStatus={order.orderStatus}
          />
        </td>
      </tr>
    </>
  );
}
