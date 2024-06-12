import Information from "./components/Information";
import React, { useEffect, useState } from "react";
import CartItem from "./components/CartItem";
import { useCartStore } from "../../store/cartStore";
import { Button, Skeleton } from "antd";
import { GET, POST } from "../../utils/request";
import Loading from "./../../components/Loading";
import { useCheckoutStore } from "../../store/checkoutStore";
import { useNavigate, Link } from "react-router-dom";
import { useQueries } from "@tanstack/react-query";
import { getAccessoryPrice, getDiamondPrice } from "../../utils/getPrice";

const Cart: React.FC = () => {
  const [isLoading] = useState(false);
  const [totalPriceCart, setTotalPriceCart] = useState(0);
  const navigate = useNavigate();
  const cart = useCartStore((state) => state.cart);
  const [diamondPrice, materialPrice, priceRate] = useQueries({
    queries: [
      {
        queryKey: ["diamondPrice"],
        queryFn: () => GET("/api/DiamondPrices/"),
      },
      {
        queryKey: ["materialPrice"],
        queryFn: () => GET("/api/MaterialPrices/"),
      },
      {
        queryKey: ["priceRate"],
        queryFn: () => GET("/api/PriceRate/latest"),
      },
    ],
  });
  useEffect(() => {
    (async () => {
      const totalPricePromise = Promise.all(
        cart.map(async (item) => {
          const diamond = await GET(`/api/Diamonds/${item.diamondId}`);
          const accessory = await GET(`/api/Accessories/${item?.accessoryId}`);
          let totalPrice = getDiamondPrice(
            diamond,
            diamondPrice?.data,
            priceRate?.data.percent
          );
          if (accessory?.accessoryId) {
            totalPrice += getAccessoryPrice(
              accessory,
              materialPrice?.data,
              item.size,
              priceRate?.data.percent
            );
          }

          return totalPrice;
        })
      );

      const totalPrice = await totalPricePromise.then((prices) =>
        prices.reduce((total, price) => total + price, 0)
      );
      console.log(totalPrice);
      setTotalPriceCart(totalPrice);
    })();
  }, [diamondPrice, materialPrice, cart, priceRate]);
  console.log(totalPriceCart);

  function EmptyCart() {
    useCartStore.getState().clearCart();
  }
  return (
    <div className="container mx-auto p-4 flex">
      {isLoading && <Loading />}
      {cart?.length === 0 ? (
        <div className="w-full h-full items-center m-40 flex-1 col-span-1">
          <div className="text-center font-light text-4xl w-full p-2">
            Shopping Cart is Empty
          </div>
          <div className="text-center font-light text-2xl w-full p-2">
            You have no items in your shopping cart.
          </div>
          <div className="flex items-center justify-center w-full p-2">
            <Link
              className="transition-all duration-300 rounded-xl w-1/5 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
              type="default"
              to="/product/diamond"
            >
              Continue shopping
            </Link>
          </div>
        </div>
      ) : (
        <div className="container mx-auto p-4 flex">
          <div className="w-3/4 pr-4">
            <h2 className="text-4xl font-bold mb-4">Your Cart</h2>
            <div className="grid grid-cols-1 gap-4">
              {cart?.map((item, index) => (
                <CartItem
                  key={index}
                  diamondId={item?.diamondId}
                  accessoryId={item?.accessoryId}
                  size={item.size}
                />
              ))}
            </div>
            <div className="flex items-center justify-between w-full pl-10 pr-10 pt-2">
              <Link
                className="rounded-lg transition-all duration-300 hover:scale-95 font-bold text-white bg-primary px-4 py-4 flex items-center justify-center"
                type="default"
                to="/product/diamond"
              >
                Continue Shopping
              </Link>
              <Button
                className="w-1/5 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                type="default"
                onClick={() => EmptyCart()}
              >
                Empty Cart
              </Button>
            </div>
          </div>

          <div className="w-1/4 p-4 bg-gray-100">
            <div className="max-w-md mx-auto border border-gray-400 p-6 rounded-lg">
              <h2 className="text-3xl mb-4 text-center">Order Summary</h2>
              <div className="flex justify-between items-center">
                <span className="font-bold">Total estimated:</span>
                <span className="font-bold">
                  {totalPriceCart != 0 ? (
                    totalPriceCart.toLocaleString("en-US", {
                      style: "currency",
                      currency: "USD",
                      maximumFractionDigits: 0,
                    })
                  ) : (
                    <Skeleton.Button active={true} size={"small"} />
                  )}
                </span>
              </div>
              <p className="text-gray-500 mb-4 text-center">
                Taxes and shipping calculated at checkout
              </p>
              {/* Checkout*/}
              <Button
                className="w-full hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                type="default"
                onClick={async () => {
                  const infor = await GET("/api/Accounts/me");
                  // Check if user is logged in
                  if (!infor) {
                    navigate("/authentication/login");
                    return;
                  } else {
                    useCheckoutStore
                      .getState()
                      .setPhoneNumber(infor?.phoneNumber);
                    useCheckoutStore.getState().setName(infor?.name);
                    useCheckoutStore.getState().setEmail(infor?.email);
                    useCheckoutStore
                      .getState()
                      .setShippingAddress(infor?.address);
                    // console.log(cart);
                    // setIsLoading(true);
                    // const response = await POST("/api/Order", {
                    //   orderDetails: cart,
                    // });
                    // setIsLoading(false);
                    // useCartStore.getState().clearCart();
                    navigate("/checkout");
                  }
                }}
              >
                CHECK OUT
              </Button>

              <Information />
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default Cart;
