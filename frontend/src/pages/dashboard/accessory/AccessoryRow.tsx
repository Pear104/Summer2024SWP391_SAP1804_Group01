export default function AccessoryRow({
  accessory,
  selectedAccessories,
  setSelectedAccessories,
  price,
}: {
  accessory: any;
  selectedAccessories: number[];
  setSelectedAccessories: React.Dispatch<React.SetStateAction<number[]>>;
  price: any;
}) {
  return (
    <tr className="grid grid-cols-12 items-center" key={accessory.accessoryId}>
      <td className="px-6 py-4 whitespace-nowrap">
        <div className="flex items-center">
          <label className="flex items-center">
            <input
              type="checkbox"
              value="0"
              className="form-checkbox"
              checked={selectedAccessories.includes(accessory.accessoryId)}
              onChange={(e) => {
                if (e.target.checked) {
                  setSelectedAccessories([
                    ...selectedAccessories,
                    accessory.accessoryId,
                  ]);
                } else {
                  setSelectedAccessories(
                    selectedAccessories.filter(
                      (id) => id !== accessory.accessoryId
                    )
                  );
                }
              }}
            />

            <span className="checkbox-unchecked"></span>
            <span className="pl-2"></span>
            <input type="hidden" value="0" />
          </label>
        </div>
      </td>
      <td className="px-6 py-4 whitespace-nowrap">
        <div className="flex items-center">
          <a href={`/admin/accessories/detail/${accessory.accessoryId}`}>
            <img
              className="h-14  w-14 square-full"
              src={accessory.accessoryImages[0].url.replace("400x", "800x")}
              alt=""
            />
          </a>
        </div>
      </td>
      <td className="px-6 py-4 whitespace-nowrap col-span-4 text-sm text-gray-500 truncate">
        {accessory.name}
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-1">
        {accessory.materialWeight.toFixed(2)} g
      </td>
      <td className="flex justify-center px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-2">
        {price.toLocaleString("en-US", {
          style: "currency",
          currency: "USD",
          maximumFractionDigits: 0,
        })}
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        {accessory.shape.name}
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        {accessory.accessoryType.name}
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-left text-gray-500 text-sm">
        {accessory.karat}K
      </td>
    </tr>
  );
}
