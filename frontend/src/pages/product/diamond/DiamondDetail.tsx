import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";

export default function DiamondDetail() {
  const [diamond, setDiamond] = useState<any>();
  useEffect(() => {
    (async () => {
      const data = await GET("/api/Diamond/5");
      setDiamond(data);
    })();
  }, []);
  return (
    <div className="flex justify-center">
      <div className="w-[1200px] grid grid-cols-6 gap-10">
        <div
          className="col-span-4 place-self-center aspect-square bg-contain bg-top bg-no-repeat w-4/5 border"
          style={{
            backgroundImage: `url(${diamond?.imageUrl})`,
            // backgroundImage: `url(${diamond.imageUrl})`,
          }}
        ></div>
        <div className="col-span-2">
          <div className="mulish-regular text-2xl">
            {`${diamond?.carat} Carat ${diamond?.shape.name} Shape Lab Diamond`}
          </div>
          <div className="text-sm">
            Certificate Number#:
            <span className="ml-2">{diamond?.certificateNumber}</span>
          </div>
          <div className="text-3xl">$ 1.200</div>
          <div className="gap-4">
            <div className="w-[200px] border-black font-semibold flex justify-center px-4 py-2 border-2 rounded-md ">
              Choose
            </div>
            <div className="border-black font-semibold inline-block px-4 py-2 border-2 rounded-md ">
              Buy Loose
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
