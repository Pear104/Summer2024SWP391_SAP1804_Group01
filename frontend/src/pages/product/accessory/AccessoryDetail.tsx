import React, { useEffect, useState } from "react";
import { GET } from "../../../utils/request";

export default function AccessoryDetail() {
  const [accessory, setAccessory] = useState<any>();
  useEffect(() => {
    (async () => {
      const data = await GET("/api/Accessories/6");
      setAccessory(data);
    })();
  }, []);
  return (
    <div>
      <div className="flex justify-center">
        <div className="w-[1400px] grid grid-cols-8 ">
          <div className="Slide-image col-span-1">
            {accessory &&
              accessory?.accessoryImages.map((image: any) => {
                return (
                  <div
                    className="aspect-square bg-no-repeat shadow-lg mb-4"
                    style={{
                      backgroundImage: `url(${image.url})`,
                      backgroundSize: "cover",
                      backgroundPosition: "center",
                    }}
                  ></div>
                );
              })}
          </div>
          <div
            className="col-span-4 place-self-center aspect-square bg-contain bg-top bg-no-repeat w-4/5 border "
            style={{
              backgroundImage: `url(${accessory?.accessoryImages[0]?.url})`,
              backgroundSize: "cover",
              backgroundPosition: "center",
            }}
          ></div>
          <div className="col-span-3">
            <div className="mulish-regular text-2xl">
              {`${accessory?.name}`}
            </div>
            <div className="text-3xl">$ {accessory?.materialWeight}</div>
            <div className="w-full grid grid-cols-2 gap-4 my-4 mulish-regular text-slate-950 ">
              <div className="flex flex-col gap-2">
                <div>PRICE</div>
                <div>DESCRIPTION</div>
                <div>STOCK</div>
              </div>
              <div className="flex flex-col gap-2">
                <div>{accessory?.price}</div>
                <div>{accessory?.description}</div>
                <div>{accessory?.stock}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
