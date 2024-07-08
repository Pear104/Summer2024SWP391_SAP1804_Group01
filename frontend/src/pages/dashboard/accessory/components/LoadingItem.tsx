import { Skeleton } from "antd";

export default function LoadingItem() {
  return (
    <tr className="grid grid-cols-12 items-center">
      <td className="px-6 py-4 whitespace-nowrap">
        <div className="flex items-center">
          <Skeleton.Image active className="w-full h-full aspect-square" />
        </div>
      </td>
      <td className="px-6 py-4 whitespace-nowrap col-span-5 text-sm text-gray-500 truncate">
        <Skeleton.Button active className="w-full" />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-1">
        <Skeleton.Button active />
      </td>
      <td className="flex justify-center px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-2">
        <Skeleton.Button active className="w-full" />
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
