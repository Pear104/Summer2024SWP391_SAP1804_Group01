import { Check } from "lucide-react";
import { useCartStore } from "../../../store/cartStore";
import { Link } from "react-router-dom";
import CompleteRingIcon from "./CompleteRingIcon";
import { Skeleton } from "antd";

export default function ChooseItemComplete({
  accessory,
  totalPrice,
}: {
  accessory: any;
  totalPrice: any;
}) {
  const currentDiamond = useCartStore((state) => state.currentDiamond);
  const currentAccessory = useCartStore((state) => state.currentAccessory);
  return (
    <Link
      to={
        !currentDiamond
          ? "/product/diamond"
          : !currentAccessory
          ? "/product/accessory"
          : "/product/complete"
      }
      className={`font-bold border-2 border-primary py-4 rounded-r-full flex items-center w-[400px] justify-between ${
        currentDiamond && currentAccessory ? "pr-8" : "px-8"
      }`}
    >
      {!currentDiamond || !currentAccessory ? (
        <>
          <div className="font-bold text-2xl">3</div>
          <div className="flex-grow px-4">Complete Accessory</div>
        </>
      ) : (
        <div className="flex flex-grow px-4 justify-start gap-2 items-stretch">
          <div className="flex items-center">
            <Check className="" color="#1fadea" strokeWidth={1.25} />
          </div>
          <div className="text-sm flex flex-col">
            <div className="text-sm truncate w-[260px]">Complete Accessory</div>
            <div className="flex items-end gap-4">
              <div className="font-semibold">
                {totalPrice == 0 ? (
                  <Skeleton.Input active={true} size={"small"} />
                ) : (
                  totalPrice
                )}
              </div>
              <div className="text-xs flex gap-2 text-slate-400">
                <Link
                  className="border-b cursor-pointer"
                  to={`/product/complete`}
                >
                  View
                </Link>
              </div>
            </div>
          </div>
        </div>
      )}
      <div
        className={`flex ${
          (!currentDiamond || !currentAccessory) && "w-[24px]"
        }`}
      >
        {!currentDiamond || !currentAccessory ? (
          <CompleteRingIcon />
        ) : (
          <div
            className="col-span-4 place-self-center aspect-square bg-cover bg-top bg-no-repeat w-[50px] border "
            style={{
              backgroundImage: `url(${
                accessory?.accessoryImages && accessory?.accessoryImages[0].url
              })`,
            }}
          ></div>
        )}
      </div>
    </Link>
  );
}
