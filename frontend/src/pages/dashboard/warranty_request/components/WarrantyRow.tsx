import { useQueries } from "@tanstack/react-query";
import WarrantyStaffComponent from "./WarrantyStaffComponent";
import { GET } from "../../../../utils/request";
import DeliveryStaffComponent from "./DeliveryStaffComponent";
import WarrantyUpdateComponent from "./WarrantyUpdateComponent";
import OpenGoogleMaps from "./OpenMap";

export default function WarrantyRow({ warranty }: { warranty: any }) {
  const [saleStaffs, deliveryStaffs] = useQueries({
    queries: [
      {
        queryKey: ["warrantyStaffs"],
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
      <tr key={warranty.warrantyRequestId}>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            {"#"}
            {warranty.warrantyRequestId}
          </div>
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
            <OpenGoogleMaps address={warranty.shippingAddress} />
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            <a
              href={"tel:" + warranty.phoneNumber}
              className="text-sm border p-2 bg-blue-500 text-white rounded-lg"
            >
              {warranty.phoneNumber}
            </a>
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <DeliveryStaffComponent
            warrantyRequestId={warranty.warrantyRequestId}
            staffs={deliveryStaffs?.data || []}
            currentStaff={warranty?.deliveryStaffName}
            statusText={warranty?.warrantyStatus}
          />
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <WarrantyStaffComponent
            warrantyRequestId={warranty.warrantyRequestId}
            staffs={saleStaffs?.data || []}
            currentStaff={warranty?.warrantyStaffName}
            statusText={warranty?.warrantyStatus}
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
