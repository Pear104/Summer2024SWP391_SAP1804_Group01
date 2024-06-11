import { Breadcrumb, Button, Divider, Input, Skeleton } from "antd";
import { Outlet } from "react-router-dom";
import Logo from "../components/logo/Logo";
import { useCartStore } from "../store/cartStore";
import { useQueries } from "@tanstack/react-query";
import { GET } from "../utils/request";
import CheckoutCartItem from "../pages/checkout/components/CheckoutCartItem";
import { Tags } from "lucide-react";

const item = [
  {
    title: "Cart",
    href: "/cart",
  },
  {
    title: "Information",
    href: "/checkout/",
  },
  {
    title: "Shipping",
    href: "/checkout/shipping",
  },
  {
    title: "Payment",
    href: "/checkout/payment",
  },
];

export default function CheckoutLayout() {
  const [diamondPrices, materialPrices] = useQueries({
    queries: [
      {
        queryKey: ["diamondPrices"],
        queryFn: () => GET("/api/DiamondPrices/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["materialPrices"],
        queryFn: () => GET("/api/MaterialPrices/"),
        staleTime: Infinity,
      },
    ],
  });
  const cart = useCartStore((state) => state.cart);
  return (
    <div className="top-0 right-0 fixed w-screen h-screen grid grid-cols-2">
      <div className="border-r p-4 overflow-y-scroll">
        <div className="mb-2">
          <Logo />
        </div>
        <Breadcrumb separator=">" items={item} />
        <div>
          <Outlet />
        </div>
      </div>
      <div className="bg-stone-200 px-10 flex flex-col gap-2 overflow-y-scroll pb-10">
        <Divider orientation="left" className="text-xl font-bold">
          Your order
        </Divider>
        {cart && diamondPrices?.data && materialPrices?.data
          ? cart.map((item, index) => (
              <CheckoutCartItem
                key={index}
                cartItem={item}
                diamondPrice={diamondPrices?.data}
                materialPrice={materialPrices?.data}
              />
            ))
          : cart.map((_item, index) => (
              <div key={index} className="flex gap-2">
                <Skeleton.Image active className="w-[80px] h-[80px]" />
                <Skeleton.Input active className="h-[80px] w-full" />
              </div>
            ))}
        <Divider />
        <div className="flex flex-col gap-2">
          <div className="flex gap-4">
            <Input className="w-full" placeholder="Discount code" />
            <Button
              className="px-8 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
              htmlType="submit"
            >
              Apply
            </Button>
          </div>
          <div>
            <div className="font-semibold mb-2">
              Enter the discount code or select from below
            </div>
            {/* Discount code items */}
            <div className="cursor-pointer text-primary font-semibold flex justify-between py-3 px-4 bg-slate-300 hover:bg-slate-300/40">
              <div className="flex gap-2">
                <Tags />
                GET5 - Get 5% off on your order
              </div>
              <div className="uppercase">Apply</div>
            </div>
          </div>
          <Divider />
          <div className="text-base">
            <div className="flex justify-between">
              <div>Subtotal</div>
              <div className="font-semibold">$100</div>
            </div>
            <div className="flex justify-between">
              <div>Shipping</div>
              <div className="font-semibold">$100</div>
            </div>
          </div>
          <Divider />
          <div className="flex w-full justify-between ">
            <div className="text-3xl">Total</div>
            <div className="flex items-center gap-2">
              <div className="text-xs">USD</div>
              <div className="font-semibold text-3xl">$200</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
