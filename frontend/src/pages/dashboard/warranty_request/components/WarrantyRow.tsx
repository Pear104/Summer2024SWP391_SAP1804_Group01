import { useQueries } from "@tanstack/react-query";
import SaleStaffComponent from "./SaleStaffComponent";
import { GET } from "../../../../utils/request";
import DeliveryStaffComponent from "./DeliveryStaffComponent";
import WarrantyUpdateComponent from "./WarrantyUpdateComponent";

const formatDate = (dateString: any) => {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
};
export default function WarrantyRow({ warranty }: { warranty: any }) {
  const [saleStaffs, deliveryStaffs] = useQueries({
    queries: [
      {
        queryKey: ["saleStaffs"],
        queryFn: () => GET("/api/Accounts?Role=SaleStaff"),
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
        <td className="px-6 py-4 whitespace-nowrap">
          <SaleStaffComponent
            warrantyRequestId={warranty.warrantyRequestId}
            staffs={saleStaffs?.data || []}
            currentStaff={warranty?.saleStaffName}
          />
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <DeliveryStaffComponent
            warrantyRequestId={warranty.warrantyRequestId}
            staffs={deliveryStaffs?.data || []}
            currentStaff={warranty?.deliveryStaffName}
          />
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <WarrantyUpdateComponent
            warrantyRequestId={warranty.warrantyRequestId}
            currentStatus={warranty.warrantyStatus}
          />
        </td>
      </tr>
    </>
  );
}
