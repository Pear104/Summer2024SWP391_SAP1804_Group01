import { useEffect, useState } from "react";
import { GET } from "../../utils/request";

const OrderList = ({ order }: { order: any }) => {
  return (
    <div className="border-b border-gray-300 p-4 mb-6">
      <div className="flex items-center justify-between mb-4">
        <div className="font-semibold text-lg">{order.storeName}</div>
        <div className="text-green-600">{order.status}</div>
      </div>
      {order.orderDetails.map((detail: any, index: number) => (
        <div key={index} className="flex mb-4">
          <div className="w-1/4">
            <img
              className="w-24 h-24 object-cover"
              src={detail.diamond.imageUrl}
              alt="diamond"
            />
            {detail.accessory?.accessoryImages[0]?.url && (
              <img
                className="w-24 h-24 object-cover mt-2"
                src={detail.accessory.accessoryImages[0].url}
                alt="accessory"
              />
            )}
          </div>
          <div className="w-3/4 pl-4">
            <div className="text-lg font-serif">{detail.accessory?.name}</div>
            <div className="text-gray-800 my-4">
              Diamond price:{" "}
              {detail.diamondPrice.unitPrice *
                detail.diamond.carat *
                100 *
                order.priceRate.percent}{" "}
              $
            </div>
            {detail.accessory && (
              <div className="text-gray-800 my-4">
                Accessory price:{" "}
                {(detail.accessory.materialWeight *
                  detail.materialPrice.unitPrice +
                  detail.accessory.accessoryType.processingPrice) *
                  order.priceRate.percent}{" "}
                $
              </div>
            )}
          </div>
        </div>
      ))}
      <div className="flex justify-between items-center mt-4">
        <div className="text-xl font-bold text-gray-800">
          Total: {order.totalPrice} $
        </div>
        <div>
          <button className="bg-gray-800 text-white px-4 py-2 rounded mr-2">
            Buy Again
          </button>
          <button className="bg-gray-200 text-gray-800 px-4 py-2 rounded">
            Contact Seller
          </button>
        </div>
      </div>
    </div>
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
          {orderHistories.map((order: any) => (
            <OrderList key={order.orderId} order={order} />
          ))}
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
