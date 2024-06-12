import { useEffect } from "react";
import { GET } from "../../utils/request";
import { Pagination, Skeleton } from "antd";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../store/searchStore";
import { useQueries } from "@tanstack/react-query";
import { ExternalLink } from "lucide-react";

const formatDate = (dateString: any) => {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  return `${hours}:${minutes}, ${day}/${month}/${year}`;
};

export const OrderStatus = ({ order }: { order: any }) => {
  return (
    <div className="items-center justify-between mb-4 text-base">
      Order status:{" "}
      <span
        className={`${order.orderStatus === "Pending"
            ? "bg-red-200 border-red-300"
            : order.orderStatus === "Processing"
              ? "bg-yellow-200 border-yellow-300"
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

const OrderDetailList = ({ order }: { order: any }) => {
  return (
    <div>
      <div className="p-4">
        <div>Order ID: {order.orderId}</div>
        <div>Created at: {formatDate(order.createdAt)}</div>
      </div>
      <div className="border-b border-gray-300 p-4 mb-6">
        {order.orderDetails.map((detail: any, index: number) => (
          <div key={index} className="flex mb-4">
            <div className="w-1/5">
              <img
                className="w-48 h-48 object-cover"
                src={detail.diamond.imageUrl}
                alt="diamond"
              />
              {detail.accessory != null
                ? detail.accessory?.accessoryImages[0]?.url && (
                  <img
                    className="w-24 h-24 object-cover mt-2"
                    src={detail.accessory.accessoryImages[0].url}
                    alt="accessory"
                  />
                )
                : ""}
            </div>
            <div className="w-2/5 pl-4">
              <div className="text-lg font-serif">
                {detail.accessory != null ? detail.accessory?.name : ""}
              </div>
              <div className="text-gray-800 my-4 flex gap-2">
                Diamond's Certificate Number:{" "}
                <a
                  className="text-blue-500 flex"
                  target="_blank"
                  href={detail.diamond.certificateUrl}
                >
                  {detail.diamond.certificateNumber}
                  <ExternalLink size={12} />
                </a>
              </div>
              <div className="text-gray-800 my-4">
                Diamond price:{" "}
                {(
                  detail.diamondPrice.unitPrice *
                  detail.diamond.carat *
                  order?.priceRate.percent * 100
                ).toLocaleString("en-US", {
                  style: "currency",
                  currency: "USD",
                  maximumFractionDigits: 0,
                })}
              </div>

              {detail.accessory != null
                ? detail.accessory && (
                  <div className="text-gray-800 my-4">
                    Accessory price:{" "}
                    {(
                      (detail.accessory.materialWeight *
                        detail.materialPrice.unitPrice +
                        detail.accessory.accessoryType.processingPrice) *
                      order?.priceRate.percent
                    ).toLocaleString("en-US", {
                      style: "currency",
                      currency: "USD",
                      maximumFractionDigits: 0,
                    })}
                  </div>
                )
                : ""}
            </div>
            <div className="w-2/5">
              <div className="text-gray-800 my-4">
                Diamond Carat: {detail.diamond.carat}
              </div>
              <div className="text-gray-800 my-4">
                Diamond Clarity: {detail.diamond.clarity}
              </div>
              <div className="text-gray-800 my-4">
                Diamond Cut: {detail.diamond.cut}
              </div>
              <div className="text-gray-800 my-4">
                Diamond Color: {detail.diamond.color}
              </div>
            </div>
          </div>
        ))}
        <div className="flex justify-end text-xl">
          <OrderStatus order={order} />
        </div>
        <div className="flex justify-between items-center mt-4">
          <div className="text-xl font-bold text-gray-800">
            Total:{" "}
            {order.totalPrice.toLocaleString("en-US", {
              style: "currency",
              currency: "USD",
              maximumFractionDigits: 0,
            })}
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
    </div>
  );
};

export default function OrderHistory() {
  useEffect(() => {
    setQueryUrl("/api/Order?");
  }, []);

  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  const [orderHistories] = useQueries({
    queries: [
      {
        queryKey: ["orders", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: Infinity,
      },
    ],
  });
  return (
    <div className="p-4 w-full">
      <div className="text-2xl font-serif mb-6">ORDER HISTORY</div>
      {orderHistories?.data?.orders?.length === 0 ? (
        <div className="border-2 border-slate-400 p-5">
          <p>You haven't placed any orders yet</p>
        </div>
      ) : (
        <div className="w-full">
          {orderHistories?.data?.orders.map((order: any) => (
            <OrderDetailList key={order.orderId} order={order} />
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
        {orderHistories?.data?.totalCount <= orderHistories?.data?.pageSize ? (
          ""
        ) : (
          <Pagination
            showTotal={(total, range) =>
              `${range[0]}-${range[1]} of ${total} items`
            }
            current={Number(orderHistories.data?.currentPage)}
            defaultCurrent={
              (orderHistories?.data &&
                orderHistories?.data.currentPage.toString()) ||
              "1"
            }
            total={orderHistories?.data?.totalCount}
            pageSize={Number(orderHistories.data?.pageSize)}
            showSizeChanger={false}
            onChange={(page, _pageSize) => {
              params.set("PageNumber", page.toString());
              navigate(url.pathname + "?" + params.toString());
              setQueryUrl("/api/Order?" + params.toString());
            }}
          />
        )}
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
