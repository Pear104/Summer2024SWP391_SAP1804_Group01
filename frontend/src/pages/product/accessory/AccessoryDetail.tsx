import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";
import { Image, Skeleton } from "antd";
import { useNavigate, useParams } from "react-router-dom";
import { useCartStore } from "../../../store/cartStore";
import { useQueries } from "@tanstack/react-query";
import { useSearchStore } from "../../../store/searchStore";
import ImageList from "./components/ImageList";
import { getAccessoryPrice } from "../../../utils/getPrice";

export default function AccessoryDetail() {
  const { accessoryId } = useParams();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  useEffect(() => {
    setQueryUrl(`/api/Accessories/${accessoryId}`);
  }, []);
  console.log(queryUrl);
  const [accessory, materialPrices] = useQueries({
    queries: [
      {
        queryKey: ["accessory", queryUrl],
        queryFn: () => GET(queryUrl),
      },
      {
        queryKey: ["materialPrices"],
        queryFn: () => GET("/api/MaterialPrices/"),
      },
    ],
  });
  const [mainImage, setMainImage] = useState<string | undefined>(undefined);
  useEffect(() => {
    if (accessory.data) {
      setMainImage(
        accessory.data.accessoryImages[0].url.replace("400x", "800x")
      );
    }
  }, [accessory.data]);
  const navigate = useNavigate();
  const setCurrentAccessory = useCartStore(
    (state) => state.setCurrentAccessory
  );
  const currentDiamond = useCartStore((state) => state.currentDiamond);
  return (
    <div>
      {(accessory.isLoading || materialPrices.isLoading) && (
        <Skeleton
          active
          paragraph={{
            rows: 20,
          }}
        />
      )}
      <div className="flex justify-center mb-20">
        {accessory?.data && materialPrices?.data && (
          <div className="w-[1200px] grid grid-cols-8 gap-10">
            <ImageList
              setMainImage={setMainImage}
              images={accessory.data.accessoryImages}
            />
            <div className="col-span-4 aspect-square bg-cover bg-top bg-no-repeat w-full">
              <Image alt="alt" className="w-full" src={`${mainImage}`} />
            </div>
            <div className="col-span-3">
              <div className="mulish-regular text-2xl">
                {`${accessory?.data.name}`}
              </div>
              <div className="text-3xl">
                $ {getAccessoryPrice(accessory?.data, materialPrices?.data)}
              </div>
              <div className="w-full grid grid-cols-2 gap-4 my-4 mulish-regular text-slate-950 ">
                <div className="flex flex-col gap-2">
                  <div>MATERIAL WEIGHT</div>
                  <div>TYPE</div>
                  <div>KARAT</div>
                  <div>SUITABLE WITH</div>
                </div>
                <div className="flex flex-col gap-2">
                  <div>{accessory?.data.materialWeight.toFixed(2)} g</div>
                  <div>{accessory?.data.accessoryType.name}</div>
                  <div>{accessory?.data.karat}K</div>
                  <div>{accessory?.data.shape.name} Shape Diamond</div>
                </div>
              </div>
              <div className="flex flex-col gap-4">
                <div
                  className={`text-xl w-full flex justify-center px-4 py-3 bg-primary hover:scale-95 transition-all ${
                    currentDiamond
                      ? "text-white"
                      : "bg-gray-300 px-4 py-2 rounded-md cursor-not-allowed opacity-50 text-slate-400"
                  }`}
                  onClick={() => {
                    if (currentDiamond) {
                      setCurrentAccessory(accessory?.data.accessoryId);
                      navigate("/product/complete");
                    }
                  }}
                >
                  {currentDiamond
                    ? "CHOOSE THIS ACCESSORY"
                    : "YOU NEED TO CHOOSE DIAMOND FIRST"}
                </div>
                {!currentDiamond && (
                  <div
                    className={`text-xl w-full flex justify-center px-4 py-3 text-white bg-primary hover:scale-95 transition-all `}
                    onClick={() => {
                      navigate("/product/diamond");
                    }}
                  >
                    CHOOSE DIAMOND
                  </div>
                )}
                <div className="text-xl w-full flex justify-center border border-black px-4 py-3 bg-white hover:scale-95 transition-all">
                  ADD TO CART
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
