import { Skeleton } from "antd";

export default function LoadingOrderItem() {
  return (
    <div>
      <div className="p-4 flex flex-col gap-2">
        <Skeleton.Input active className="w-[400px]" />
        <Skeleton.Input active className="w-[200px]" />
      </div>
      <div className="border-b border-gray-300 p-4 mb-6">
        <div className="border rounded-md p-4 bg-slate-100 grid grid-cols-2 mb-4 gap-x-4 border-spacing-y-4">
          <div className="flex">
            <div className="w-1/5 flex ">
              <Skeleton.Image active className="w-[140px] h-[140px]" />
            </div>
            <div className="w-full text-lg pl-4 flex flex-col justify-between gap-2">
              <Skeleton.Input active className="w-[400px] h-6" />
              <Skeleton.Input active className="w-[200px] h-6" />
              <Skeleton.Input active className="w-[300px] h-6" />
              <Skeleton.Input active className="w-[100px] h-6" />
            </div>
          </div>
          <div className="flex">
            <div className="w-1/5 flex ">
              <Skeleton.Image active className="w-[140px] h-[140px]" />
            </div>
            <div className="w-full text-lg pl-4 flex flex-col justify-between gap-2">
              <Skeleton.Input active className="w-[400px] h-6" />
              <Skeleton.Input active className="w-[200px] h-6" />
              <Skeleton.Input active className="w-[300px] h-6" />
              <Skeleton.Input active className="w-[100px] h-6" />
            </div>
          </div>
        </div>
        <div className="flex justify-end text-xl">
          <Skeleton.Button className="w-[200px]" />
        </div>
        <div className="flex justify-between items-center mt-4">
          <div className="text-xl font-bold text-gray-800">
            <Skeleton.Input active className="w-[200px]" />
          </div>
          <div className="">
            <Skeleton.Button active className="w-[100px]" />
          </div>
        </div>
      </div>
    </div>
  );
}
