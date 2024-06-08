import Information from "./components/Information";
import React, { useState } from "react";
import CartItem from "./components/CartItem";
import { useCartStore } from "../../store/cartStore";
import { Button } from "antd";
import { GET, POST } from "../../utils/request";
import Loading from "./../../components/Loading";
import { useCheckoutStore } from "../../store/checkoutStore";
import { useNavigate } from "react-router-dom";

const Cart: React.FC = () => {
  const [isLoading, setIsLoading] = useState(false);
  const navigate = useNavigate();
  const cart = useCartStore((state) => state.cart);
  const totalPrice = cart.reduce((total, item) => {
    // Placeholder, you should replace with actual price from fetched data
    const diamondPrice = item.diamondId;
    const accessoryPrice = item.accessoryId || 0;
    return total + diamondPrice + accessoryPrice;
  }, 0);
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
            <Button
              className="w-1/5 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
              type="default"
            >
              <a href="/">Continue shopping.</a>
            </Button>
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
              <Button
                className="w-1/5 hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                type="default"
              >
                <a href="/">Continue Shopping</a>
              </Button>
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
                <span className="font-bold">${totalPrice.toFixed(2)}</span>
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
                  if (!infor) {
                    navigate("/authentication/login");
                    return;
                  } else {
                    useCheckoutStore
                      .getState()
                      .setPhoneNumber(infor?.phoneNumber);
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
