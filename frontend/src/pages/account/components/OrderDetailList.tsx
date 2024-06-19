import { useState } from "react";
import Loading from "../../../components/Loading";
import { formatDate } from "../../../utils/formatter";
import DiamondItem from "./DiamondItem";
import AccessoryItem from "./AccessoryItem";
import { OrderStatus } from "./OrderStatus";
import { POST } from "../../../utils/request";

const OrderDetailList = ({
  setFeedbackInfo,
  order,
  setIsModalOpen,
  form,
}: {
  setFeedbackInfo: any;
  order: any;
  setIsModalOpen: any;
  form: any;
}) => {
  const [isLoading, setIsLoading] = useState(false);
  return (
    <div>
      {isLoading && <Loading />}
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
            <DiamondItem detail={detail} percent={order?.priceRate?.percent} />
            <AccessoryItem
              form={form}
              setFeedbackInfo={setFeedbackInfo}
              setIsModalOpen={setIsModalOpen}
              detail={detail}
              orderId={order?.orderId}
              percent={order?.priceRate?.percent}
              orderStatus={order?.orderStatus}
            />
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
              <a href="mailto:datj.company@gmail.com">Contact Seller</a>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default OrderDetailList;
