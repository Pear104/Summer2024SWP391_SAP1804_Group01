import React, { useEffect, useState } from "react";
import { GET } from "../../utils/request";

const OrderList = ({order} : {order: any}) => {
  console.log(order.name);
  return (
    <a
      className="grid grid-cols-8 w-full justify-around border-2 border-gray-400 p-2 mb-5"
      href="/account/order-history/detail"
    >
      <div
        className="my-2 aspect-square bg-no-repeat w-full col-span-4 bg-cover"
        style={{
          backgroundImage: `url(${order.accessoryImages[0].url})`,
        }}
      ></div>
      <div className="col-span-4 p-10 mt-3">
        <div className="libre-baskerville-regular">
          {order.name}
        </div>
        {/* luc nao co gia thi thay karat = price*/}
        <div className="libre-baskerville-regular mt-5">Status: </div>
        <div className="libre-baskerville-regular mt-5">Diamond Price: </div>
        <div className="libre-baskerville-regular mt-5">Delivery Price: </div>
        <div className="libre-baskerville-regular mt-5">Total Price: </div>
        <a className="mt-14 w-32 h-12 bg-orange-600 text-white text-lg flex justify-center items-center rounded-md cursor-pointer"
        href="#">
            Evaluating
          </a>
      </div>
    </a>
  );
}

export default function OrderHistory() {
  const [orderHistories, setOrderHistories] = useState([]);
  useEffect(() => {
    (async () => {
      const data = await GET("/api/Accessories");
      setOrderHistories(data);
    })()
  },[]);
  // console.log(orderHistories);

  return (
    <div className="divide-y max-w-4xl p-4">
      <div className="Order-header libre-baskerville-regular mb-6">
        ORDER HISTORY
      </div>
      <div className="Order-body-none">
        <p className="border-solid border-2 border-slate-400 p-5">
          You haven't placed any orders yet
        </p>
      </div>
      <div className="Order-body-exist">
        {orderHistories.map((order : any) => {
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
