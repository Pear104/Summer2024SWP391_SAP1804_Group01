import { useState, useRef } from "react";
import Loading from "../../../components/Loading";
import { formatDate } from "../../../utils/formatter";
import DiamondItem from "./DiamondItem";
import AccessoryItem from "./AccessoryItem";
import { OrderStatus } from "./OrderStatus";
import { POST } from "../../../utils/request";
import { Button, Modal } from "antd";
import InvoiceItem from "./InvoiceItem";
import ReactToPrint from "react-to-print";

const OrderItem = ({
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
  const [isInvoiceModalOpen, setIsInvoiceModalOpen] = useState(false);
  useState(false);
  const invoiceRef = useRef(null);

  const showModalInvoice = () => {
    setIsInvoiceModalOpen(true);
  };

  const handleOk = () => {
    setIsInvoiceModalOpen(false);
  };
  const handleCancel = () => {
    setIsInvoiceModalOpen(false);
  };
  return (
    <div>
      {/* modal invoice */}
      <Modal
        className="w-[1200px]"
        centered
        open={isInvoiceModalOpen}
        onOk={handleOk}
        onCancel={handleCancel}
        footer={[
          <Button key="back" onClick={handleCancel}>
            Cancel
          </Button>,
          <ReactToPrint
            content={() => invoiceRef.current}
            trigger={() => (
              <Button key="submit" type="primary">
                Export to PDF
              </Button>
            )}
          />,
        ]}
      >
        <span ref={invoiceRef}>
          <InvoiceItem order={order} />
        </span>
        <div className="mb-2 tracking-wider"></div>
      </Modal>

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
            <DiamondItem
              detail={detail}
              percent={order?.priceRate?.percent}
              order={order}
            />
            <AccessoryItem
              form={form}
              setFeedbackInfo={setFeedbackInfo}
              setIsModalOpen={setIsModalOpen}
              detail={detail}
              orderId={order?.orderId}
              percent={order?.priceRate?.percent}
              orderStatus={order?.orderStatus}
              order={order}
            />
          </div>
        ))}
        <div className="flex justify-between items-center text-xl mt-8">
          <div className="font-bold text-gray-800 flex justify-between gap-10">
            <div>
              Subtotal:{" "}
              {order?.totalPrice?.toLocaleString("en-US", {
                style: "currency",
                currency: "USD",
                maximumFractionDigits: 0,
              })}
            </div>
            <div>
              Discount: {(order?.totalDiscountPercent * 100)?.toFixed(0)}%
            </div>
          </div>
          <OrderStatus order={order} />
        </div>
        <div className="flex justify-between items-center">
          <div className="text-xl font-bold text-gray-800">
            Total:{" "}
            {(
              order.totalPrice *
              (1 - order.totalDiscountPercent)
            ).toLocaleString("en-US", {
              style: "currency",
              currency: "USD",
              maximumFractionDigits: 0,
            })}
          </div>

          <div className="flex gap-4">
            {order.orderStatus == "Pending" && (
              <button
                className="bg-gray-800 text-white px-4 py-2 rounded"
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
            {/* {order.orderStatus == "Completed" && ( */}
            <button
              className="bg-primary text-white px-4 py-2 rounded"
              onClick={showModalInvoice}
            >
              Export Invoice
            </button>
            {/* )} */}
            <button className="bg-gray-200 text-gray-800 px-4 py-2 rounded">
              <a href="mailto:datj.company@gmail.com">Contact Seller</a>
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default OrderItem;
