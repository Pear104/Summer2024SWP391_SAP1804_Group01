import {
  Button,
  DatePicker,
  Divider,
  Form,
  Input,
  Select,
  message,
} from "antd";
import { FormItem } from "react-hook-form-antd";

import { ArrowLeftOutlined } from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import { CreditCard } from "lucide-react";
import EditCheckoutInfo from "./components/EditCheckoutInfo";
import { POST } from "../../utils/request";
import { useCartStore } from "../../store/cartStore";
import { useState } from "react";
import Loading from "../../components/Loading";

export default function CheckoutPayment() {
  const [isLoading, setIsLoading] = useState(false);
  const cart = useCartStore((state) => state.cart);
  const navigate = useNavigate();
  const [messageApi, contextHolder] = message.useMessage();
  return (
    <>
      {contextHolder}
      <div className="">
        <EditCheckoutInfo />
        {isLoading && <Loading />}
        <div className="flex flex-col gap-2 mt-6">
          <div className="font-bold text-xl">Payment</div>
          <div className="mb-2">All transactions are secured and encrypted</div>
          <div>
            <div className="border rounded-xl">
              <div className="border-b w-full p-4 font-bold flex gap-4">
                <CreditCard />
                Credit card
              </div>
              <div className="w-full p-4">
                <Form
                  layout="vertical"
                  autoComplete="off"
                  className="flex flex-col gap-4"
                  // onFinish={handleSubmit(async (formData) => {
                  //   setIsLoading(true);
                  //   const authResponse = await POST("/api/Payment", formData);
                  //   if (authResponse) {
                  //     if (authResponse.token) {
                  //       setCookie("accessToken", authResponse.token, 7);
                  //       location.href = "/account";
                  //     }
                  //   } else {
                  //     setIsLoading(false);
                  //     setError("email", {
                  //       type: "manual",
                  //       message: "Email already be used!",
                  //     });
                  //   }
                  // })}
                >
                  <Form.Item
                    className="mb-0"
                    // label="Email"
                    // name="email"
                    // control={control}
                  >
                    <Input
                      placeholder="Card number"
                      className="text-black text-sm border py-2 px-4 without-ring w-full rounded-none"
                    />
                  </Form.Item>
                  <Form.Item
                    className="mb-0"
                    // label="Email"
                    // name="email"
                    // control={control}
                  >
                    <Input
                      placeholder="Name on card"
                      className="text-black text-sm border py-2 px-4 without-ring w-full rounded-none"
                    />
                  </Form.Item>
                  <div className="flex w-full justify-between gap-4">
                    <Form.Item
                      // label="Expira"
                      // name="birthday"
                      // control={control}
                      className="w-full mb-0"
                      // required
                    >
                      <DatePicker
                        placeholder="Expiration Date (YYYY/MM/DD)"
                        className="border rounded-none w-full h-[38px]"
                      />
                    </Form.Item>
                    <Form.Item
                      className="mb-0 w-full"
                      // label="Email"
                      // name="email"
                      // control={control}
                    >
                      <Input
                        placeholder="Security code"
                        className="text-black text-sm border py-2 px-4 without-ring w-full rounded-none"
                      />
                    </Form.Item>
                  </div>
                </Form>
              </div>
            </div>
          </div>
        </div>

        <div className="flex justify-between items-center mt-8">
          <div
            className="text-lg text-blue-500 hover:text-blue-400 cursor-pointer"
            onClick={() => {
              navigate("/checkout/shipping");
            }}
          >
            <ArrowLeftOutlined className="pr-2" />
            Return to Shipping
          </div>
          <Button
            className="px-8 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
            onClick={async () => {
              console.log(cart);
              setIsLoading(true);
              const response = await POST("/api/Order", {
                orderDetails: cart,
              });
              await new Promise((resolve) => setTimeout(resolve, 2000));
              setIsLoading(false);
              if (response) {
                useCartStore.getState().clearCart();
                navigate("/account/order-history");
                messageApi.success("Payment successfully");
              } else {
                messageApi.error("Something went wrong, please try again");
              }
            }}
          >
            Pay now
          </Button>
        </div>
      </div>
    </>
  );
}
