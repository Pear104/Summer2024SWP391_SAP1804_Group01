import { Divider, Skeleton } from "antd";

export default function LoadingFeedbackItem() {
  return (
    <div className="pt-6">
      <div className="flex">
        {/* <Avatar className="w-[60px] h-[60px] text-3xl flex justify-center items-center">
          {formatAvatarName(feedback?.username)}
        </Avatar> */}
        <Skeleton.Node
          active
          className="rounded-full w-[60px] h-[60px] text-3xl flex justify-center items-center"
        />
        <div className="ml-4 w-full">
          <Skeleton.Input active className="block w-[200px] mb-2 h-6" />
          <Skeleton.Button active className="w-[120px] h-6" />
        </div>
      </div>
      <div className="text-xl mt-4 flex flex-col gap-2">
        <Skeleton.Input active className="w-full h-6" />
        <Skeleton.Input active className="w-full h-6" />
        <Skeleton.Input active className="w-4/5 h-6" />
      </div>
      <div className="text-sm pt-4 pr-10">
        <Skeleton.Button active className="w-[100px] h-3" />
      </div>
      <Divider />
    </div>
  );
}
