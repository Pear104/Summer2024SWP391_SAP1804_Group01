import { useEffect, useState } from "react";
import { Divider, Image, Select } from "antd";
import { useCartStore } from "../../../store/cartStore";
import { GET } from "../../../utils/request";
import { useQueries } from "@tanstack/react-query";
import { Link, useNavigate } from "react-router-dom";
import DiamondIcon from "../components/DiamondIcon";
import RingIcon from "../components/RingIcon";
import ImageList from "./components/ImageList";

const ringOptions = [
  {
    value: "3",
    label: "3",
  },
  {
    value: "3.5",
    label: "3.5",
  },
  {
    value: "4",
    label: "4",
  },
  {
    value: "4.5",
    label: "4.5",
  },
  {
    value: "5",
    label: "5",
  },
  {
    value: "5.5",
    label: "5.5",
  },
];

export default function CompleteProduct() {
  const currentDiamond = useCartStore((state) => state.currentDiamond);
  const currentAccessory = useCartStore((state) => state.currentAccessory);
  const navigate = useNavigate();
  if (!currentDiamond || !currentAccessory) {
    navigate("/product/diamond");
  }
  const [diamond, accessory] = useQueries({
    queries: [
      {
        queryKey: ["currentDiamond", currentDiamond],
        queryFn: () => GET(`/api/Diamonds/${currentDiamond}`),
      },
      {
        queryKey: ["currentAccessory", currentAccessory],
        queryFn: () => GET(`/api/Accessories/${currentAccessory}`),
      },
    ],
  });

  const setCart = useCartStore((state) => state.setCart);
  const setCurrentAccessory = useCartStore(
    (state) => state.setCurrentAccessory
  );
  const setCurrentDiamond = useCartStore((state) => state.setCurrentDiamond);
  const [mainImage, setMainImage] = useState<string | undefined>(undefined);
  const [size, setSize] = useState(3);
  useEffect(() => {
    if (diamond.data) {
      setMainImage(diamond.data.imageUrl);
    }
  }, [diamond.data]);
  return (
    <div className="flex justify-center mb-20">
      <div className="w-[1200px] grid grid-cols-8 gap-10 items-start">
        <ImageList
          setMainImage={setMainImage}
          diamondImage={diamond?.data && diamond?.data.imageUrl}
          accessoryImage={accessory?.data && accessory?.data.accessoryImages}
        />
        <div className="col-span-4 aspect-square bg-cover bg-top bg-no-repeat w-full">
          <Image alt="alt" className="w-full" src={`${mainImage}`} />
        </div>
        <div className="col-span-3">
          <div className="mulish-regular text-2xl">
            {accessory?.data && accessory?.data.name} with
            {` ${diamond?.data && diamond?.data.carat} Carat ${
              diamond?.data && diamond?.data.shape
            } Shape Lab Diamond`}
          </div>
          <div className="text-sm mt-4">
            <span className="">
              The total carat weight of your ring is{" "}
              {diamond?.data && diamond?.data.carat} Ct.
            </span>
          </div>
          <div className="text-3xl my-2">Total price: $ 1.200</div>
          <Divider />
          <div className="w-full my-4 mulish-regular text-slate-950 ">
            <div className="text-lg mb-4">Complete Ring:</div>
            <div className="flex flex-col gap-4 text-sm">
              <div className="flex gap-4 items-center">
                <div className="w-[20px]">
                  <DiamondIcon />
                </div>
                <Link
                  to={`/product/diamond/detail/${currentDiamond}`}
                  className="hover:bg-slate-200 p-2 rounded-md"
                >
                  {diamond?.data &&
                    `${diamond.data.carat} Ct - ${diamond.data.cut} Cut - ${diamond.data.shape} Shape Diamond - ${diamond.data.color} Color - ${diamond.data.clarity} Clarity - Stock #: ${diamond.data.diamondId}`}
                  <div>$1,122</div>
                </Link>
                <Link
                  to="/product/diamond"
                  className="self-start text-xs border-b border-b-transparent hover:border-b-primary"
                >
                  Change
                </Link>
              </div>
              <div className="flex gap-4 items-center">
                <div className="w-[20px]">
                  <RingIcon />
                </div>
                <Link
                  to={`/product/accessory/detail/${currentAccessory}`}
                  className="hover:bg-slate-200 p-2 rounded-md"
                >
                  {accessory?.data &&
                    `${accessory.data.name} in ${accessory.data.karat}K - ${diamond.data.shape} Shape Diamond - ${diamond.data.color} Color - ${diamond.data.clarity} Clarity - Stock #: ${diamond.data.diamondId}`}
                  <div>$1,122</div>
                </Link>
                <Link
                  to="/product/accessory"
                  className="self-start text-xs border-b border-b-transparent hover:border-b-primary"
                >
                  Change
                </Link>
              </div>
              <div className="my-2 flex items-center gap-2">
                <div>Choose ring size:</div>
                <Select
                  className="border"
                  defaultValue={size}
                  style={{
                    width: 120,
                  }}
                  onChange={(e) => {
                    setSize(e);
                  }}
                  options={ringOptions}
                />
                <Link
                  to="/product/diamond"
                  className="ml-4 text-xs border-b border-b-transparent hover:border-b-primary"
                >
                  Ring size guide
                </Link>
              </div>
            </div>
          </div>
          <div className="flex flex-col gap-4 mt-8">
            <div
              className="text-xl w-full flex justify-center px-4 py-3 bg-primary text-white hover:scale-95 transition-all"
              onClick={() => {
                setCart(
                  diamond?.data && diamond?.data.diamondId,
                  accessory?.data && accessory?.data.accessoryId,
                  size
                );
                setCurrentDiamond(null);
                setCurrentAccessory(null);
                console.log("add to cart");
                console.log(currentDiamond);
                console.log(currentAccessory);
                navigate("/cart");
              }}
            >
              ADD TO CART
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
