import Logo from "../../../components/logo/Logo";
import moment from "moment";
import React from "react";

export default function WarrantyAccessoryItem({
  order,
  accessory,
}: {
  order: any;
  accessory: any;
}) {
  return (
    <div className="px-4 py-2 w-full pb-8" id="invoice">
      <div className="flex justify-between mt-4 border-b border-black pb-2">
        <div className="flex flex-col gap-2">
          <Logo />
          <div className="text-lg">
            <div>
              <span className="font-bold">Email:</span> datj.company@gmail.com
            </div>
            <div>
              <span className="font-bold">Address:</span> FPT University, Thu
              Duc, Ho Chi Minh, Vietnam
            </div>
            <div>
              <span className="font-bold">Hotline:</span> 0123.456.789
            </div>
            <div>
              <span className="font-bold">Website:</span> https://datj.id.vn/
            </div>
          </div>
        </div>
        <div className="font-semibold text-2xl tracking-wider">
          Accessory Warranty
        </div>
      </div>
      <div className="flex justify-between mt-2 text-lg">
        <div>
          <span className="font-semibold">Date:</span>{" "}
          {moment(order.createdAt).format("DD/MM/YYYY")}
        </div>
        <div>
          <span className="font-semibold">Warranty Id:</span> {order.orderId}
        </div>
      </div>
      <div className="flex flex-col text-lg">
        <div>
          <span className="font-bold">Client Name:</span>
          <span className="ml-2">{order.customerName}</span>
        </div>
      </div>
      <div>
        <table className="w-full text-lg mt-2">
          <thead className="border">
            <tr className="border-b bg-slate-300">
              <th className="text-center w-[400px]">Name</th>
              <th className="text-center">Date of purchase</th>
              <th className="text-center">Expired date</th>
              <th className="text-center">Warranty period</th>
            </tr>
          </thead>
          <tbody className="border">
            <React.Fragment>
              {accessory && (
                <tr className="border-b h-20">
                  <td className="text-center">{accessory.name}</td>
                  <td className="text-center">
                    {moment(order.createdAt).format("DD/MM/YYYY")}
                  </td>
                  <td className="text-center">
                    {moment(order.createdAt)
                      .add(12, "months")
                      .format("DD/MM/YYYY")}
                  </td>
                  <td className="text-center">12 months</td>
                </tr>
              )}
            </React.Fragment>
          </tbody>
        </table>
      </div>
    </div>
  );
}
