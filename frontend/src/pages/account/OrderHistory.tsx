import { useEffect, useState } from "react";
import { GET, POST } from "../../utils/request";
import { Pagination, Skeleton, Image, Empty } from "antd";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../store/searchStore";
import { useQueries } from "@tanstack/react-query";
import { ExternalLink } from "lucide-react";
import Loading from "../../components/Loading";

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

const DiamondItem = ({ detail, percent }: { detail: any; percent: any }) => {
  return (
    <div className="flex">
      <div className="w-1/5 flex ">
        <Image
          className="h-full object-cover aspect-square"
          // style={{ objectFit: "contain" }}
          src={detail.diamond.imageUrl}
          alt="diamond"
          // className="w-48 h-48 object-contain"
        />
      </div>
      <div className="text-lg pl-4 flex flex-col gap-2">
        <div className="text-gray-800 flex gap-2">
          Certificate Number:{" "}
          <a
            className="text-blue-500 flex"
            target="_blank"
            href={detail.diamond.certificateUrl}
          >
            {detail.diamond.certificateNumber}
            <ExternalLink size={12} />
          </a>
        </div>
        <div className="grid grid-cols-2 gap-y-2">
          <div className="text-gray-800">
            <span className="">Carat:</span> {detail.diamond.carat}
          </div>
          <div className="text-gray-800">
            Diamond Clarity: {detail.diamond.clarity}
          </div>
          <div className="text-gray-800">Cut: {detail.diamond.cut}</div>
          <div className="text-gray-800">
            Diamond Color: {detail.diamond.color}
          </div>
          <div className="text-gray-800 font-bold">
            <span className="">Price:</span>{" "}
            {(
              detail.diamondPrice.unitPrice *
              detail.diamond.carat *
              percent *
              100
            ).toLocaleString("en-US", {
              style: "currency",
              currency: "USD",
              maximumFractionDigits: 0,
            })}
          </div>
        </div>
      </div>
    </div>
  );
};

const AccessoryItem = ({ detail, percent }: { detail: any; percent: any }) => {
  return (
    <div className="flex text-lg">
      <div className="w-1/5 flex aspect-square">
        {detail?.accessory != null
          ? detail.accessory?.accessoryImages[0]?.url && (
              <Image
                // style={{ objectFit: "contain" }}
                // object-cover full hinh bi cat, object-contain full hinh khong bi cat
                className="h-full object-cover aspect-square"
                src={detail?.accessory?.accessoryImages[0].url}
                alt="accessory"
              />
            )
          : ""}
      </div>
      <div className="pl-4 flex flex-col gap-2 text-lg">
        <div className="font-bold">
          {detail.accessory != null ? detail.accessory?.name : ""}
        </div>
        {detail.accessory != null && (
          <div>Gold Karat: {detail.accessory?.karat}K</div>
        )}
        {detail?.accessory != null
          ? detail?.accessory && (
              <div className="text-gray-800 font-bold">
                Price:{" "}
                {(
                  (detail?.accessory.materialWeight *
                    detail.materialPrice.unitPrice +
                    detail.accessory.accessoryType.processingPrice) *
                  percent
                ).toLocaleString("en-US", {
                  style: "currency",
                  currency: "USD",
                  maximumFractionDigits: 0,
                })}
              </div>
            )
          : ""}
      </div>
    </div>
  );
};

const OrderDetailList = ({ order }: { order: any }) => {
  const [isLoading, setIsLoading] = useState(false);
  return (
    <div>
      {isLoading && <Loading />}
      <div className="p-4">
        <div>Order ID: {order.orderId}</div>
        <div>Created at: {formatDate(order.createdAt)}</div>
      </div>
      <div className="border-b border-gray-300 p-4 mb-6">
        {order.orderDetails.map((detail: any) => (
          <>
            <div className="border rounded-md p-4 bg-slate-100 grid grid-cols-2 mb-4 gap-x-4 border-spacing-y-4">
              <DiamondItem
                detail={detail}
                percent={order?.priceRate?.percent}
              />
              <AccessoryItem
                detail={detail}
                percent={order?.priceRate?.percent}
              />
            </div>
          </>
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
            {order.orderStatus == "Pending" && (
              <button
                className="bg-gray-800 text-white px-4 py-2 rounded mr-2"
                onClick={async () => {
                  setIsLoading(true);
                  const transactionResponse = await POST("/api/Transactions", {
                    orderId: order.orderId,
                    amount: order.totalPrice,
                    paymentMethod: "CREDIT_CARD",
                  });
                  const paymentResponse = await POST(
                    "/api/payment/vnpay-sent-request",
                    {
                      paymentContent: "Thanh toan don hang " + order?.orderId,
                      paymentCurrency: "USD",
                      paymentRefId: transactionResponse?.transactionId,
                      requiredAmount: (
                        order?.totalPrice *
                        (1 - order?.totalDiscountPercent / 100)
                      ).toFixed(0),
                      paymentLanguage: "en",
                      merchantId: "MER0001",
                      paymentDestinationId: "VNPAY",
                      signature: "123456789ABC",
                    }
                  );
                  if (paymentResponse?.paymentUrl) {
                    location.href = paymentResponse.paymentUrl;
                  }
                  setIsLoading(true);
                }}
              >
                Checkout
              </button>
            )}
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
        staleTime: 0,
      },
    ],
  });
  return (
    <div className="p-4 w-full">
      <div className="text-2xl font-serif mb-6">ORDER HISTORY</div>
      {orderHistories?.data?.orders?.length != 0 ? (
        <div className="w-full">
          {orderHistories?.data?.orders?.map((order: any) => (
            <OrderDetailList key={order.orderId} order={order} />
          ))}
        </div>
      ) : (
        <Empty description="You haven't placed any orders yet" />
      )}
      <div>
        {orderHistories?.isLoading && (
          <Skeleton
            active
            paragraph={{
              rows: 20,
            }}
          />
        )}
      </div>
      <div className="mt-4 flex justify-center">
        {orderHistories?.data?.totalCount > orderHistories?.data?.pageSize ? (
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
        ) : (
          ""
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
