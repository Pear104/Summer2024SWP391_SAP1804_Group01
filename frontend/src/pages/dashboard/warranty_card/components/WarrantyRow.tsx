export default function WarrantyRow({ card }: { card: any }) {
  return (
    <>
      <tr key={card.warrantyCardId} className="">
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            {"#"}
            {card.warrantyCardId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div>{card.customerName}</div>
        </td>
        <td className="px-6 py-4 w-[500px] whitespace-normal break-words">
          <div>{card.warrantyReason}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {card.customerName}
            {" #"}
            {card.customerId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{card.shippingAddress}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{card.phoneNumber}</div>
        </td>
      </tr>
    </>
  );
}
