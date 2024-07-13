import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../utils/request";

const DiamondInfo = ({ diamond }: { diamond: any }) => {
  return (
    <div className="flex gap-4">
      <img
        className="w-[140px] aspect-square object-cover"
        src={diamond?.imageUrl}
      />
      <div className="max-h-[100px] text-lg grid grid-cols-2 gap-x-2">
        <div className="col-span-2">
          <span className="font-bold">Certificate Number: </span>
          {diamond?.certificateNumber}
        </div>
        <div>
          <span className="font-bold">Carat: </span>
          {diamond?.carat}
        </div>
        <div>
          <span className="font-bold">Color: </span>
          {diamond?.color}
        </div>
        <div>
          <span className="font-bold">Clarity: </span>
          {diamond?.clarity}
        </div>
        <div>
          <span className="font-bold">Cut: </span>
          {diamond?.cut}
        </div>
      </div>
    </div>
  );
};

const AccessoryInfo = ({ accessory }: { accessory: any }) => {
  return (
    <div className="flex gap-4">
      <img
        className="w-[140px] aspect-square object-cover border"
        src={accessory?.accessoryImages[0].url}
      />
      <div className="max-h-[60px] text-lg grid grid-cols-2 gap-x-3">
        <div className="col-span-2">
          <span className="font-bold">Name: </span>
          {accessory?.name}
        </div>
        <div>
          <span className="font-bold">Material Weight: </span>
          {accessory?.materialWeight.toFixed(2)} g
        </div>
        <div>
          <span className="font-bold">Karat: </span>
          {accessory?.karat}K
        </div>
      </div>
    </div>
  );
};
export default function WarrantyInfo({ id }: { id: any }) {
  const [warrantyCard] = useQueries({
    queries: [
      {
        queryKey: ["warrantyCard", id],
        queryFn: () => GET(`/api/WarrantyCards?WarrantyCardId=${id}`),
        staleTime: 0,
      },
    ],
  });
  console.log(warrantyCard?.data?.warrantyCards);
  const data = warrantyCard?.data?.warrantyCards;
  return (
    id != 0 && (
      <div className="col-span-2 mb-4">
        {warrantyCard?.data?.warrantyCards[0]?.diamondId != null ? (
          <DiamondInfo
            diamond={warrantyCard?.data?.warrantyCards[0]?.diamond}
          />
        ) : (
          <AccessoryInfo
            accessory={warrantyCard?.data?.warrantyCards[0]?.accessory}
          />
        )}
      </div>
    )
  );
}
