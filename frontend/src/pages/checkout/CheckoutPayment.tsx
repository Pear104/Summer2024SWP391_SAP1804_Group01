import { Button, Divider } from "antd";
import { ArrowLeftOutlined } from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import { Truck } from "lucide-react";
import EditCheckoutInfo from "./components/EditCheckoutInfo";
import { POST, PUT } from "../../utils/request";
import { useCartStore } from "../../store/cartStore";
import { useState } from "react";
import Loading from "../../components/Loading";
import { useCheckoutStore } from "../../store/checkoutStore";
import {
  PayPalScriptProvider,
  PayPalButtons,
  PayPalButtonsComponentProps,
} from "@paypal/react-paypal-js";

// Renders errors or successfull transactions on the screen.
interface MessageProps {
  content: string;
}

const Message: React.FC<MessageProps> = ({ content }) => {
  return <p>{content}</p>;
};

export default function CheckoutPayment() {
  const [isLoading, setIsLoading] = useState(false);
  const cart = useCartStore((state) => state.cart);
  const clearCart = useCartStore((state) => state.clearCart);
  const navigate = useNavigate();

  const initialOptions = {
    clientId: import.meta.env.VITE_PAYPAL_CLIENT_ID,
    currency: "USD",
    "data-page-type": "product-details",
    components: "buttons",
    "data-sdk-integration-source": "developer-studio",
  };

  const [message, setMessage] = useState<string>("");
  return (
    <div className="">
      <Divider>
        <div className="font-bold text-2xl">Check Shipping Information</div>
      </Divider>
      <div className="text-center mb-2 italic">
        Please check your information again before finish payment
      </div>
      <EditCheckoutInfo />
      {isLoading && <Loading />}
      <div className="flex flex-col gap-2 mt-6">
        <Divider>
          <div className="font-bold text-2xl">Payment Method</div>
        </Divider>
        <div className="text-center mb-2 italic">
          Choose your payment method.
        </div>
        <div>
          <div className="border rounded-xl">
            <div className="border-b w-full p-4 font-bold flex gap-4">
              <div>
                <div className="text-lg flex gap-4 flex-wrap">
                  <Button
                    className="px-8 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                    onClick={async () => {
                      console.log(cart);
                      setIsLoading(true);
                      const orderResponse = await POST("/api/Order", {
                        orderDetails: cart,
                        shippingAddress:
                          useCheckoutStore.getState().shippingAddress,
                        phoneNumber: useCheckoutStore.getState().phoneNumber,
                        promotionCode:
                          useCheckoutStore.getState().promotionCode,
                      });
                      console.log("orderResponse: ", orderResponse);
                      if (orderResponse?.orderId) {
                        const transactionResponse = await POST(
                          "/api/Transactions",
                          {
                            orderId: orderResponse.orderId,
                            amount:
                              orderResponse.totalPrice *
                              (1 - orderResponse.totalDiscountPercent),
                            paymentMethod: "CREDIT_CARD",
                          }
                        );
                        console.log(
                          "transactionResponse: ",
                          transactionResponse
                        );
                        const paymentResponse = await POST(
                          "/api/payment/vnpay-sent-request",
                          {
                            paymentContent:
                              "Thanh toan don hang " + orderResponse?.orderId,
                            paymentCurrency: "USD",
                            paymentRefId: transactionResponse?.transactionId,
                            requiredAmount: (
                              orderResponse?.totalPrice *
                              (1 - orderResponse?.totalDiscountPercent)
                            ).toFixed(0),
                            paymentLanguage: "en",
                            merchantId: "MER0001",
                            paymentDestinationId: "VNPAY",
                            signature: "123456789ABC",
                          }
                        );
                        if (paymentResponse?.paymentUrl) {
                          clearCart();
                          location.href = paymentResponse.paymentUrl;
                        }
                      }
                      setIsLoading(false);
                    }}
                  >
                    <div className="flex gap-4 w-150">
                      <img
                        src="/images/vnpay.png"
                        className="w-[100px] h-auto"
                      />{" "}
                      Credit Card
                    </div>
                  </Button>

                  <Button
                    className="gap-4 px-8 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                    onClick={async () => {
                      setIsLoading(true);
                      const orderResponse = await POST("/api/Order", {
                        orderDetails: cart,
                      });
                      console.log("orderResponse: ", orderResponse);
                      if (orderResponse.orderId) {
                        const transactionResponse = await POST(
                          "/api/Transactions",
                          {
                            orderId: orderResponse.orderId,
                            amount: orderResponse.totalPrice * 0.4,
                            paymentMethod: "SHIP_COD",
                          }
                        );
                        console.log(
                          "transactionResponse: ",
                          transactionResponse
                        );
                        const paymentResponse = await POST(
                          "/api/payment/vnpay-sent-request",
                          {
                            paymentContent:
                              "Dat coc don hang " + orderResponse?.orderId,
                            paymentCurrency: "USD",
                            paymentRefId: transactionResponse?.transactionId,
                            requiredAmount: (
                              orderResponse?.totalPrice *
                              0.4 *
                              (1 - orderResponse?.totalDiscountPercent / 100)
                            ).toFixed(0),
                            paymentLanguage: "en",
                            merchantId: "MER0001",
                            paymentDestinationId: "VNPAY",
                            signature: "123456789ABC",
                          }
                        );
                        if (paymentResponse?.paymentUrl) {
                          clearCart();
                          location.href = paymentResponse.paymentUrl;
                        }
                      }
                      setIsLoading(false);
                    }}
                  >
                    <Truck />
                    Ship COD (Deposit 40%)
                  </Button>

                  <PayPalScriptProvider options={initialOptions}>
                    <PayPalButtons
                      className="hover:scale-95 font-bold text-white flex items-center justify-center w-[300px]"
                      style={{
                        shape: "rect",
                        layout: "horizontal",
                        color: "white",
                        label: "paypal",
                        disableMaxWidth: true,
                        tagline: false,
                      }}
                      createOrder={async (): Promise<string> => {
                        try {
                          //Tao order trong database
                          console.log("Tao order trong database");
                          const orderResponse = await POST("/api/Order", {
                            orderDetails: cart,
                            shippingAddress:
                              useCheckoutStore.getState().shippingAddress,
                            phoneNumber:
                              useCheckoutStore.getState().phoneNumber,
                            promotionCode:
                              useCheckoutStore.getState().promotionCode,
                          });
                          console.log("orderResponse: ", orderResponse);
                          if (orderResponse?.orderId) {
                            //Tao transaction trong database
                            console.log("Tao transaction trong database");
                            const transactionResponse = await POST(
                              "/api/Transactions",
                              {
                                orderId: orderResponse.orderId,
                                amount:
                                  orderResponse.totalPrice *
                                  (1 - orderResponse.totalDiscountPercent),
                                paymentMethod: "Paypal",
                              }
                            );
                            console.log(
                              "transactionResponse: ",
                              transactionResponse
                            );
                            console.log(transactionResponse?.transactionId);
                            console.log("Tao xong order trong database");
                            console.log("Tao order trong paypal");
                            //Tao order trong paypal
                            const response = await POST(
                              "/api/Order/createPaypalOrder",
                              {
                                orderId: orderResponse?.orderId,
                                reference: transactionResponse?.transactionId,
                              }
                            );
                            console.log("ket qua: ", response);
                            // const orderData = await response.json();
                            if (response.id) {
                              console.log("Thanh cong");
                              return response.id;
                            } else {
                              const errorDetail = response?.details?.[0];
                              const errorMessage = errorDetail
                                ? `${errorDetail.issue} ${errorDetail.description} (${response.debug_id})`
                                : JSON.stringify(response);

                              throw new Error(errorMessage);
                            }
                          }
                        } catch (error) {
                          // console.error(error);
                          setMessage(
                            `Could not initiate PayPal Checkout...${error}`
                          );
                          throw error;
                        }
                        return "Order creation failed";
                      }}
                      onApprove={async (data, actions) => {
                        try {
                          console.log("Bat dau Approve");
                          console.log("data: ", data);
                          const response = await POST(
                            "/api/Order/capturePaypalOrder",
                            {
                              orderId: data.orderID,
                            }
                          );
                          console.log("Ket qua tra ve: ", response);
                          console.log("TransactionId: " + response?.purchase_units[0].reference_id);
                          const reference_id = response?.purchase_units[0].reference_id;
                          const updatePart = reference_id.split("-");
                          const orderId = updatePart[0].substring(3);
                          const orderData =  response?.data;
                          console.log("orderData: ", orderData);
                          // Three cases to handle:
                          //   (1) Recoverable INSTRUMENT_DECLINED -> call actions.restart()
                          //   (2) Other non-recoverable errors -> Show a failure message
                          //   (3) Successful transaction -> Show confirmation or thank you message

                          const errorDetail = orderData?.details?.[0];

                          if (errorDetail?.issue === "INSTRUMENT_DECLINED") {
                            // (1) Recoverable INSTRUMENT_DECLINED -> call actions.restart()
                            // recoverable state, per https://developer.paypal.com/docs/checkout/standard/customize/handle-funding-failures/
                            return actions.restart();
                          } else if (errorDetail) {
                            // (2) Other non-recoverable errors -> Show a failure message
                            throw new Error(
                              `${errorDetail.description} (${orderData.debug_id})`
                            );
                          } else {
                            // (3) Successful transaction -> Show confirmation or thank you message
                            // Or go to another URL:  actions.redirect('thank_you.html');                            
                            if (response?.status == "COMPLETED") {
                              console.log("Ahihi");
                              clearCart();
                              const completePaymentTransactionResponse = await PUT(
                                "/api/Transactions/completePayment/" + reference_id,
                                {
                                }
                              );
                              const completePaymentOrderResponse = await PUT(
                                "/api/Order/completePayment/" + orderId,
                                {

                                }, 
                              );
                              console.log("completePaymentTransactionResponse: ", completePaymentTransactionResponse);
                              console.log("completePaymentOrderResponse: ", completePaymentOrderResponse);
                              location.href = ("/account/order-history");
                            }
                            console.log("Thanh cong");
                          }
                        } catch (error) {
                          console.error(error);
                          setMessage(
                            `Sorry, your transaction could not be processed...${error}`
                          );
                        }
                      }}
                    />
                  </PayPalScriptProvider>
                  <Message content={message} />
                  {/* <Button
                    className="gap-4 px-8 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                    onClick={async () => {
                      console.log(cart);
                      setIsLoading(true);
                      await POST("/api/Order", {
                        orderDetails: cart,
                      });
                      clearCart();
                      setIsLoading(false);
                      navigate("/account/order-history");
                    }}
                  >
                    <Truck />
                    Test
                  </Button> */}
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
    </div>
  );
}
