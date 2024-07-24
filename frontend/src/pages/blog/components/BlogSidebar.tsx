import { Divider } from "antd";
// import { useSearchStore } from "../../../store/searchStore";
// import { useEffect } from "react";
import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../utils/request";
import SidebarBlogItem from "./SidebarBlogItem";
import SidebarBigItem from "./SidebarBigItem";
import LoadingSidebarItem from "./LoadingSidebarItem";
import { useParams } from "react-router-dom";

export default function BlogSidebar() {
  const { blogId } = useParams();
  // const queryUrl = useSearchStore((state) => state.queryUrl);
  const [blogs] = useQueries({
    queries: [
      {
        queryKey: ["blogs", blogId],
        queryFn: () => GET("/api/Blogs?type=knowledge&SortBy=Date"),
      },
    ],
  });
  return (
    !window.location.href.includes("promotions") && (
      <div>
        <Divider orientation="left" className="font-bold uppercase">
          Should read
        </Divider>
        <div className="flex flex-col gap-4">
          {/* big item */}
          {blogs?.data?.blogs?.length > 0 && (
            <SidebarBigItem blog={blogs?.data?.blogs[0]} />
          )}
          {/* child item */}
          {blogs?.data?.blogs
            ?.slice(5)
            .map((blog: any, index: number) => (
              <SidebarBlogItem key={index} blog={blog} />
            )) || (
            <>
              <LoadingSidebarItem />
              <LoadingSidebarItem />
              <LoadingSidebarItem />
              <LoadingSidebarItem />
            </>
          )}
        </div>
      </div>
    )
  );
}
