import { Skeleton } from "antd";

export default function LoadingSidebarItem() {
  return (
    <div className="flex">
      <div>
        <Skeleton.Image className="w-[100px] aspect-square bg-no-repeat bg-cover rounded-lg bg-center" />
      </div>
      <div className="ml-4">
        <Skeleton.Input active className="w-[200px] h-3 mb-2" size="small" />
        {/* <div className="font-bold text-[#2c2c2c]">{blog?.title}</div> */}
        <div className="flex items-center text-sm text-slate-400 cursor-pointer">
          {/* {moment(blog?.createdAt).format("MMM DD, YYYY")} */}
          <Skeleton.Input active className="w-[100px] h-3 mb-2" size="small" />
        </div>
        <Skeleton.Input active className="w-[400px] h-3 mb-2" size="small" />
        <Skeleton.Input active className="w-[400px] h-3 mb-2" size="small" />
        {/* <p className="w-[380px] truncate">{blog?.content}</p> */}
      </div>
    </div>
  );
}
