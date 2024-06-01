import { useCartStore } from "../../../store/cartStore";
import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../utils/request";
import ChooseItemDiamond from "./ChooseItemDiamond";
import ChooseItemAccessory from "./ChooseItemAccessory";
import ChooseItemComplete from "./ChooseItemComplete";

export default function ChooseItem() {
  const currentDiamond = useCartStore((state) => state.currentDiamond);
  const currentAccessory = useCartStore((state) => state.currentAccessory);
  const [diamond, accessory] = useQueries({
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
    ],
  });
  return (
    <div id="choose-item" className="flex mulish-regular">
      <ChooseItemDiamond diamond={diamond?.data} />
      <ChooseItemAccessory accessory={accessory?.data} />
      <ChooseItemComplete accessory={accessory?.data} />
    </div>
  );
}
