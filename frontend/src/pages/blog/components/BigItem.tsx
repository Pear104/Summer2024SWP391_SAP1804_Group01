import { Divider } from "antd";
import moment from "moment";
import { Link } from "react-router-dom";

export default function BigItem({ blog }: { blog: any }) {
  return (
    <Link
      className="flex flex-col hover:shadow-lg p-4"
      to={`/blogs/${blog.blogId}`}
    >
      <div
        className="border w-[520px] aspect-[20/11] bg-no-repeat bg-cover rounded-lg bg-center"
        style={{
          backgroundImage: `url(${
            blog?.thumbnailUrl != ""
              ? blog?.thumbnailUrl
              : "/images/logobig.png"
          })`,
        }}
      />
      <div className="">
        <div className="font-bold text-[#2c2c2c] mt-4 mb-2 text-2xl">
          {blog?.title}
        </div>
        <div className="flex items-center text-sm text-slate-400 cursor-pointer my-4">
          {moment(blog?.createdAt).format("MMM DD, YYYY")}
          <Divider type="vertical" className="h-4" orientationMargin="0" />
          <span>
            by <span className="hover:text-gray-800"> {blog?.authorName}</span>
          </span>
        </div>
        <p className="w-[500px]">{blog?.content}...</p>
      </div>
    </Link>
  );
}
