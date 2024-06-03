import { Check } from "lucide-react";

import { useCartStore } from "../../../store/cartStore";
import DiamondIcon from "./DiamondIcon";
import { Link } from "react-router-dom";

export default function ChooseItemDiamond({
  diamond,
  price,
}: {
  diamond: any;
  price: any;
}) {
  const currentDiamond = useCartStore((state) => state.currentDiamond);
  const setCurrentDiamond = useCartStore((state) => state.setCurrentDiamond);
  return (
    <Link
      to={`/product/diamond`}
      className={`font-bold border-2 border-primary py-4 rounded-l-full flex items-center w-[400px] justify-between ${
        currentDiamond ? "pr-8" : "px-8"
      }`}
    >
      {!currentDiamond ? (
        <>
          <div className="font-bold text-2xl">1</div>
          <div className="flex-grow px-4">Choose a Diamond</div>
        </>
      ) : (
        <div className="flex flex-grow px-4 justify-start gap-2 items-stretch">
          <div className="flex items-center">
            <Check className="" color="#1fadea" strokeWidth={1.25} />
          </div>
          <div className="text-sm flex flex-col">
            <div className="text-sm truncate w-[260px]">{`${diamond?.carat} Carat ${diamond?.shape} Shape Lab Diamond`}</div>
            <div className="flex items-end gap-4">
              <div className="font-semibold">{price}</div>
              <div className="text-xs flex gap-2 text-slate-400">
                <Link
                  className="border-b cursor-pointer"
                  to={`/product/diamond/detail/${currentDiamond}`}
                >
                  View
                </Link>
                <div
                  className="border-b cursor-pointer"
                  onClick={() => {
                    if (location.pathname.includes("complete")) {
                      location.href = "/product/diamond";
                    }
                    setCurrentDiamond(null);
                  }}
                >
                  Remove
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
      <div className={`flex ${!currentDiamond && "w-[24px]"}`}>
        {!currentDiamond ? (
          <DiamondIcon />
        ) : (
          <div
            className="col-span-4 place-self-center aspect-square bg-cover bg-top bg-no-repeat w-[50px] border "
            style={{
              backgroundImage: `url(${diamond?.imageUrl})`,
            }}
          ></div>
        )}
      </div>
    </Link>
  );
}
