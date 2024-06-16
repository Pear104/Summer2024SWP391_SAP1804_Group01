import moment from "moment";
import { Link } from "react-router-dom";

export default function SidebarBigItem({ blog }: { blog: any }) {
  return (
    <Link className="flex flex-col" to={`/blogs/${blog.blogId}`}>
      <div
        className="border w-full aspect-[20/11] bg-no-repeat bg-cover rounded-lg bg-center"
        style={{
          backgroundImage: `url(${
            blog?.thumbnailUrl != ""
              ? blog?.thumbnailUrl
              : "/images/logobig.png"
          })`,
        }}
      />
      <div className="">
        <div className="font-bold text-[#2c2c2c] mt-4 mb-2">{blog?.title}</div>
        <div className="flex items-center text-sm text-slate-400 cursor-pointer">
          {moment(blog?.createdAt).format("MMM DD, YYYY")}
        </div>
        <p className="w-[500px]">{blog?.content}</p>
      </div>
    </Link>
  );
}
