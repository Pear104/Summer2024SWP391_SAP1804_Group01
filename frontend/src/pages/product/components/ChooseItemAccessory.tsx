import { Check } from "lucide-react";

import { useCartStore } from "../../../store/cartStore";
import { Link, useNavigate } from "react-router-dom";
import RingIcon from "./RingIcon";
import { Skeleton } from "antd";

export default function ChooseItemAccessory({
  accessory,
  price,
}: {
  accessory: any;
  price: any;
}) {
  // const location = useLocation();
  const currentAccessory = useCartStore((state) => state.currentAccessory);
  const currentShape = useCartStore((state) => state.currentShape);
  const setCurrentAccessory = useCartStore(
    (state) => state.setCurrentAccessory
  );
  const navigate = useNavigate();
  return (
    <Link
      // onClick={() => {
      //   useSearchStore.getState().setQueryUrl("/api/Accessories?");
      //   navigate("/product/accessory");
      //   }}
      to={`/product/accessory?${
        currentShape != null ? `Shape=${currentShape}` : ""
      }`}
      className={`font-bold border-y-2 border-primary py-4 flex items-center w-[400px] justify-between ${
        !currentAccessory || !accessory ? "px-8" : "px-4"
      }`}
    >
      {!currentAccessory || !accessory ? (
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
              <div className="font-semibold">
                {price == 0 ? (
                  <Skeleton.Input active={true} size={"small"} />
                ) : (
                  price
                )}
              </div>
              <div className="text-xs flex gap-2 text-slate-400">
                <Link
                  className="border-b cursor-pointer"
                  to={`/product/accessory/detail/${accessory?.accessoryId}`}
                  onClick={() => {
                    console.log(
                      "/product/accessory/detail/" + accessory?.accessoryId
                    );
                    // navigate(
                    //   "/product/accessory/detail/" + accessory?.accessoryId
                    // );
                  }}
                >
                  View
                </Link>
                <div
                  className="border-b cursor-pointer"
                  onClick={() => {
                    navigate("/product/accessory");
                    setCurrentAccessory(null, null);
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
