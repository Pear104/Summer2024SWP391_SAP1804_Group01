import { useQueries } from "@tanstack/react-query";
import DeliveryStaffComponent from "./DeliveryStaffComponent";
import OrderUpdateComponent from "./OrderUpdateComponent";
import SaleStaffComponent from "./SaleStaffComponent";
import { GET } from "../../../utils/request";
const formatDate = (dateString: any) => {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
};
export default function OrderRow({ order }: { order: any }) {
  const [saleStaffs, deliveryStaffs] = useQueries({
    queries: [
      {
        queryKey: ["saleStaffs"],
        queryFn: () => GET("/api/Accounts?Role=SaleStaff"),
        staleTime: 0,
      },
      {
        queryKey: ["deliveryStaffs"],
        queryFn: () => GET("/api/Accounts?Role=DeliveryStaff"),
        staleTime: 0,
      },
    ],
  });

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
          <SaleStaffComponent
            orderId={order.orderId}
            staffs={saleStaffs?.data || []}
            currentStaff={order?.saleStaffName}
            statusText={order.orderStatus}
          />
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <DeliveryStaffComponent
            orderId={order.orderId}
            staffs={deliveryStaffs?.data || []}
            currentStaff={order?.deliveryStaffName}
            statusText={order.orderStatus}
          />
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
          <OrderUpdateComponent
            orderId={order.orderId}
            currentStatus={order.orderStatus}
          />
        </td>
      </tr>
    </>
  );
}
