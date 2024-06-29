function formatDateTime(dateString: string): string {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0"); // Tháng bắt đầu từ 0
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
}
export default function CardRow({ card }: { card: any }) {
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
          {card.diamondName && (
            <div>
              <span className="font-semibold">{card.diamondName}</span>
            </div>
          )}
          {card.accessoryName && (
            <div>
              <span className="font-semibold">{card.accessoryName}</span>
            </div>
          )}
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {formatDateTime(card.startTime)}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          {card.diamondId && (
            <div className="text-sm text-gray-500">24 months</div>
          )}
          {card.accessoryId && (
            <div className="text-sm text-gray-500">12 months</div>
          )}
        </td>
      </tr>
    </>
  );
}
