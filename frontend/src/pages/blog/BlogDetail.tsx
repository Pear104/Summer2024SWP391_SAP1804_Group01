import { Link, useParams } from "react-router-dom";
import { GET } from "../../utils/request";
import { useQueries } from "@tanstack/react-query";
import moment from "moment";
import { Divider } from "antd";
import LoadingDetailItem from "./components/LoadingDetailItem";
import scrollTo from "../../utils/scroll";
import { useEffect } from "react";
export default function BlogDetail() {
  const { blogId } = useParams();
  const [blog] = useQueries({
    queries: [
      {
        queryKey: ["blog", blogId],
        queryFn: () => GET(`/api/Blogs/${blogId}`),
      },
    ],
  });
  useEffect(() => {
    scrollTo("blog-title");
  }, []);
  return blog?.data ? (
    <div>
      <div id="blog-title" className="text-5xl mt-4 mb-4 font-bold">
        {blog?.data?.title}
      </div>
      <div className="text-sm flex gap-2 items-center">
        <div>
          {moment(blog?.data?.createdAt).format(
            "dddd, MMMM Do, YYYY - hh:mm a"
          )}
        </div>
        <Divider type="vertical" className="h-[16px] bg-black" />
        <div>{blog?.data?.author?.name}</div>
      </div>
      <div className="mt-8"></div>
      <div id="blog" className="">
        <div dangerouslySetInnerHTML={{ __html: blog?.data?.content }} />
      </div>
      <Divider className="bg-black" />
      <div className="">
        <Link to={"/blogs"} className="mt-20 p-4 bg-black text-white">
          Read More
        </Link>
      </div>
    </div>
  ) : (
    <LoadingDetailItem />
  );
}
