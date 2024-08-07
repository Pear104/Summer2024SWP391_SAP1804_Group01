import { Check } from "lucide-react";

import { useCartStore } from "../../../store/cartStore";
import DiamondIcon from "./DiamondIcon";
import { Link, useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";
import { Skeleton } from "antd";

export default function ChooseItemDiamond({
  diamond,
  price,
}: {
  diamond: any;
  price: any;
}) {
  const currentDiamond = useCartStore((state) => state.currentDiamond);
  const setCurrentDiamond = useCartStore((state) => state.setCurrentDiamond);
  const setCurrentAccessory = useCartStore(
    (state) => state.setCurrentAccessory
  );
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  const navigate = useNavigate();
  return (
    <Link
      to={`/product/diamond`}
      className={`font-bold border-2 border-primary py-4 rounded-l-full flex items-center w-[400px] justify-between ${
        !currentDiamond || !diamond ? "px-8" : "pr-8"
      }`}
    >
      {!currentDiamond || !diamond ? (
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
              <div className="font-semibold">
                {price == 0 ? (
                  <Skeleton.Input active={true} size={"small"} />
                ) : (
                  `${price.toLocaleString("en-US", {
                    style: "currency",
                    currency: "USD",
                    maximumFractionDigits: 0,
                  })}`
                )}
              </div>
              <div className="text-xs flex gap-2 text-slate-400">
                <Link
                  className="border-b cursor-pointer"
                  to={`/product/diamond/detail/${diamond?.diamondId}`}
                >
                  View
                </Link>
                <div
                  className="border-b cursor-pointer"
                  onClick={() => {
                    setCurrentDiamond(null);
                    setCurrentAccessory(null, null);
                    setQueryUrl("/api/Diamonds?");
                    // if (location.pathname.includes("complete")) {
                    // }
                    // location.href = "/product/diamond"
                    navigate("/product/diamond");
                  }}
                >
                  Remove
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
      <div className={`flex ${!diamond && "w-[24px]"}`}>
        {!diamond ? (
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
