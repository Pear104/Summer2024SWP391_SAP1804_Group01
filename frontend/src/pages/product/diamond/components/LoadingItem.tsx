import { Skeleton } from "antd";

export default function LoadingItem() {
  return (
    <div className="grid grid-cols-9 items-center w-full justify-center hover:bg-slate-100">
      <div className="flex justify-center">
        <Skeleton.Image className="flex justify-center my-4 aspect-square bg-cover bg-center bg-no-repeat w-[100px]" />
      </div>
      <Skeleton.Button className="flex justify-center" />
      <Skeleton.Button className="flex justify-center" />
      <Skeleton.Button className="flex justify-center" />
      <Skeleton.Button className="flex justify-center" />
      <Skeleton.Button className="flex justify-center" />
      <Skeleton.Button className="flex justify-center" />
      <Skeleton.Button className="flex justify-center" />
      <Skeleton.Button className="flex justify-center" />
    </div>
  );
}
