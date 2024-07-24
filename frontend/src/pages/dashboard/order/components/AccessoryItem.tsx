import {  Image } from "antd";
import { Link } from "react-router-dom";

const AccessoryItem = ({
  detail,
  percent,
}: {
  detail: any;
  percent: any;
}) => {
  return (
    <div className="flex text-lg">
      <Link
        className="w-1/5 flex aspect-square"
        to={`/product/accessory/detail/${detail?.accessory?.accessoryId}`}
      >
        {detail?.accessory != null
          ? detail.accessory?.accessoryImages[0]?.url && (
              <Image
                // style={{ objectFit: "contain" }}
                // object-cover full hinh bi cat, object-contain full hinh khong bi cat
                className="h-full object-cover aspect-square"
                src={detail?.accessory?.accessoryImages[0].url}
                alt="accessory"
              />
            )
          : ""}
      </Link>
      <div className="pl-4 flex flex-col gap-2 text-lg">
        <div className="font-bold">
          {detail.accessory != null ? detail.accessory?.name : ""}
        </div>
        {detail.accessory != null && (
          <div>Material weight: {detail.accessory?.materialWeight} g</div>
        )}
        {detail.accessory != null && (
          <div>Gold Karat: {detail.accessory?.karat}K</div>
        )}
        {detail?.accessory && (
          <div className="flex items-center gap-8">
            <div className="text-gray-800 font-bold">
              Price:{" "}
              {(
                ((detail?.accessory?.materialWeight + detail?.size - 3) *
                  detail?.materialPrice?.unitPrice +
                  detail?.accessory?.accessoryType?.processingPrice) *
                percent
              ).toLocaleString("en-US", {
                style: "currency",
                currency: "USD",
                maximumFractionDigits: 0,
              })}
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default AccessoryItem;
