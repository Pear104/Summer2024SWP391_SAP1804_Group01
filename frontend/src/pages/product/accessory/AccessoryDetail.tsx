import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";
import { useNavigate, useParams } from "react-router-dom";
import { useCartStore } from "../../../store/cartStore";
import scrollToChoose from "../../../utils/scroll";

export default function AccessoryDetail() {
  const [accessory, setAccessory] = useState<any>();
  const { accessoryId } = useParams();
  useEffect(() => {
    (async () => {
      const data = await GET(`/api/Accessories/${accessoryId}`);
      console.log(data);
      setAccessory(data);
    })();
  }, [accessoryId]);
  const navigate = useNavigate();
  const setCurrentAccessory = useCartStore(
    (state) => state.setCurrentAccessory
  );
  scrollToChoose();
  const currentDiamond = useCartStore((state) => state.currentDiamond);
  return (
    <div>
      <div className="flex justify-center">
        <div className="w-[1400px] grid grid-cols-8 ">
          <div className="Slide-image col-span-1">
            {accessory &&
              accessory?.accessoryImages.map((image: any) => {
                return (
                  <div
                    key={image.url}
                    className="aspect-square bg-cover bg-center bg-no-repeat shadow-lg mb-4"
                    style={{
                      backgroundImage: `url(${image.url})`,
                    }}
                  ></div>
                );
              })}
          </div>
          <div
            className="col-span-4 place-self-center aspect-square bg-cover bg-top bg-no-repeat w-4/5 border "
            style={{
              backgroundImage: `url(${accessory?.accessoryImages[0]?.url})`,
            }}
          ></div>
          <div className="col-span-3">
            <div className="mulish-regular text-2xl">
              {`${accessory?.name}`}
            </div>
            <div className="text-3xl">$ {accessory?.materialWeight}</div>
            <div className="w-full grid grid-cols-2 gap-4 my-4 mulish-regular text-slate-950 ">
              <div className="flex flex-col gap-2">
                <div>TYPE</div>
              </div>
              <div className="flex flex-col gap-2">
                <div>{accessory?.accessoryType.name}</div>
              </div>
            </div>
            <div className="flex flex-col gap-4">
              <div
                className={`text-xl w-full flex justify-center px-4 py-3 bg-primary hover:scale-95 transition-all ${
                  currentDiamond
                    ? "text-white"
                    : "bg-gray-300 px-4 py-2 rounded-md cursor-not-allowed opacity-50 text-black"
                }`}
                onClick={() => {
                  if (currentDiamond) {
                    setCurrentAccessory(accessory?.accessoryId);
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
      </div>
    </div>
  );
}
