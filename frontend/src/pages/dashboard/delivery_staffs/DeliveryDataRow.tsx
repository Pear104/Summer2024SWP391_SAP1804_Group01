import DeliveryUpdateComponent from "./DeliveryUpdateComponent";
const formatDate = (dateString: any) => {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
};
export default function OrderRow({ order }: { order: any }) {
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
        <td className="px-6 py-4 whitespace-normal w-[200px]">
          <div className="text-sm text-gray-500">
            {order.orderDetails.map((orderDetail: any) => {
              return (
                <div>
                  <div>Diamond Carat: {orderDetail.diamond.carat}</div>
                  {orderDetail.accessory != null && (
                    <div>
                      Ring: {orderDetail.accessory.name} <br />
                    </div>
                  )}
                </div>
              );
            })}
          </div>
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
          <DeliveryUpdateComponent
            orderId={order.orderId}
            currentStatus={order.orderStatus}
          />
        </td>
      </tr>
    </>
  );
}
