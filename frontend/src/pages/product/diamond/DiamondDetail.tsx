import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";
import { ExternalLink } from "lucide-react";
import { useParams } from "react-router-dom";
import { Image } from "antd";
export default function DiamondDetail() {
  const [diamond, setDiamond] = useState<any>();
  const { diamondId } = useParams();
  console.log(diamondId);
  useEffect(() => {
    (async () => {
      const data = await GET(`/api/Diamonds/${diamondId}`);
      setDiamond(data);
    })();
  }, []);
  return (
    <div className="flex justify-center">
      <div className="w-[1200px] grid grid-cols-6 gap-10">
        {/* <div
          className="col-span-4 place-self-center aspect-square bg-cover bg-top bg-no-repeat w-4/5 border "
          style={{
            backgroundImage: `url(${diamond?.imageUrl})`,
          }}
        ></div> */}
        <div className="col-span-4 place-self-center aspect-square bg-cover bg-top bg-no-repeat w-4/5">
          <Image style={{ height: "100%" }} src={`${diamond?.imageUrl}`} />
        </div>
        <div className="col-span-2">
          <div className="mulish-regular text-2xl">
            {`${diamond?.carat} Carat ${diamond?.shape} Shape Lab Diamond`}
          </div>
          <div className="text-sm">
            Certificate Number#:
            <span className="ml-2">{diamond?.certificateNumber}</span>
          </div>
          <div className="text-3xl my-2">$ 1.200</div>
          <div className="w-full grid grid-cols-2 gap-4 my-4 mulish-regular text-slate-950 ">
            <div className="flex flex-col gap-2">
              <div>LAB</div>
              <div>CERTIFICATE NUMBER</div>
              <div>SHAPE</div>
              <div>CARAT</div>
              <div>CUT</div>
              <div>COLOR</div>
              <div>CLARITY</div>
              <div>POLISH</div>
              <div>SYMMETRY</div>
              <div>FLUORESCENCE</div>
            </div>
            <div className="flex flex-col gap-2">
              <div>{diamond?.lab}</div>
              <a
                className="text-blue-500 flex"
                target="blank"
                href={diamond?.certificateUrl}
              >
                {diamond?.certificateNumber}
                <ExternalLink size={12} />
              </a>
              <div>{diamond?.shape}</div>
              <div>{diamond?.carat}</div>
              <div>{diamond?.cut}</div>
              <div>{diamond?.color}</div>
              <div>{diamond?.clarity}</div>
              <div>{diamond?.polish}</div>
              <div>{diamond?.symmetry}</div>
              <div>{diamond?.fluorescence}</div>
            </div>
          </div>
          <div className="flex flex-col gap-4">
            <div className="text-xl w-full flex justify-center px-4 py-3 bg-cyan-900 text-white hover:scale-95 transition-all">
              ADD TO RING
            </div>
            <div className="text-xl w-full flex justify-center border border-black px-4 py-3 bg-white hover:scale-95 transition-all">
              BUY LOOSE
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
