import { useParams } from "react-router-dom";
import { GET } from "../../utils/request";
import { useQueries } from "@tanstack/react-query";
import moment from "moment";
import { Divider } from "antd";
import LoadingDetailItem from "./components/LoadingDetailItem";
export default function BlogDetail() {
  const { blogId } = useParams();
  const [blog] = useQueries({
    queries: [
      {
        queryKey: ["blog"],
        queryFn: () => GET(`/api/Blogs/${blogId}`),
      },
    ],
  });
  return blog?.data ? (
    <div>
      <div className="text-4xl mt-4 mb-2">{blog?.data?.title}</div>
      <div className="text-sm flex gap-2 items-center">
        <div>{moment(blog?.data?.createdAt).format("MMM DD, YYYY")}</div>
        <Divider type="vertical" className="h-[16px] bg-black" />
        <div>{blog?.data?.author?.name}</div>
      </div>
      <div className="mt-8"></div>
      <div dangerouslySetInnerHTML={{ __html: blog?.data?.content }} />
    </div>
  ) : (
    <LoadingDetailItem />
  );
}
