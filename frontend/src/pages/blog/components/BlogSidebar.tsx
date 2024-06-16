import { Divider } from "antd";
import { useSearchStore } from "../../../store/searchStore";
import { useEffect } from "react";
import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../utils/request";
import SidebarBlogItem from "./SidebarBlogItem";
import SidebarBigItem from "./SidebarBigItem";
import LoadingSidebarItem from "./LoadingSidebarItem";
import { useParams } from "react-router-dom";

export default function BlogSidebar() {
  const { blogId } = useParams();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  useEffect(() => {
    setQueryUrl("/api/Blogs?");
  }, []);
  const [blogs] = useQueries({
    queries: [
      {
        queryKey: ["blogs", queryUrl, blogId],
        queryFn: () => GET(queryUrl),
      },
    ],
  });
  return (
    <div>
      <Divider orientation="left" className="font-bold uppercase">
        Should read
      </Divider>
      <div className="flex flex-col gap-4">
        {/* big item */}
        {blogs?.data?.blogs[0] && (
          <SidebarBigItem blog={blogs?.data?.blogs[0]} />
        )}
        {/* child item */}
        {blogs?.data?.blogs.map((blog: any, index: number) => {
          if (index != 0) {
            return <SidebarBlogItem blog={blog} />;
          }
        }) || (
          <>
            <LoadingSidebarItem />
            <LoadingSidebarItem />
            <LoadingSidebarItem />
            <LoadingSidebarItem />
          </>
        )}
      </div>
    </div>
  );
}
