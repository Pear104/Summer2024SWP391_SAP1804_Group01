import { Check } from "lucide-react";

import { useCartStore } from "../../../store/cartStore";
import { Link, useNavigate } from "react-router-dom";
import RingIcon from "./RingIcon";

export default function ChooseItemAccessory({
  accessory,
  price,
}: {
  accessory: any;
  price: any;
}) {
  const currentAccessory = useCartStore((state) => state.currentAccessory);
  const setCurrentAccessory = useCartStore(
    (state) => state.setCurrentAccessory
  );
  const navigate = useNavigate();
  return (
    <Link
      // className="font-bold border-primary border-y-2 py-4 px-8 flex items-center w-[400px] justify-between"
      to="/product/accessory"
      className={`font-bold border-y-2 border-primary py-4 flex items-center w-[400px] justify-between ${
        currentAccessory ? "px-4" : "px-8"
      }`}
    >
      {!currentAccessory ? (
        <>
          <div className="font-bold text-2xl">2</div>
          <div className="flex-grow px-4">Choose an Accessory</div>
        </>
      ) : (
        <div className="flex flex-grow pr-4 justify-start gap-2 items-stretch">
          <div className="flex items-center">
            <Check className="" color="#1fadea" strokeWidth={1.25} />
          </div>
          <div className="text-sm flex flex-col">
            <div className="text-sm truncate w-[260px]">{accessory?.name}</div>
            <div className="flex items-end gap-4">
              <div className="font-semibold">{price}</div>
              <div className="text-xs flex gap-2 text-slate-400">
                <Link
                  className="border-b cursor-pointer"
                  to={`/product/accessory/detail/${currentAccessory}`}
                >
                  View
                </Link>
                <div
                  className="border-b cursor-pointer"
                  onClick={() => {
                    navigate("/product/accessory");
                    setCurrentAccessory(null);
                  }}
                >
                  Remove
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
      <div className={`flex ${!currentAccessory && "w-[24px]"}`}>
        {!currentAccessory ? (
          <RingIcon />
        ) : (
          <div
            className="col-span-4 place-self-center aspect-square bg-cover bg-top bg-no-repeat w-[50px] border "
            style={{
              backgroundImage: `url(${accessory?.accessoryImages[0].url})`,
            }}
          ></div>
        )}
      </div>
    </Link>
  );
}
