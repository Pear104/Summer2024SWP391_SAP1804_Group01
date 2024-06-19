import { Skeleton } from "antd";

export default function LoadingItem() {
  return (
    <div className="flex flex-col w-full items-center justify-center">
      <Skeleton.Image
        active
        className="w-[340px] h-[340px] aspect-square rounded-lg bg-center"
      />
      <Skeleton.Input active className="mt-2 w-[300px]" />
    </div>
  );
}
