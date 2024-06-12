import { Button, DatePicker, Divider, Form, Input, Select, message, } from "antd";
import { FormItem } from "react-hook-form-antd";
import { ArrowLeftOutlined } from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import { CreditCard, Truck } from "lucide-react";
import EditCheckoutInfo from "./components/EditCheckoutInfo";
import { POST } from "../../utils/request";
import { useCartStore } from "../../store/cartStore";
import { useState } from "react";
import Loading from "../../components/Loading";
import ButtonGroup from "antd/es/button/button-group";

export default function CheckoutPayment() {
  const [isLoading, setIsLoading] = useState(false);
  const cart = useCartStore((state) => state.cart);
  const clearCart = useCartStore((state) => state.clearCart);
  const navigate = useNavigate();
  const [messageApi, contextHolder] = message.useMessage();
  return (
    <>
      {contextHolder}
      <div className="">
        <Divider>
          <div className="font-bold text-2xl">Check Shipping Information</div>
        </Divider>
        <div className="text-center mb-2">Please check your information again before finish payment</div>
        <EditCheckoutInfo />
        {isLoading && <Loading />}
        <div className="flex flex-col gap-2 mt-6">
          <Divider>
            <div className="font-bold text-2xl">Payment Method</div>
          </Divider>
          <div className="text-center mb-2">Choose your payment method.</div>
          <div>
            <div className="border rounded-xl">
              <div className="border-b w-full p-4 font-bold flex gap-4">
                <div>
                  <div className="text-lg flex gap-4">
                    <Button className="px-8 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                      onClick={async () => {
                        console.log(cart);
                        setIsLoading(true);
                        const response = await POST("/api/Order", {
                          orderDetails: cart,
                        });
                        clearCart();
                        const paymentResponse = await POST(
                          "/api/payment/vnpay-sent-request",
                          {
                            paymentContent: "Thanh toan don hang " + response?.orderId,
                            paymentCurrency: "USD",
                            paymentRefId: `${response?.orderId}`,
                            requiredAmount: (
                              response?.totalPrice *
                              (1 - response?.totalDiscountPercent / 100)
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

                        await new Promise((resolve) => setTimeout(resolve, 2000));
                        setIsLoading(false);
                        if (response) {
                          useCartStore.getState().clearCart();
                          navigate("/account/order-history");
                          messageApi.success("Payment successfully");
                        } else {
                          messageApi.error("Something went wrong, please try again");
                        }
                      }}>
                      <div className="flex gap-4 w-150">
                        <img src="/images/vnpay.png" className="w-[100px] h-auto" /> Credit Card
                        </div>
                    </Button>

                    <Button className="gap-4 px-8 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center">
                      <Truck/>
                        Ship COD (Coming soon)
                    </Button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="flex justify-between items-center mt-8">
          <div
            className="text-lg text-blue-500 hover:text-blue-400 cursor-pointer"
            onClick={() => {
              navigate("/checkout/");
            }}
          >
            <ArrowLeftOutlined className="pr-2" />
            Return to Information
          </div>
        </div>
      </div >
    </>
  );
}