import { useEffect, useState } from "react";
import { Link, useLocation, useNavigate } from "react-router-dom";
import { GET } from "../../../utils/request";
import { Button, Dropdown, Empty, Form, Input, Menu, Pagination } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { useSearchStore } from "../../../store/searchStore";
import { useQueries } from "@tanstack/react-query";
import BlogListItem from "./components/BlogListItem";
import LoadingItem from "./components/LoadingItem";

export default function BlogsManage() {
  const location = useLocation();
  const navigate = useNavigate();
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const [statusText, setStatusText] = useState("Status");
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
  useEffect(() => {
    // const status = params.get("status");
    setQueryUrl("/api/Blogs" + location.search);
    // if (status) {
    //   setStatusText(status === "1" ? "Enable" : "Disable");
    // }
  }, [location.search]);

  const handleStatusClick = (status: string, statusText: string) => {
    setStatusText(statusText);
    const params = new URLSearchParams(location.search);
    params.set("status", status);
    navigate({ search: params.toString() });
  };

  const columnHeaders = ["Blog Id", "Title", "Author", "Created at", "Status"];
  const statusMenu = (
    <Menu>
      <Menu.Item key="1">
        <a onClick={() => handleStatusClick("1", "Enable")}>Enable</a>
      </Menu.Item>
      <Menu.Item key="2">
        <a onClick={() => handleStatusClick("2", "Disable")}>Disable</a>
      </Menu.Item>
    </Menu>
  );

  return (
    <div className="p-4">
      {/* header */}
      <div className="flex justify-between items-center mx-auto mb-8">
        <div className="flex justify-start space-x-1 items-center">
          <div className="self-center">
            <h1 className="text-2xl">Blogs</h1>
          </div>
        </div>
        <div className="flex justify-end space-x-1 items-center">
          <button className="px-4 py-2 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
            <Link to="/admin/blogs/new" className="button primary">
              <span>New Blogs</span>
            </Link>
          </button>
        </div>
      </div>

      <div className="shadow bg-slate-50-200 border border-r-white">
        {/* filter bar */}
        <div className="border-b-gray-200 p-[1rem] box-border">
          <div className="flex justify-between mb-1 items-center">
            <h3>
              <Form
                name="search_form"
                layout="inline"
                className="flex gap-2 items-center"
              >
                <Form.Item className="flex-grow">
                  <Input
                    type="text"
                    placeholder="Search"
                    id="keyword"
                    value={params.get("Title") || ""}
                    className="border p-2 rounded-md w-full"
                    onChange={(e) => {
                      params.set("Title", e.target.value);
                      navigate({ search: params.toString() });
                    }}
                  />
                </Form.Item>
                {/* <Form.Item>
                  <Dropdown
                    overlay={statusMenu}
                    placement="bottomCenter"
                    trigger={["click"]}
                  >
                    <Button className="border p-2 rounded-md flex items-center">
                      <span>{statusText}</span>
                      <DownOutlined className="ml-1" />
                    </Button>
                  </Dropdown>
                </Form.Item> */}
              </Form>
            </h3>
            <div className="flex space-x-075">
              <div className="card-action ">
                <div
                  className="text-interactive"
                  onClick={(event) => {
                    event.preventDefault();
                    setStatusText("Status");
                    // Clear the URL parameters
                    const params = new URLSearchParams(location.search);
                    params.delete("status");
                    params.delete("type");
                    params.delete("Title");
                    setQueryUrl(`/api/Blogs?` + params.toString());
                    navigate({ search: params.toString() });
                  }}
                >
                  Clear filter
                </div>
              </div>
            </div>
          </div>
          <div className="pt-lg"></div>
        </div>
        {/* listing items */}
        <div className="flex flex-col">
          <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
              <div className="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                <table className="min-w-full divide-y divide-gray-200">
                  {/* theader */}
                  <thead className="bg-gray-50">
                    <tr>
                      {columnHeaders.map((header) => (
                        <th
                          key={header}
                          scope="col"
                          className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          {header}
                        </th>
                      ))}
                    </tr>
                  </thead>
                  {/* body */}
                  <tbody className="bg-white divide-y divide-gray-200">
                    {blogs.isLoading &&
                      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((key) => (
                        <LoadingItem key={key} />
                      ))}
                    {blogs?.data?.blogs?.length == 0 && (
                      <td colSpan={100} className="py-20">
                        <Empty />
                      </td>
                    )}
                    {blogs?.data?.blogs?.map((blog: any) => (
                      <BlogListItem key={blog.blogId} blog={blog} />
                    ))}
                  </tbody>
                </table>
                <div className="flex justify-center items-center px-8 py-4 bg-gray-100">
                  {blogs?.data && blogs?.data?.totalCount != 0 && (
                    <Pagination
                      showTotal={(total, range) =>
                        `${range[0]}-${range[1]} of ${total} items`
                      }
                      className="text-center"
                      current={blogs?.data?.currentPage}
                      total={blogs?.data?.totalCount}
                      pageSize={blogs?.data?.pageSize}
                      onChange={(page) => {
                        params.set("PageNumber", page.toString());
                        navigate(url.pathname + "?" + params.toString());
                        setQueryUrl("/api/Blogs?" + params.toString());
                      }}
                      showSizeChanger={true}
                      onShowSizeChange={(current, size) =>
                        params.set("PageSize", size.toString())
                      }
                    />
                  )}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
