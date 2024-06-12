import { Button, DatePicker, Divider, Form, Input, Select } from "antd";
import * as z from "zod";
import { FormItem } from "react-hook-form-antd";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { POST } from "../../utils/request";
import { useEffect, useState } from "react";
import { setCookie } from "../../utils/cookie";
import { ArrowLeftOutlined } from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import { useCheckoutStore } from "../../store/checkoutStore";

const phoneRegex = new RegExp(
  /^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$/
);

const schema = z
  .object({
    email: z
      .string()
      .email()
      .min(8, { message: "Invalid email" })
      .max(32, { message: "Email should be less than 32 characters" }),
    name: z
      .string()
      .min(6, { message: "Name should be at least 6 characters" })
      .max(32, { message: "Name should be less than 32 characters" })
      .refine((value) => value.trim().length > 0, {
        message: "Name cannot be empty",
      }),
    phoneNumber: z
      .string()
      .regex(phoneRegex, "Invalid phone number!")
      .min(10, "Invalid phone number!")
      .max(16, "Invalid phone number!"),
    address: z
      .string()
      .min(12, { message: "Invalid address" })
      .refine((value) => value.trim().length > 0, {
        message: "Address cannot be empty",
      }),
  });

export default function CheckoutInfo() {
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();
  const { control, handleSubmit, setError, reset } = useForm({
    defaultValues: {
      name: "", 
      email: "",
      phoneNumber: "",
      address: "",
    },
    resolver: zodResolver(schema),
  });

  useEffect(() => {
    reset({
      email: useCheckoutStore.getState().email,
      phoneNumber: useCheckoutStore.getState().phoneNumber,
      address: useCheckoutStore.getState().shippingAddress,
      name: useCheckoutStore.getState().name,
    });
  }, [reset]);
  return (
    <Form
      layout="vertical"
      autoComplete="off"
      className="flex flex-col gap-[4px]"
      onFinish={handleSubmit(async (formData) => {
        console.log(formData);
        setIsLoading(true);
        useCheckoutStore.getState().setEmail(formData.email);
        useCheckoutStore.getState().setPhoneNumber(formData.phoneNumber);
        useCheckoutStore.getState().setName(formData.name);
        useCheckoutStore.getState().setShippingAddress(formData.address);
        setIsLoading(false);
        navigate("/checkout/payment");
      })}
    >
      <Divider orientation="left" className="text-3xl font-bold">
        Shipping Information
      </Divider>
      <FormItem
        className="w-full"
        label="Name"
        name="name"
        control={control}
        required
      >
        <Input
          placeholder="Your name"
          className="text-black text-sm border border-primary py-2 px-4 without-ring w-full rounded-none"
        />
      </FormItem>
      <FormItem
        className="w-full"
        label="Phone number"
        name="phoneNumber"
        control={control}
        required
      >
        <Input
          placeholder="Your phone number"
          className="border text-sm border-primary py-2 px-4 without-ring rounded-none"
        />
      </FormItem>
      <FormItem
        className="w-full"
        label="Email"
        name="email"
        control={control}
        required
      >
        <Input
          placeholder="Your email"
          className="text-black text-sm border border-primary py-2 px-4 without-ring w-full rounded-none"
        />
      </FormItem>
      {/* <Divider orientation="left" className="text-xl font-bold">
        Shipping Address
      </Divider> */}
      <FormItem
        label="Address"
        name="address"
        control={control}
        required
        className=""
      >
        <Input
          placeholder="Your address"
          className="border text-sm border-primary py-2 px-4 without-ring w-full rounded-none"
        />
      </FormItem>

      <div className="flex justify-between items-center">
        <div
          className="text-lg text-blue-500 hover:text-blue-400 cursor-pointer"
          onClick={() => {
            
            navigate("/cart");
          }}
        >
          <ArrowLeftOutlined className="pr-2" />
          Return to cart
        </div>
        <Form.Item>
          <Button
            className="px-8 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
            htmlType="submit"
            // navigate("/checkout/payment");
            >
            Continue to Payment
          </Button>
        </Form.Item>
      </div>
    </Form>
  );
}
