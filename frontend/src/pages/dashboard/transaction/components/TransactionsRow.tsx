export default function TransactionRow({ transaction }: { transaction: any }) {
  const dateString = transaction.createdAt;
  const formattedDate = formatDateTime(dateString);
  return (
    <>
      <tr key={transaction.orderId} className="">
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            {"#"}
            {transaction.orderId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {transaction.paymentMethod}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            ${transaction.amount.toFixed(2)}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div
            className={`text-sm ${
              transaction.transactionStatus === "Pending"
                ? "text-yellow-500"
                : transaction.transactionStatus === "Completed"
                ? "text-green-500"
                : "text-gray-500"
            } bold`}
          >
            {transaction.transactionStatus}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{formattedDate}</div>
        </td>
      </tr>
    </>
  );
}

function formatDateTime(dateString: string): string {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0"); // Tháng bắt đầu từ 0
  const year = date.getFullYear();
  const hours = String(date.getHours()).padStart(2, "0");
  const minutes = String(date.getMinutes()).padStart(2, "0");
  const seconds = String(date.getSeconds()).padStart(2, "0");
  return `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`;
}
