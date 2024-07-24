import { useQueries } from "@tanstack/react-query";
import { Empty, Pagination } from "antd";
import { useEffect } from "react";
import { useSearchStore } from "../../store/searchStore";
import { GET } from "../../utils/request";
import BlogListItem from "./components/BlogListItem";
import { useNavigate } from "react-router-dom";
import LoadingBlogListItem from "./components/LoadingBlogListItem";
import BigItem from "./components/BigItem";
import scrollTo from "../../utils/scroll";
export default function BlogList({ type = "all" }: { type?: any }) {
  console.log(type);
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  useEffect(() => {
    setQueryUrl("/api/Blogs?");
  }, []);
  const [blogs] = useQueries({
    queries: [
      {
        queryKey: ["blogs", queryUrl],
        queryFn: () => GET(queryUrl),
      },
    ],
  });
  console.log(blogs?.data?.blogs);
  return (
    <div className="mt-4">
      <div className="flex flex-col gap-4">
        <div id="blog-list" className="font-bold text-4xl uppercase">
          Diamond Knowledge
        </div>
        {!blogs?.isLoading && blogs?.data?.blogs?.length == 0 && (
          <div className="text-center text-2xl p-40">
            <Empty description="No blog found" />
          </div>
        )}
        <div className="flex gap-4 mb-6">
          {blogs?.data?.blogs?.length > 0 && (
            <BigItem blog={blogs?.data?.blogs[0]} />
          )}
          {blogs?.data?.blogs?.length > 1 && (
            <BigItem blog={blogs?.data?.blogs[1]} />
          )}
        </div>
        {blogs?.data?.blogs
          ?.slice(2)
          .map((blog: any) => <BlogListItem blog={blog} />) || (
          <>
            <LoadingBlogListItem />
            <LoadingBlogListItem />
            <LoadingBlogListItem />
            <LoadingBlogListItem />
          </>
        )}
      </div>
      <div className="flex justify-center border-b items-center px-8 py-4 mt-4">
        {blogs?.data && blogs?.data?.blogs?.length != 0 && (
          <Pagination
            showTotal={(total, range) =>
              `${range[0]}-${range[1]} of ${total} items`
            }
            className="text-center"
            current={blogs.data.currentPage}
            total={blogs.data.totalCount}
            pageSize={blogs.data.pageSize}
            onChange={(page) => {
              params.set("PageNumber", page.toString());
              navigate(url.pathname + "?" + params.toString());
              setQueryUrl("/api/Blogs?" + params.toString());
              scrollTo("blog-list");
            }}
            // showSizeChanger={true}
            // onShowSizeChange={(current, size) => setPageSize(size)}
          />
        )}
      </div>
    </div>
  );
}
