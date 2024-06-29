import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../../utils/request";

export default function WarrantyRow({ warranty }: { warranty: any }) {
  const [saleStaffs, deliveryStaffs] = useQueries({
    queries: [
      {
        queryKey: ["warrantyStaff"],
        queryFn: () => GET("/api/Accounts?Role=WarrantyStaff"),
        staleTime: 0,
      },
      {
        queryKey: ["deliveryStaffs"],
        queryFn: () => GET("/api/Accounts?Role=DeliveryStaff"),
        staleTime: 0,
      },
    ],
  });
  return (
    <>
      <tr key={warranty.warrantyRequestId} className="">
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            {"#"}
            {warranty.warrantyRequestId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div>{warranty.warrantyCardId}</div>
        </td>
        <td className="px-6 py-4 w-[500px] whitespace-normal break-words">
          <div>{warranty.warrantyReason}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {warranty.customerName}
            {" #"}
            {warranty.customerId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {warranty.shippingAddress}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{warranty.phoneNumber}</div>
        </td>
      </tr>
    </>
  );
}
