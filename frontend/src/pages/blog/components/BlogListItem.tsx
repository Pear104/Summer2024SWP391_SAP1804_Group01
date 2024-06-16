import { Divider } from "antd";
import moment from "moment";
import { Link } from "react-router-dom";

export default function BlogListItem({ blog }: { blog: any }) {
  return (
    <Link className="flex" to={`/blogs/${blog.blogId}`}>
      <div
        className="border w-[200px] aspect-[16/11] bg-no-repeat bg-cover rounded-lg bg-center"
        style={{
          backgroundImage: `url(${
            blog?.thumbnailUrl != ""
              ? blog?.thumbnailUrl
              : "/images/logobig.png"
          })`,
        }}
      />
      <div className="ml-4">
        <div className="font-semibold text-[#2c2c2c] text-lg">
          {blog?.title}
        </div>
        <div className="flex items-center text-sm text-slate-400 cursor-pointer">
          {moment(blog?.createdAt).format("MMM DD, YYYY")}
          <Divider type="vertical" className="h-4" orientationMargin="0" />
          <span>
            by <span className="hover:text-gray-800"> {blog?.authorName}</span>
          </span>
        </div>
        <div>{blog?.content}...</div>
      </div>
    </Link>
  );
}
