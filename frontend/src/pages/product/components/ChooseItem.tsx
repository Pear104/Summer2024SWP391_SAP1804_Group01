import { useCartStore } from "../../../store/cartStore";
import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../utils/request";
import ChooseItemDiamond from "./ChooseItemDiamond";
import ChooseItemAccessory from "./ChooseItemAccessory";
import ChooseItemComplete from "./ChooseItemComplete";
import { getAccessoryPrice, getDiamondPrice } from "../../../utils/getPrice";

export default function ChooseItem() {
  const currentDiamond = useCartStore((state) => state.currentDiamond);
  const currentAccessory = useCartStore((state) => state.currentAccessory);
  const currentSize = useCartStore((state) => state.currentSize);
  const [diamond, accessory, diamondPrice, materialPrice,priceRate] = useQueries({
    queries: [
      {
        queryKey: ["currentDiamond", currentDiamond],
        queryFn: () => GET(`/api/Diamonds/${currentDiamond}`),
        staleTime: Infinity,
      },
      {
        queryKey: ["currentAccessory", currentAccessory],
        queryFn: () => GET(`/api/Accessories/${currentAccessory}`),
        staleTime: Infinity,
      },
      {
        queryKey: ["diamondPrice"],
        queryFn: () => GET("/api/DiamondPrices/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["materialPrice"],
        queryFn: () => GET("/api/MaterialPrices/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["priceRate"],
        queryFn: () => GET("/api/PriceRate/latest"),
      },
    ],
  });
  return (
    <div id="choose-item" className="flex mulish-regular">
      <ChooseItemDiamond
        diamond={currentDiamond && diamond?.data}
        price={
          currentDiamond &&
          diamond?.data &&
          diamondPrice?.data &&
          getDiamondPrice(diamond?.data, diamondPrice?.data, priceRate?.data.percent).toLocaleString(
            "en-US",
            { style: "currency", currency: "USD", maximumFractionDigits: 0 }
          )
        }
      />
      <ChooseItemAccessory
        accessory={currentAccessory && accessory?.data}
        price={
          currentAccessory &&
          accessory?.data &&
          materialPrice?.data &&
          getAccessoryPrice(
            accessory?.data,
            materialPrice?.data,
            currentSize, 
            priceRate?.data.percent
          ).toLocaleString("en-US", {
            style: "currency",
            currency: "USD",
            maximumFractionDigits: 0,
          })
        }
      />
      <ChooseItemComplete
        accessory={currentAccessory && accessory?.data}
        totalPrice={
          currentAccessory &&
          accessory?.data &&
          diamondPrice?.data &&
          materialPrice?.data
            ? (
                getDiamondPrice(diamond.data, diamondPrice.data, priceRate?.data.percent) +
                getAccessoryPrice(
                  accessory.data,
                  materialPrice.data,
                  currentSize, 
                  priceRate?.data.percent
                )
              ).toLocaleString("en-US", {
                style: "currency",
                currency: "USD",
                maximumFractionDigits: 0,
              })
            : 0
        }
      />
    </div>
  );
}
