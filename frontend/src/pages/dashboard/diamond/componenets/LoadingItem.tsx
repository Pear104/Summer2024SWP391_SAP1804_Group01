import { Skeleton } from "antd";

export default function LoadingItem() {
  return (
    <tr className="items-center">
      <td className="px-6 py-4 whitespace-nowrap">
        <div className="flex items-center">
          <label className="flex items-center">
            <input
              type="checkbox"
              value="0"
              className="form-checkbox w-5 h-5"
            />

            <span className="checkbox-unchecked"></span>
            <span className="pl-2"></span>
            <input type="hidden" value="0" />
          </label>
        </div>
      </td>
      <td className="px-6 py-4 whitespace-nowrap">
        <div className="flex items-center">
          <Skeleton.Image active className="w-[80px] h-[80px] aspect-square" />
        </div>
      </td>
      <td className="px-6 py-4 whitespace-nowrap col-span-4 text-sm text-gray-500 truncate">
        <Skeleton.Button active />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-1">
        <Skeleton.Button active />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-1">
        <Skeleton.Button active />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-1">
        <Skeleton.Button active />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        <Skeleton.Button active />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        <Skeleton.Button active />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
        <Skeleton.Button active />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-left text-gray-500 text-sm">
        <Skeleton.Button active />
      </td>
    </tr>
  );
}
