import React from "react";

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
  if (!diamond) {
    return <></>;
  }
  return (
    <>
      <tr key={diamond.diamondId}>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            <label className="flex items-center">
              <input
                type="checkbox"
                value="0"
                className="form-checkbox w-5 h-5"
                checked={selectedDiamonds.includes(diamond.diamondId)}
                onChange={(e) => {
                  if (e.target.checked) {
                    setSelectedDiamonds([
                      ...selectedDiamonds,
                      diamond.diamondId,
                    ]);
                  } else {
                    setSelectedDiamonds(
                      selectedDiamonds.filter((id) => id !== diamond.diamondId)
                    );
                  }
                }}
              />

              <span className="checkbox-unchecked"></span>
              <span className="pl-2"></span>
              <input type="hidden" value="0" />
            </label>
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            <a href="#">
              <img
                className="h-14  w-14 square-full"
                src={diamond.imageUrl}
                alt=""
              />
            </a>
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
          <div className="text-sm text-gray-500">{price}</div>
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
          <div className="text-indigo-600 hover:text-indigo-900">
            {diamond.availability ? "Available" : "Not Available"}
          </div>
        </td>
      </tr>
    </>
  );
}
