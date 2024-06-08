import React from "react";
import { StatusMenu } from "./OrderManagementHeader";

const formatDate = (dateString: any) => {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
};
export const OrderStatus = ({ order }: { order: any }) => {
  return (
    <div className="items-center justify-between mb-4">
      Order status:{" "}
      <span
        className={`${
          order.orderStatus === "Pending"
            ? "bg-red-600"
            : order.orderStatus === "Processing"
            ? "bg-yellow-500"
            : order.orderStatus === "Delivering"
            ? "bg-orange-600"
            : order.orderStatus === "Completed"
            ? "bg-green-600"
            : "bg-red-800"
        } border-2 border-solid p-2 text-white px-4 rounded-full`}
      >
        {order.orderStatus}
      </span>
    </div>
  );
};

export default function OrderRow({ order }: { order: any }) {
  const handleStatusChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    const updatedStatus = event.target.value;
    console.log("Updated Status:", updatedStatus);
    // updateOrderStatus(order.orderId, updatedStatus);
  };

  if (!order) {
    return (
      <>
        <tr>
          <td>
            <div className="text-center items-center">
              <p>There are no orders!!!</p>
            </div>
          </td>
        </tr>
      </>
    );
  }

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
            {order.customerId}
            {"#"}
            {order.customerName}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{order.shippingAddress}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{order.phoneNumber}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{""}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{""}</div>
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
          <StatusMenu
            handleStatusClick={handleStatusChange}
            statusText={order.orderStatus}
          />
        </td>
      </tr>
    </>
  );
}
