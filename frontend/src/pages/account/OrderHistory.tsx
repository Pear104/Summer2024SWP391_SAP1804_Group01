import React, { useEffect, useState } from "react";
import { GET } from "../../utils/request";

const OrderList = ({ order }: { order: any }) => {
  return (
    <a
      className="grid grid-cols-8 w-full justify-around border-b-[1px] border-gray-400 p-2 mb-5"
      href="/account/order-history/detail"
    >
      <div
        className="my-2 aspect-square bg-no-repeat col-span-4 bg-cover w-[400px]"
        style={{
          backgroundImage: `url(${order.accessory.accessoryImages[0].url})`,
        }}
      ></div>
      {/* <div
        className="my-2 aspect-square bg-no-repeat col-span-4 bg-cover w-[400px]"
        style={{
          backgroundImage: `url(${order.diamond.imageUrl})`,
        }}
      ></div> */}
      <div className="col-span-4 p-10">
        <div className="libre-baskerville-regular">{order.accessory.name}</div>
        <div className="libre-baskerville-regular mt-5">Status: </div>
        <div className="libre-baskerville-regular mt-5">Diamond Price: </div>
        <div className="libre-baskerville-regular mt-5">Accessory Price: </div>
        <div className="libre-baskerville-regular mt-5">Delivery Price: </div>
        <div className="libre-baskerville-regular mt-5">Total Price: </div>
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
      const accessories = (await GET("/api/Accessories")).slice(0, 10);
      const diamonds = (await GET("/api/Diamonds")).slice(0, 10);
      const data: any[] = [];
      for (let i = 0; i < 10; i++) {
        data.push({
          accessory: accessories[i],
          diamond: diamonds[i],
        });
      }
      setOrderHistories(data);
    })();
  }, []);
  // console.log(orderHistories);

  return (
    <div className="p-4 w-full">
      <div className="Order-header libre-baskerville-regular mb-6">
        ORDER HISTORY
      </div>
      <div className="Order-body-none">
        <p className="border-solid border-2 border-slate-400 p-5">
          You haven't placed any orders yet
        </p>
      </div>
      <div className="Order-body-exist w-full">
        {orderHistories.map((order: any) => {
          console.log(order);
          return <OrderList order={order} />;
        })}
      </div>
      <div>
        <div className="flex justify-center mt-10">
          <div className="w-96 h-12 bg-black text-white text-lg flex justify-center items-center rounded-md cursor-pointer">
            Continue Shopping
          </div>
        </div>
      </div>
    </div>
  );
}
