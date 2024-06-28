import { CountdownComponent } from "./CountDownComponent";

function formatDateTime(dateString: string): string {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0"); // Tháng bắt đầu từ 0
  const year = date.getFullYear();
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  const seconds = String(date.getSeconds()).padStart(2, "0");
  return `${day}/${month}/${year}`;
}

export default function PromotionRow({ promotion }: { promotion: any }) {


  const startDate = new Date(promotion.startTime);
  const endDate = new Date(promotion.endTime);
  const durationMs = endDate.getTime() - startDate.getTime();
  const millisecondsInSecond = 1000;
  const millisecondsInMinute = millisecondsInSecond * 60;
  const millisecondsInHour = millisecondsInMinute * 60;
  const millisecondsInDay = millisecondsInHour * 24;

  const days = Math.floor(durationMs / millisecondsInDay);
  const hours = Math.floor(
    (durationMs % millisecondsInDay) / millisecondsInHour
  );
  const minutes = Math.floor(
    (durationMs % millisecondsInHour) / millisecondsInMinute
  );
  const seconds = Math.floor(
    (durationMs % millisecondsInMinute) / millisecondsInSecond
  );
  const duration = `${days}d ${hours}h ${minutes}m ${seconds}s`;


  return (
    <>
      <tr key={promotion.promotionId} className="">
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            {"#"}
            {promotion.promotionId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{promotion.promotionName}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{promotion.promotionCode}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {promotion.discountPercent}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {formatDateTime(promotion.startTime)}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {formatDateTime(promotion.endTime)}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{duration}</div>
        </td>
        <td className="px-4 py-0 whitespace-nowrap mb-2">
          <CountdownComponent startTime={promotion.startTime} endTime={promotion.endTime} />
        </td>
      </tr>
    </>
  );
}
