import { GET } from "../../../utils/request";
import { ExternalLink } from "lucide-react";
import { useNavigate, useParams } from "react-router-dom";
import { Image, Skeleton } from "antd";
import { useCartStore } from "../../../store/cartStore";
import scrollTo from "../../../utils/scroll";
import { useQueries } from "@tanstack/react-query";
export default function DiamondDetail() {
  // const [diamond, setDiamond] = useState<any>();
  const { diamondId } = useParams();
  scrollTo("choose-item");
  const [diamond, diamondPrice] = useQueries({
    queries: [
      {
        queryKey: ["diamond"],
        queryFn: () => GET(`/api/Diamonds/${diamondId}`),
        staleTime: Infinity,
      },
      {
        queryKey: ["diamondPrice"],
        queryFn: () => GET("/api/DiamondPrices/"),
        staleTime: Infinity,
      },
    ],
  });

  const navigate = useNavigate();
  const setCart = useCartStore((state) => state.setCart);
  const setCurrentDiamond = useCartStore((state) => state.setCurrentDiamond);
  console.log(diamond?.data);
  return (
    <div className="flex justify-center mb-20">
      {(diamond?.isLoading || diamondPrice?.isLoading) && (
        <Skeleton
          className="px-20 pt-6"
          active
          paragraph={{
            rows: 20,
          }}
        />
      )}
      {diamond?.data && diamondPrice?.data && (
        <div className="w-[1200px] grid grid-cols-6 gap-10">
          <div className="col-span-4 place-self-center aspect-square bg-cover bg-top bg-no-repeat w-4/5">
            <Image
              style={{ height: "100%" }}
              src={`${diamond.data.imageUrl}`}
            />
          </div>
          <div className="col-span-2">
            <div className="mulish-regular text-2xl">
              {`${diamond?.data.carat} Carat ${diamond?.data.shape} Shape Lab Diamond`}
            </div>
            <div className="text-sm">
              Certificate Number#:
              <span className="ml-2">{diamond?.data.certificateNumber}</span>
            </div>
            <div className="text-3xl my-2">
              {diamondPrice?.data &&
                (
                  diamondPrice?.data.find(
                    (price: any) =>
                      diamond.data.color == price.color &&
                      diamond.data.clarity == price.clarity &&
                      price.minCaratEff <= diamond.data.carat &&
                      diamond.data.carat <= price.maxCaratEff
                  ).unitPrice *
                  diamond.data.carat *
                  10
                ).toLocaleString("en-US", {
                  style: "currency",
                  currency: "USD",
                  maximumFractionDigits: 0,
                })}
            </div>
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
                <div>{diamond.data.lab}</div>
                <a
                  className="text-blue-500 flex"
                  target="_blank"
                  href={diamond.data.certificateUrl}
                >
                  {diamond.data.certificateNumber}
                  <ExternalLink size={12} />
                </a>
                <div>{diamond.data.shape}</div>
                <div>{diamond.data.carat}</div>
                <div>{diamond.data.cut}</div>
                <div>{diamond.data.color}</div>
                <div>{diamond.data.clarity}</div>
                <div>{diamond.data.polish}</div>
                <div>{diamond.data.symmetry}</div>
                <div>{diamond.data.fluorescence}</div>
              </div>
            </div>
            <div className="flex flex-col gap-4 mt-8">
              <div
                className="tracking-wider text-xl w-full flex justify-center px-4 py-3 bg-primary text-white hover:scale-95 transition-all"
                onClick={() => {
                  navigate("/product/accessory");
                  setCurrentDiamond(diamond.data.diamondId);
                }}
              >
                ADD TO ACCESSORY
              </div>
              <div
                className="tracking-widest text-xl w-full flex justify-center border border-black px-4 py-3 bg-white hover:scale-95 transition-all"
                onClick={() => {
                  setCart(diamond.data.diamondId);
                  navigate("/cart");
                }}
              >
                BUY LOOSE
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
