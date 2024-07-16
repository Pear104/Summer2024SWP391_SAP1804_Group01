import { Skeleton } from "antd";
import React from "react";
import { Link } from "react-router-dom";

export default function DiamondRow({
  diamond,
  selectedDiamonds,
  setSelectedDiamonds,
  price,
}: {
  diamond: any;
  selectedDiamonds: number[];
  setSelectedDiamonds: React.Dispatch<React.SetStateAction<number[]>>;
  price: any;
}) {
  console.log(price);
  if (!diamond) {
    return (
      <>
        <tr>
          <td>
            <div className="text-center items-center">
              <p>There is no diamond</p>
            </div>
          </td>
        </tr>
      </>
    );
  }
  return (
    <>
      <tr key={diamond.diamondId}>
        {/* map diamond */}
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            <Link to={`/admin/diamonds/detail/${diamond.diamondId}`}>
              <img
                className="w-14 aspect-square object-cover"
                src={diamond.imageUrl}
                alt=""
              />
            </Link>
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            <a
              target="blank"
              href={diamond.certificateUrl}
              className="hover:text-blue-500"
            >
              {diamond.certificateNumber}
            </a>
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {isNaN(parseFloat(price)) ? (
              <Skeleton.Button active />
            ) : (
              price.toLocaleString("en-US", {
                style: "currency",
                currency: "USD",
                maximumFractionDigits: 0,
              })
            )}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {diamond.shape}
        </td>
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {diamond.carat}
        </td>
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {diamond.color}
        </td>
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {diamond.clarity}
        </td>
        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
          {diamond.cut}
        </td>
        <td className="px-6 py-4 whitespace-nowrap text-left text-sm font-medium">
          <div className="text-indigo-600 hover:text-indigo-900 font-bold">
            {diamond.availability ? "Available" : "Not Available"}
          </div>
        </td>
      </tr>
    </>
  );
}
