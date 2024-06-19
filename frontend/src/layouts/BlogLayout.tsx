import { Outlet, Link } from "react-router-dom";
import { Breadcrumb } from "antd";
import BlogSidebar from "../pages/blog/components/BlogSidebar";

export default function BlogLayout() {
  return (
    <div className="grid grid-cols-12 px-10">
      <div className="col-span-8 p-8 border-black">
        <Breadcrumb
          items={[
            {
              title: <Link to="/">Home</Link>,
            },
            {
              title: <Link to="/blogs">Blogs</Link>,
            },
          ]}
        />
        <Outlet />
      </div>
      <div className="col-span-4 p-8 border-black">
        <BlogSidebar />
      </div>
    </div>
  );
}
