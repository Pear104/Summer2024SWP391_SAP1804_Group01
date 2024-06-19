import { ExternalLink } from "lucide-react";
import { Image } from "antd";

const DiamondItem = ({ detail, percent }: { detail: any; percent: any }) => {
  return (
    <div className="flex">
      <div className="w-1/5 flex ">
        <Image
          className="h-full object-cover aspect-square"
          // style={{ objectFit: "contain" }}
          src={detail.diamond.imageUrl}
          alt="diamond"
          // className="w-48 h-48 object-contain"
        />
      </div>
      <div className="text-lg pl-4 flex flex-col gap-2">
        <div className="text-gray-800 flex gap-2">
          Certificate Number:{" "}
          <a
            className="text-blue-500 flex"
            target="_blank"
            href={detail.diamond.certificateUrl}
          >
            {detail.diamond.certificateNumber}
            <ExternalLink size={12} />
          </a>
        </div>
        <div className="grid grid-cols-2 gap-y-2">
          <div className="text-gray-800">
            <span className="">Carat:</span> {detail.diamond.carat}
          </div>
          <div className="text-gray-800">
            Diamond Clarity: {detail.diamond.clarity}
          </div>
          <div className="text-gray-800">Cut: {detail.diamond.cut}</div>
          <div className="text-gray-800">
            Diamond Color: {detail.diamond.color}
          </div>
          <div className="text-gray-800 font-bold">
            <span className="">Price:</span>{" "}
            {(
              detail.diamondPrice.unitPrice *
              detail.diamond.carat *
              percent *
              100
            ).toLocaleString("en-US", {
              style: "currency",
              currency: "USD",
              maximumFractionDigits: 0,
            })}
          </div>
        </div>
      </div>
    </div>
  );
};

export default DiamondItem;
