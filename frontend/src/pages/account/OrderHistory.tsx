import { useEffect, useState } from "react";
import { GET } from "../../utils/request";
import { Pagination, Skeleton } from "antd";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../store/searchStore";

const OrderList = ({ order }: { order: any }) => {
  return (
    <div className="border-b border-gray-300 p-4 mb-6">
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
              {detail.diamondPrice.unitPrice * detail.diamond.carat * 100} $
            </div>
            {detail.accessory && (
              <div className="text-gray-800 my-4">
                Accessory price:{" "}
                {detail.accessory.materialWeight *
                  detail.materialPrice.unitPrice +
                  detail.accessory.accessoryType.processingPrice}{" "}
                $
              </div>
            )}
            <div className="items-center justify-between mb-4">
              Order status:{" "}
              <span
                className={`text-${
                  order.orderStatus === "Pending"
                    ? "green"
                    : order.orderStatus === "Processing"
                    ? "yellow"
                    : order.orderStatus === "Delivering"
                    ? "orange"
                    : "dark-green"
                }-600`}
              >
                {order.orderStatus}
              </span>
            </div>
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
  useEffect(() => {
    setQueryUrl("/api/Accessories?");
  }, []);

  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);

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
          {orderHistories.orders.map((order: any) => (
            <OrderList key={order.orderId} order={order} />
          ))}
        </div>
      )}
      <div>
        {orderHistories.isLoading && (
          <Skeleton
            active
            paragraph={{
              rows: 20,
            }}
          />
        )}
      </div>
      <div className="mt-10 flex justify-center">
        <Pagination
          showTotal={(total, range) =>
            `${range[0]}-${range[1]} of ${total} items`
          }
          current={Number(params.get("PageNumber")) || 1}
          defaultCurrent={
            (orderHistories.orders?.data &&
              orderHistories.orders?.data.currentPage.toString()) ||
            "1"
          }
          total={orderHistories.orders?.data?.totalCount}
          pageSize={Number(params.get("PageSize")) || 20}
          showSizeChanger={false}
          onChange={(page, _pageSize) => {
            params.set("PageNumber", page.toString());
            navigate(url.pathname + "?" + params.toString());
            setQueryUrl("/api/Order?" + params.toString());
          }}
        />
      </div>
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
