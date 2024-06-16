import moment from "moment";
import { Link } from "react-router-dom";

export default function SidebarBlogItem({ blog }: { blog: any }) {
  return (
    <Link className="flex" to={`/blogs/${blog.blogId}`}>
      <div
        className="border w-[300px] aspect-square bg-no-repeat bg-cover rounded-lg bg-center"
        style={{
          backgroundImage: `url(${
            blog?.thumbnailUrl != ""
              ? blog?.thumbnailUrl
              : "/images/logobig.png"
          })`,
        }}
      />
      <div className="ml-4">
        <div className="font-bold text-[#2c2c2c]">{blog?.title}</div>
        <div className="flex items-center text-sm text-slate-400 cursor-pointer">
          {moment(blog?.createdAt).format("MMM DD, YYYY")}
        </div>
        <p className="w-[380px] truncate">{blog?.content}</p>
      </div>
    </Link>
  );
}
