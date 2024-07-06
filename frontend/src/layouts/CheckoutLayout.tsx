import { Breadcrumb, Button, Divider, Input, Skeleton, message } from "antd";
import { Outlet } from "react-router-dom";
import Logo from "../components/logo/Logo";
import { useCartStore } from "../store/cartStore";
import { useQueries } from "@tanstack/react-query";
import { GET } from "../utils/request";
import CheckoutCartItem from "../pages/checkout/components/CheckoutCartItem";
import { Tags, X } from "lucide-react";
import { useEffect, useState } from "react";
import { getAccessoryPrice, getDiamondPrice } from "../utils/getPrice";
import { useCheckoutStore } from "../store/checkoutStore";
// import { CheckOutlined } from "@ant-design/icons";

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
    title: "Payment",
    href: "/checkout/payment",
  },
];

export default function CheckoutLayout() {
  const [diamondPrices, materialPrices, priceRate, userInfo, promotion] =
    useQueries({
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
        {
          queryKey: ["priceRate"],
          queryFn: () => GET("/api/PriceRate/latest"),
          staleTime: Infinity,
        },
        {
          queryKey: ["userInfo"],
          queryFn: () => GET("/api/Accounts/me"),
        },
        {
          queryKey: ["promotion"],
          queryFn: () => GET("/api/Promotion/active"),
        },
      ],
    });

  const cart = useCartStore((state) => state.cart);
  const [totalPrice, setTotalPrice] = useState(0);
  const [appliedPromotion, setAppliedPromotion] = useState("");
  const [discountCode, setDiscountCode] = useState("");

  useEffect(() => {
    (async () => {
      const totalPricePromise = Promise.all(
        cart.map(async (item) => {
          const diamond = await GET(`/api/Diamonds/${item.diamondId}`);
          const accessory = await GET(`/api/Accessories/${item?.accessoryId}`);
          let totalPrice = getDiamondPrice(
            diamond,
            diamondPrices?.data,
            priceRate?.data?.percent
          );
          if (accessory?.accessoryId) {
            totalPrice += getAccessoryPrice(
              accessory,
              materialPrices?.data,
              item.size,
              priceRate?.data?.percent
            );
          }
          return totalPrice;
        })
      );
      const totalPrice = await totalPricePromise.then((prices) =>
        prices.reduce((total, price) => total + price, 0)
      );
      setTotalPrice(totalPrice);
    })();
  }, [cart, diamondPrices, materialPrices, priceRate]);

  useEffect(() => {
    if (cart.length == 0) {
      location.href = "/";
    }
  }, []);

  const handleApplyPromotion = (promotion: any) => {
    if (appliedPromotion !== promotion.promotionCode) {
      setAppliedPromotion(promotion.promotionCode);
      useCheckoutStore.getState().setPromotionCode(promotion.promotionCode);
      message.success(`Applied promotion: ${promotion.promotionCode}`);
    } else {
      message.warning(
        `Promotion ${promotion.promotionCode} is already applied.`
      );
    }
  };

  // const isPromotionApplied = (promotionCode: string): boolean => {
  //   return appliedPromotion === promotionCode;
  // };
  const removePromotion = (): void => {
    const removedPromotion = appliedPromotion;
    setAppliedPromotion("");
    useCheckoutStore.getState().setPromotionCode("");
    message.success(`Removed promotion: ${removedPromotion}`);
  };

  const handleDiscountCodeApply = async () => {
    try {
      const promo = await GET(`/api/Promotion/${discountCode}`);
      if (promo) {
        const currentTime = new Date();
        if (promo.startTime && promo.endTime) {
          const startTime = new Date(promo.startTime);
          const endTime = new Date(promo.endTime);

          if (currentTime < startTime) {
            message.error(`Promotion ${discountCode} is not yet active.`);
          } else if (currentTime > endTime) {
            message.error(`Promotion ${discountCode} has expired.`);
          } else {
            handleApplyPromotion(promo);
          }
        } else {
          message.error(`Promotion ${discountCode} is not valid.`);
        }
      }
    } catch (error) {
      message.error(`Failed to apply promotion code: ${discountCode}`);
    }
  };

  const calculateDiscount = () => {
    let discount = 0;
    if (appliedPromotion) {
      const promo = promotion?.data?.find(
        (p: any) => p.promotionCode === appliedPromotion
      );
      if (promo) {
        discount += promo.discountPercent;
      }
    }
    return discount;
  };

  const totalDiscount = calculateDiscount() + userInfo?.data?.rank?.discount;

  return (
    <div className="top-0 right-0 fixed w-screen h-screen grid grid-cols-2">
      <div className="border-r p-4 overflow-y-scroll">
        <div className="mb-2">
          <Logo />
        </div>
        <Breadcrumb separator=">" items={item} />
        <div>
          {/* Different pages only have different forms */}
          <Outlet />
        </div>
      </div>
      {/* The content in the right side */}
      <div className="bg-stone-200 px-10 flex flex-col gap-2 overflow-y-scroll pb-10">
        <Divider orientation="left" className="text-xl font-bold">
          Your order
        </Divider>
        {cart.map((item, index) => (
          <CheckoutCartItem
            key={index}
            cartItem={item}
            diamondPrice={diamondPrices?.data}
            materialPrice={materialPrices?.data}
            priceRate={priceRate?.data?.percent}
          />
        ))}
        <Divider />
        <div className="font-semibold mb-2">Enter the discount code</div>
        <div className="flex flex-col gap-2">
          <div className="flex gap-4">
            <Input
              className="w-full"
              placeholder="Discount code"
              onChange={(e) => setDiscountCode(e.target.value)}
            />
            <Button
              className="px-8 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
              htmlType="submit"
              onClick={handleDiscountCodeApply}
            >
              Apply
            </Button>
          </div>
          <div className="font-light mb-2 italic">
            * Based on your current rank in our system, you are eligible for a {userInfo?.data?.rank?.discount *100}% discount on this order.
          </div>
          <div>
            <div className="flex gap-2">
              {appliedPromotion && (
                <div className="cursor-pointer text-black font-semibold flex justify-between py-3 px-4 bg-slate-300">
                  <div className="flex gap-3 ">
                    <Tags />
                    {appliedPromotion}
                    <button
                      className="m-0 p-0 text-gray-500 hover:text-slate-300 text-bold text-3xl"
                      onClick={removePromotion}
                    >
                      <X />
                    </button>
                  </div>
                </div>
              )}
            </div>

            {/* Discount code items */}
            {/* {promotion?.data?.map((promotion: any) => (
              <div
                key={promotion.promotionCode}
                className="cursor-pointer text-primary font-semibold flex justify-between py-3 px-4 bg-slate-300 hover:bg-slate-300/40"
              >
                <div className="flex gap-2 text-blue-900 items-center">
                  <Tags />
                  {promotion.promotionCode} - {promotion.promotionName}: Get{" "}
                  {promotion.discountPercent * 100}% off
                </div>
                {isPromotionApplied(promotion.promotionCode) ? (
                  <CheckOutlined />
                ) : (
                  <Button
                    className="px-4 py-4 hover:scale-95 font-bold text-white bg-primary flex items-center justify-center"
                    onClick={() => handleApplyPromotion(promotion)}
                  >
                    Apply
                  </Button>
                )}
              </div>
            ))} */}
          </div>
          <Divider />
          <div className="text-base">
            <div className="flex justify-between mb-2">
              <div>Subtotal</div>
              <div className="font-semibold">
                {totalPrice != 0 && totalPrice ? (
                  totalPrice.toLocaleString("en-US", {
                    style: "currency",
                    currency: "USD",
                    maximumFractionDigits: 0,
                  })
                ) : (
                  <Skeleton.Button
                    active={true}
                    className="w-[100px]"
                    size="small"
                  />
                )}
              </div>
            </div>
            <div className="flex justify-between">
              <div>Discount</div>
              <div className="font-semibold">{totalDiscount * 100 + "%"}</div>
            </div>
          </div>
          <Divider />
          <div className="flex w-full justify-between ">
            <div className="text-3xl">Total</div>
            <div className="flex items-center gap-2">
              <div className="text-xs">USD</div>
              <div className="font-semibold text-3xl">
                {totalPrice != 0 && totalPrice ? (
                  (totalPrice * (1 - totalDiscount)).toLocaleString("en-US", {
                    style: "currency",
                    currency: "USD",
                    maximumFractionDigits: 0,
                  })
                ) : (
                  <Skeleton.Button
                    active={true}
                    className="w-[60px]"
                    size="small"
                  />
                )}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
