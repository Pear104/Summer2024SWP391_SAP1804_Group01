import moment from "moment";
import React from "react";

export default function WarrantyAccessoryBody({
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
        {detail.accessory && (
          <tr className="border-b h-20">
            <td className="text-center">{index + 1}</td>
            <td className="text-center">{detail.accessory.name}</td>
            <td className="text-center">
              {moment(createdAt).format("DD/MM/YYYY")}
            </td>
            <td className="text-center">
              {moment(createdAt).add(12, "months").format("DD/MM/YYYY")}
            </td>
            <td className="text-center">12 months</td>
          </tr>
        )}
      </React.Fragment>
    </div>
  );
}
