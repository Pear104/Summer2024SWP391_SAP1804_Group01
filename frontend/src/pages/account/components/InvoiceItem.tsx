import Logo from "../../../components/logo/Logo";
import moment from "moment";
import React from "react";
import {
  getOrderAccessoryPrice,
  getOrderDiamondPrice,
} from "../../../utils/getPrice";

export default function InvoiceItem({ order }: { order: any }) {
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
          Diamond Invoice
        </div>
      </div>
      <div className="flex justify-between mt-2 text-lg">
        <div>
          <span className="font-semibold">Date:</span>{" "}
          {moment(order.createdAt).format("DD/MM/YYYY")}
        </div>
        <div>
          <span className="font-semibold">Order Id:</span> {order.orderId}
        </div>
      </div>
      <div className="flex flex-col text-lg">
        <div>
          <span className="font-bold">Client Name:</span>
          <span className="ml-2">{order.customerName}</span>
        </div>
        <div>
          <span className="font-bold">Address:</span>
          <span className="ml-2">{order.shippingAddress}</span>
        </div>
        <div>
          <span className="font-bold">Phone number:</span>
          <span className="ml-2">{order.phoneNumber}</span>
        </div>
      </div>
      <div>
        <table className="w-full text-lg mt-2">
          <thead className="border">
            <tr className="border-b bg-slate-300">
              <th className="text-center">No.</th>
              <th className="text-center w-[400px]">Name</th>
              <th className="text-center">Warranty period</th>
              <th className="text-center">Unit</th>
              <th className="text-center">Unit price</th>
              <th className="text-center">Quantity</th>
              <th className="text-center">Price</th>
            </tr>
          </thead>
          <tbody className="border">
            {order.orderDetails.map((detail: any, index: number) => (
              <React.Fragment key={index}>
                <tr className="border-b h-20">
                  <td className="text-center">{index + 1}</td>
                  <td className="text-center w-[400px]">
                    {/* {`${detail.diamond.carat} Ct - ${detail.diamond.cut} Cut - ${detail.diamond.shape} Shape Diamond - ${detail.diamond.color} Color - ${detail.diamond.clarity} Clarity - Diamond Id: ${detail.diamond.diamondId} - Certificated from ${detail.diamond.lab} LAB with number: ${detail.diamond.certificateNumber}`} */}

                    {`${detail.diamond?.carat} Carat ${detail.diamond?.shape} Shape Lab Diamond`}
                  </td>
                  <td className="text-center">24 months</td>
                  <td className="text-center">Carat</td>
                  <td className="text-center">
                    {(
                      detail?.diamondPrice?.unitPrice *
                      100 *
                      order?.priceRate?.percent
                    ).toLocaleString("en-US", {
                      style: "currency",
                      currency: "USD",
                      maximumFractionDigits: 0,
                    })}
                  </td>
                  <td className="text-center">{detail.diamond.carat}</td>
                  <td className="text-center">
                    {getOrderDiamondPrice(
                      detail.diamond,
                      detail.diamondPrice,
                      order.priceRate?.percent
                    ).toLocaleString("en-US", {
                      style: "currency",
                      currency: "USD",
                      maximumFractionDigits: 0,
                    })}
                  </td>
                </tr>
                {detail.accessory && (
                  <tr className="border-b h-20">
                    <td className="text-center"></td>
                    <td className="text-center">{detail.accessory.name}</td>
                    <td className="text-center">12 months</td>
                    <td className="text-center">Gram</td>
                    <td className="text-center">
                      {(
                        detail.materialPrice.unitPrice *
                        order.priceRate?.percent
                      ).toLocaleString("en-US", {
                        style: "currency",
                        currency: "USD",
                        maximumFractionDigits: 0,
                      })}
                    </td>
                    <td className="text-center">
                      {detail.accessory.materialWeight.toLocaleString()}
                    </td>
                    <td className="text-center">
                      {getOrderAccessoryPrice(
                        detail.accessory,
                        detail.materialPrice,
                        detail.size,
                        order.priceRate?.percent
                      ).toLocaleString("en-US", {
                        style: "currency",
                        currency: "USD",
                        maximumFractionDigits: 0,
                      })}
                    </td>
                  </tr>
                )}
              </React.Fragment>
            ))}
            <tr className="text-xl h-10 border-b">
              {/* <td colSpan={5}></td> */}
              <td colSpan={6} className="font-bold px-6 py-3">
                Subtotal:
              </td>
              <td className="text-center">
                {order.totalPrice.toLocaleString("en-US", {
                  style: "currency",
                  currency: "USD",
                  maximumFractionDigits: 0,
                })}
              </td>
            </tr>
            <tr className="text-xl h-10 border-b">
              {/* <td colSpan={5}></td> */}
              <td colSpan={6} className="font-bold px-6 py-3">
                Discount:
              </td>
              <td className="text-center">{order.totalDiscountPercent}%</td>
            </tr>
            <tr className="text-xl h-10 border-b bg-black text-white">
              {/* <td colSpan={5}></td> */}
              <td colSpan={6} className="font-bold px-6 py-3">
                Total:
              </td>
              <td className="text-center">
                {(
                  (order.totalPrice * (100 - order.totalDiscountPercent)) /
                  100
                ).toLocaleString("en-US", {
                  style: "currency",
                  currency: "USD",
                  maximumFractionDigits: 0,
                })}
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  );
}
