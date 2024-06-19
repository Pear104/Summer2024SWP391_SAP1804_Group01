import DeliveryWarrantyUpdateComponent from "./DeliveryWarrantyUpdateComponent";

const formatDate = (dateString: any) => {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
};
export default function DeliveryWarrantyDataRow({
  warranty,
}: {
  warranty: any;
}) {
  return (
    <>
      <tr key={warranty.warrantyRequestId}>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            {"#"}
            {warranty.warrantyRequestId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div>{formatDate(warranty.receiveTime)}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div>{formatDate(warranty.returnTime)}</div>
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
        <td className="px-6 py-4 whitespace-normal w-[200px]">
          <div className="text-sm text-gray-500">
            {warranty.warrantyReason} <br />
          </div>
        </td>

        <td className="px-6 py-4 whitespace-nowrap">
          <DeliveryWarrantyUpdateComponent
            warrantyRequestId={warranty.warrantyId}
            currentStatus={warranty.warrantyStatus}
          />
        </td>
      </tr>
    </>
  );
}
