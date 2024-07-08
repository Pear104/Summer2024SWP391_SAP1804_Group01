import { Skeleton } from "antd";
import { Link } from "react-router-dom";

export default function AccessoryRow({
  accessory,
  price,
}: {
  accessory: any;
  price: any;
}) {
  return (
    <tr className="grid grid-cols-12 items-center">
      <td className="px-6 py-4 whitespace-nowrap">
        <div className="flex items-center">
          <Link to={`/admin/accessories/detail/${accessory.accessoryId}`}>
            <img
              className="w-14 aspect-square object-cover"
              src={accessory.accessoryImages[0].url.replace("400x", "800x")}
              alt=""
            />
          </Link>
        </div>
      </td>
      <td className="px-6 py-4 whitespace-nowrap col-span-5 text-sm text-gray-500 truncate">
        {accessory.name}
      </td>
      <td className="flex justify-center px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-1">
        {accessory.materialWeight.toFixed(2)} g
      </td>
      <td className="flex justify-center px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-2">
        {isNaN(parseFloat(price)) ? (
          <Skeleton.Button active />
        ) : (
          price.toLocaleString("en-US", {
            style: "currency",
            currency: "USD",
            maximumFractionDigits: 0,
          })
        )}
      </td>
      <td className="flex justify-center px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        {accessory.shape.name}
      </td>
      <td className="flex justify-center px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        {accessory.quantity}
      </td>
      <td className="flex justify-center px-6 py-4 whitespace-nowrap text-left text-gray-500 text-sm">
        {accessory.karat}K
      </td>
    </tr>
  );
}
