import { useQueries } from "@tanstack/react-query";
import DeliveryStaffComponent from "./DeliveryStaffComponent";
import OrderUpdateComponent from "./OrderUpdateComponent";
import SaleStaffComponent from "./SaleStaffComponent";
import { GET } from "../../../utils/request";
import { Modal, Button } from "antd";
import { useState } from "react";
import DiamondItem from "./components/DiamondItem";
import AccessoryItem from "./components/AccessoryItem";
import { OrderStatus } from "./components/OrderStatus";
const formatDate = (dateString: any) => {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
};
export default function OrderRow({ order }: { order: any }) {
  const [isModalVisible, setIsModalVisible] = useState(false);
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

  const showModal = () => {
    setIsModalVisible(true);
  };
  const handleOk = () => {
    setIsModalVisible(false);
  };
  return (
    <>
      <tr key={order.orderId}>
        <td className="px-6 py-4 whitespace-nowrap cursor-pointer" onClick={showModal}>
          <div className="flex items-center">
            {"#"}
            {order.orderId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap cursor-pointer" onClick={showModal}>
          <div>{formatDate(order.createdAt)}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap cursor-pointer" onClick={showModal}>
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
      
      <Modal
        title="Order Details"
        visible={isModalVisible}
        onOk={handleOk}
        footer={[
          <Button key="submit" type="primary" onClick={handleOk}>
            OK
          </Button>,
        ]}
        width={1400}
        centered
      >
        <div className="pb-4">
        <div>Order ID: {order.orderId}</div>
        <div>Created at: {formatDate(order.createdAt)}</div>
      </div>
      <div className="border-b border-gray-300 py-4 mb-6">
        {order.orderDetails.map((detail: any) => (
          <div
            key={detail.orderDetailId}
            className="border rounded-md p-4 bg-slate-100 grid grid-cols-2 mb-4 gap-x-4 border-spacing-y-4"
          >
            <DiamondItem
              detail={detail}
              percent={order?.priceRate?.percent}
              order={order}
            />
            <AccessoryItem       
              detail={detail}     
              percent={order?.priceRate?.percent}
            />
          </div>
        ))}
        <div className="flex justify-between items-center text-xl mt-8">
          <div className="font-bold text-gray-800 flex justify-between gap-10">
            <div>
              Subtotal:{" "}
              {order?.totalPrice?.toLocaleString("en-US", {
                style: "currency",
                currency: "USD",
                maximumFractionDigits: 0,
              })}
            </div>
            <div>
              Discount: {(order?.totalDiscountPercent * 100)?.toFixed(0)}%
            </div>
          </div>
          <OrderStatus order={order} />
        </div>
        <div className="flex justify-between items-center">
          <div className="text-xl font-bold text-gray-800">
            Total:{" "}
            {(
              order.totalPrice *
              (1 - order.totalDiscountPercent)
            ).toLocaleString("en-US", {
              style: "currency",
              currency: "USD",
              maximumFractionDigits: 0,
            })}
          </div>
          </div>
        </div>
      </Modal>
    </>
  );
}
