import React from "react";
import { useEffect, useState } from "react";
import { useCartStore } from "../../../store/cartStore";
import { GET } from "../../../utils/request";
import { Image, Select } from "antd";
type CartItemProps = {
  diamondId: number;
  accessoryId?: number;
  size?: number;
};

type DiamondDetail = {
  color: string;
  lab: string;
  imageUrl: string;
  carat: number;
  cut: string;
  clarity: string;
  polish: string;
  shape: string;
};

type AccessoryDetail = {
  accessoryId: number;
  karat: number;
  materialWeight: number;
  name: string;
  accessoryImages: { url: string }[];
};

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

const CartItem: React.FC<CartItemProps> = ({
  diamondId,
  accessoryId,
  size,
}) => {
  const [diamondDetail, setDiamondDetail] = useState<DiamondDetail | null>(
    null
  );
  const [accessoryDetail, setAccessoryDetail] =
    useState<AccessoryDetail | null>(null);

  useEffect(() => {
    // Gọi API để lấy chi tiết kim cương
    (async () => {
      const data = await GET(`/api/Diamonds/${diamondId}`);
      setDiamondDetail(data);
    })();
    // Gọi API để lấy chi tiết phụ kiện nếu có
    (async () => {
      const data = await GET(`/api/Accessories/${accessoryId}`);
      console.log(data);
      setAccessoryDetail(data);
    })();
  }, [diamondId, accessoryId]);

  function setSize(diamondId: number, e: number) {
    useCartStore.getState().updateCartItemSize(diamondId, e);
  }
  function deleteDiamond(diamondId: number) {
    useCartStore.getState().removeCartItem(diamondId);
  }

  return (
    // Cart item
    <div className="relative flex justify-between items-center bg-white shadow-md m-2">
      {/* Xóa nút */}
      <button
        className="absolute top-0 right-0 mt-2 mr-2 text-gray-500 hover:text-slate-300 text-bold text-3xl"
        onClick={() => deleteDiamond(diamondId)}
      >
        ×
      </button>
      {/* Diamond in the left */}
      <div className="flex-1">
        {diamondDetail ? (
          <div className="flex justify-between items-center text-sm m-3">
            <div className="w-full bg-cover flex-1 col-span-1 m-2">
              <Image src={`${diamondDetail.imageUrl}`} />
            </div>
            <div className="flex-1 col-span-1">
              <h3 className="text-lg font-bold">{`${diamondDetail?.carat} Carat ${diamondDetail?.shape} Shape Lab Diamond`}</h3>
              <div className="grid grid-cols-2 mt-2">
                <p>Color: {diamondDetail.color}</p>
                <p>Lab: {diamondDetail.lab}</p>
                <p>Carat: {diamondDetail.carat}</p>
                <p>Cut: {diamondDetail.cut}</p>
                <p>Clarity: {diamondDetail.clarity}</p>
                <p>Polish: {diamondDetail.polish}</p>
              </div>
            </div>
          </div>
        ) : (
          <p>Loading diamond details...!</p>
        )}
      </div>
      {/* Accessory in the right */}
      <div className="flex-1 border-l">
        {accessoryDetail?.accessoryId ? (
          <div className="flex justify-between items-center gap-4">
            <div
              className="col-span-4 place-self-center aspect-square bg-cover bg-top bg-no-repeat w-4/5 "
              style={{
                backgroundImage: `url(${accessoryDetail?.accessoryImages[0]?.url.replace(
                  "400x",
                  "800x"
                )})`,
              }}
            ></div>
            <div>
              <h3 className="text-lg font-bold">{accessoryDetail.name}</h3>
              <p>Karat: {accessoryDetail.karat}</p>
              <p>Material Weight: {accessoryDetail.materialWeight}g</p>
              <div>
                Size:
                <Select
                  className="border ml-4"
                  defaultValue={size}
                  style={{
                    width: 120,
                  }}
                  onChange={(e) => {
                    setSize(diamondId, e);
                  }}
                  options={ringOptions}
                />
              </div>
            </div>
          </div>
        ) : accessoryId !== undefined ? (
          <p> Loading accessory details... </p>
        ) : (
          <p>No accessory</p>
        )}
      </div>
    </div>
  );
};

export default CartItem;
