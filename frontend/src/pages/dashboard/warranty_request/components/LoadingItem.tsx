import { Skeleton } from "antd";

export default function LoadingItem() {
  return (
    <tr className="items-center">
      <td className="px-6 py-4 whitespace-nowrap">
        <Skeleton.Button active className="w-3/4" />
      </td>
      <td className="px-6 py-4 whitespace-nowrap">
        <Skeleton.Button active className="w-3/4" />
      </td>
      <td className="px-6 py-4 whitespace-nowrap col-span-4 text-sm text-gray-500 truncate">
        <Skeleton.Button active className="w-full" />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-1">
        <Skeleton.Button active className="w-3/4" />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-2">
        <Skeleton.Button active className="w-3/4" />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-2">
        <Skeleton.Button active className="w-3/4" />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-2">
        <Skeleton.Button active className="w-3/4" />
      </td>
      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 col-span-2">
        <Skeleton.Button active className="w-3/4" />
      </td>
    </tr>
  );
}
