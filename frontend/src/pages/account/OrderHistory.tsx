import { useEffect, useState } from "react";
import { GET } from "../../utils/request";

const OrderList = ({ order }: { order: any }) => {
  return (
    <a
      className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 w-full justify-around border-b border-gray-400 p-2 mb-5"
      href="/account/order-history/detail"
    >
      <div
        className="my-2 aspect-square bg-no-repeat bg-cover w-full h-48"
        style={{
          backgroundImage: `url(${order.orderDetails[0].diamond.imageUrl})`,
        }}
      ></div>
      <div
        className="my-2 aspect-square bg-no-repeat bg-cover w-full h-48"
        style={{
          backgroundImage: `url(${order.orderDetails[0].accessory?.accessoryImages[0].url})`,
        }}
      ></div>
      <div className="col-span-2 p-5 lg:p-10">
        <div className="font-serif text-lg">
          {order.orderDetails[0].accessory?.name}
        </div>
        <div className="font-serif mt-5">Status: </div>
        <div className="font-serif mt-5">Diamond Price: </div>
        <div className="font-serif mt-5">Accessory Price: </div>
        <div className="font-serif mt-5">Delivery Price: </div>
        <div className="font-serif mt-5">Total Price: </div>
        <a
          className="mt-14 w-32 h-12 bg-black text-white text-lg flex justify-center items-center rounded-md cursor-pointer"
          href="#"
        >
          Evaluating
        </a>
      </div>
    </a>
  );
};

export default function OrderHistory() {
  const [orderHistories, setOrderHistories] = useState<any>([]);
  useEffect(() => {
    (async () => {
      const orders = await GET("/api/Order");
      setOrderHistories(orders);
    })();
  }, []);

  return (
    <div className="p-4 w-full">
      <div className="text-2xl font-serif mb-6">ORDER HISTORY</div>
      {orderHistories.length === 0 ? (
        <div className="border-2 border-slate-400 p-5">
          <p>You haven't placed any orders yet</p>
        </div>
      ) : (
        <div className="w-full">
          {orderHistories.map((order: any) => {
            console.log(order);
            return <OrderList key={order.orderId} order={order} />;
          })}
        </div>
      )}
      <div className="flex justify-center mt-10">
        <a
          className="w-96 h-12 bg-black text-white text-lg flex justify-center items-center rounded-md cursor-pointer"
          href="/product/diamond"
        >
          Continue Shopping
        </a>
      </div>
    </div>
  );
}
