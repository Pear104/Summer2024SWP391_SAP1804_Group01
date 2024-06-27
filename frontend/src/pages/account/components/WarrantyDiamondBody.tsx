import moment from "moment";
import React from "react";

export default function WarrantyDiamondBody({
  index,
  detail,
  createdAt,
}: {
  index: number;
  detail: any;
  createdAt: any;
}) {
  return (
    <div>
      <React.Fragment key={index}>
        {detail.diamond && (
          <tr className="border-b h-20">
            <td className="text-center">{index + 1}</td>
            <td className="text-center w-[400px]">
              {`${detail.diamond?.carat} Carat, ${detail.diamond?.shape} Diamond`}
            </td>
            <td className="text-center">
              {moment(createdAt).format("DD/MM/YYYY")}
            </td>
            <td className="text-center">
              {moment(createdAt).add(24, "months").format("DD/MM/YYYY")}
            </td>
            <td className="text-center">24 months</td>
          </tr>
        )}
      </React.Fragment>
    </div>
  );
}
