import { Skeleton } from "antd";

export default function LoadingDetailItem() {
  return (
    <div className="w-full flex flex-col gap-4">
      <Skeleton.Input active className="pt-4 w-[800px] h-10 mb-2" />
      {/* <div className="text-4xl mt-4 mb-2">{blog?.data?.title}</div> */}
      <Skeleton.Input active className="pt-4 w-[200px] h-10 mb-2" />
      <div>
        <Skeleton.Image
          active
          className="w-full h-full aspect-video mt-4 rounded-lg bg-center"
        />
      </div>
      <div className="mt-8"></div>
      <Skeleton
        active
        className="w-full h-3 mb-2"
        paragraph={{
          rows: 10,
        }}
      />
      {/* <div dangerouslySetInnerHTML={{ __html: blog?.data?.content }} /> */}
    </div>
  );
}
