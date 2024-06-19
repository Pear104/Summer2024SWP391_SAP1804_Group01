export const OrderStatus = ({ order }: { order: any }) => {
  return (
    <div className="items-center justify-between mb-4 text-base">
      Order status:{" "}
      <span
        className={`${
          order.orderStatus === "Pending"
            ? "bg-red-200 border-red-300"
            : order.orderStatus === "Processing"
            ? "bg-yellow-200 border-yellow-300"
            : order.orderStatus === "Confirmed"
            ? "bg-pink-200 border-pink-300"
            : order.orderStatus === "Delivering"
            ? "bg-orange-200 border-orange-300"
            : order.orderStatus === "Completed"
            ? "bg-green-200 border-green-300"
            : "bg-red-200 border-red-300"
        } border-2 p-2 px-4 rounded-md text-base`}
      >
        {order.orderStatus}
      </span>
    </div>
  );
};
