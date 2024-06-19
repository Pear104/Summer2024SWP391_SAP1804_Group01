import { Skeleton } from "antd";
export default function LoadingBlogListItem() {
  return (
    <div className="flex">
      <Skeleton.Image
        active
        className="w-[200px] h-full aspect-[16/11] rounded-lg bg-center"
      />
      <div className="ml-4 w-full">
        <Skeleton.Input active className="w-[400px] h-3 mb-2" size="small" />
        <div className="flex items-center text-sm text-slate-400 cursor-pointer">
          <Skeleton.Input active className="w-[200px] h-3 mb-4" size="small" />
        </div>
        <Skeleton.Input active className="w-full h-2 mb-4" size="small" />
        <Skeleton.Input active className="w-full h-2 mb-4" size="small" />
        <Skeleton.Input active className="w-1/2 h-2 mb-4" size="small" />
      </div>
    </div>
  );
}
