import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../utils/request";
import { Image, Skeleton } from "antd";
import { getDiamondPrice, getAccessoryPrice } from "../../../utils/getPrice";

const CheckoutCartItem = ({
  cartItem,
  diamondPrice,
  materialPrice,
  priceRate,
}: {
  cartItem: any;
  diamondPrice: any;
  materialPrice: any;
  priceRate: any;
}) => {
  const [diamond, accessory] = useQueries({
    queries: [
      {
        queryKey: ["diamond", cartItem.diamondId],
        queryFn: () => GET(`/api/Diamonds/${cartItem.diamondId}`),
      },
      {
        queryKey: ["accessory", cartItem.accessoryId],
        queryFn: () => GET(`/api/Accessories/${cartItem.accessoryId}`),
      },
    ],
  });
  return (
    <div className="border border-black bg-slate-300 rounded-lg py-2 px-3 flex flex-col gap-2 justify-between hover:bg-slate-400 transition-all duration-300">
      {/* Diamond part */}
      <div className="flex w-full gap-4 items-center bg-white/70 hover:bg-white/95 transition-all">
        <div className="h-[80px] flex">
          <Image
            className="h-full aspect-square object-cover"
            src={diamond?.data?.imageUrl}
          />
        </div>
        {diamond?.data ? (
          <div className="flex-grow">
            <div
              className="font-semibold"
              title={`${diamond?.data?.carat} Carat ${diamond?.data?.shape} Shape Lab Diamond`}
            >
              {`${diamond?.data?.carat} Carat ${diamond?.data?.shape} Shape Lab Diamond`}
            </div>
            <div className="text-sm text-slate-400 grid grid-cols-2 w-[300px]">
              <div>Clarity: {diamond?.data?.clarity}</div>
              <div>Cut: {diamond?.data?.cut}</div>
              <div>Shape: {diamond?.data?.shape}</div>
              <div>Carat: {diamond?.data?.carat}</div>
            </div>
          </div>
        ) : (
          <>
            <div className="">
              <Skeleton.Input className="mr-2" active={true} size="small" />
              <Skeleton.Input active={true} size="small" />
              <Skeleton.Input active={true} size="small" />
            </div>
          </>
        )}

        <div className="font-semibold mr-4 text-sm">
          {diamondPrice && priceRate ? (
            getDiamondPrice(
              diamond?.data,
              diamondPrice,
              priceRate
            ).toLocaleString("en-US", {
              style: "currency",
              currency: "USD",
              maximumFractionDigits: 0,
            })
          ) : (
            <Skeleton.Button active={true} size="small" />
          )}
        </div>
      </div>
      {/* Accessory part */}
      {accessory?.data?.accessoryId && (
        <div className="flex w-full gap-4 items-center bg-white/70 hover:bg-white/95 transition-all">
          <div className="h-[80px] flex">
            <Image
              className="h-full aspect-square object-cover"
              src={accessory?.data?.accessoryImages[0].url.replace(
                "400x",
                "800x"
              )}
            />
          </div>
          <div className="flex-grow">
            <div
              className="font-semibold truncate w-[380px]"
              title={accessory?.data?.name}
            >
              {accessory?.data?.name}
            </div>
            <div className="text-sm text-slate-400 grid grid-cols-3 gap-x-8">
              <div>{accessory?.data?.karat}KT Yellow Gold</div>
              <div className="col-span-2 overflow-x-visible">
                <div>Weight: {accessory?.data?.materialWeight.toFixed(2)}g</div>
              </div>
              <div>Size: {cartItem.size}</div>
            </div>
          </div>
          <div className="font-semibold mr-4 text-sm">
            {materialPrice && priceRate ? (
              getAccessoryPrice(
                accessory?.data,
                materialPrice,
                cartItem.size,
                priceRate
              ).toLocaleString("en-US", {
                style: "currency",
                currency: "USD",
                maximumFractionDigits: 0,
              })
            ) : (
              <Skeleton.Button active={true} size="small" />
            )}
          </div>
        </div>
      )}
    </div>
  );
};

export default CheckoutCartItem;
