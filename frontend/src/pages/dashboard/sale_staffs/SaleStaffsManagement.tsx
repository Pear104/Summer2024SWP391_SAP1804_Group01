import { Form, Input, Pagination, Skeleton } from "antd";
import { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { GET } from "../../../utils/request";
import SaleDataRow from "./SaleDataRow";
import { useQueries } from "@tanstack/react-query";
import { useSearchStore } from "../../../store/searchStore";
import { SaleStatusFilter } from "./SaleStatusFilter";
import SaleColumnHeader from "./SaleColumnHeader";

export default function SaleStaffsManagement() {
  const location = useLocation();
  const [statusText, setStatusText] = useState("Status");
  // sort item

  const columnHeaders = [
    "Order ID",
    "Created Date",
    "Customer",
    "Shipping Address",
    "Phone Number",
    "Order Price",
    "Order Status",
  ];

  const searchTerm = useSearchStore((state) => state.searchTerm);
  const setSearchTerm = useSearchStore((state) => state.setSearchTerm);
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  useEffect(() => {
    params.delete("IsAvailability");
    params.delete("IsDescending");
    params.delete("SortBy");
    setQueryUrl("/api/Order?");
  }, []);

  const [saleList, saleAccount] = useQueries({
    queries: [
      {
        queryKey: ["orders", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: Infinity,
      },
      {
        queryKey: ["saleStaffs"],
        queryFn: () => GET("/api/Accounts?Role=SaleStaff"),
        staleTime: Infinity,
      },
    ],
  });

  const renderSaleRow = (order: any) => (
    <SaleDataRow key={order.orderId} order={order} />
  );

  // // search and filter
  // const handleStatusClick = (status: string, statusText: string) => {
  //   setStatusText(statusText);
  //   params.set(
  //     "Status",
  //     status == "1"
  //       ? "Pending"
  //       : status == "2"
  //       ? "Processing"
  //       : status == "3"
  //       ? "Delivering"
  //       : status == "4"
  //       ? "Completed"
  //       : "Failed"
  //   );
  //   setQueryUrl(`/api/Order?` + params.toString());
  //   navigate("/admin/orders?" + params.toString());
  // };

  useEffect(() => {
    const params = new URLSearchParams(location.search);
    const status = params.get("status");

    if (status) {
      setStatusText(
        status === "1"
          ? "Pending"
          : status === "2"
          ? "Processing"
          : status === "3"
          ? "Delivering"
          : status === "4"
          ? "Completed"
          : "Failed"
      );
    }
  }, [location.search]);

  // pagination, change page size
  const [pageSize, setPageSize] = useState(10);
  useEffect(() => {
    params.set("PageSize", pageSize.toString());
    navigate(url.pathname + "?" + params.toString());
    setQueryUrl("/api/Order?" + params.toString());
  }, [pageSize]);

  return (
    <div className="p-4">
      {/* header */}
      <div className="flex justify-between items-center mt-6 mx-auto mb-8">
        <div className="flex justify-start space-x-1 items-center">
          <div className="self-center">
            <h1 className="text-2xl"> Order List {}</h1>
          </div>
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
                    className="border p-2 rounded-md w-full"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                  />
                </Form.Item>
                <Form.Item>
                  <SaleStatusFilter statusText={statusText} />
                </Form.Item>
              </Form>
            </h3>
            <div className="flex space-x-075">
              <div className="card-action ">
                <a
                  href="/admin/diamonds"
                  className="text-interactive "
                  onClick={(event) => {
                    event.preventDefault();
                    setStatusText("Status");
                    setSearchTerm("");
                    // Clear the URL parameters
                    const params = new URLSearchParams(location.search);
                    setQueryUrl(`/api/Order?` + params.toString());
                    // params.delete("type");
                    navigate({ search: params.toString() });
                  }}
                >
                  Clear filter
                </a>
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
                      {columnHeaders.map((header) => {
                        return (
                          <SaleColumnHeader
                            header={header}
                            setQueryUrl={setQueryUrl}
                            params={params}
                            type="order"
                          />
                        );
                      })}
                    </tr>
                  </thead>
                  {/* body */}
                  <tbody className="bg-white divide-y divide-gray-200">
                    {saleList?.isLoading && (
                      <tr>
                        <td colSpan={100}>
                          <Skeleton
                            active
                            paragraph={{
                              rows: 10,
                            }}
                            className="w-full"
                          />
                        </td>
                      </tr>
                    )}
                    {saleList?.data?.orders?.length > 0 ? (
                      saleList.data.orders.map(renderSaleRow)
                    ) : (
                      <tr>
                        <div className="text-center items-center">
                          There is no order
                        </div>
                      </tr>
                    )}
                  </tbody>
                </table>
                <div className="flex justify-center items-center px-8 py-4 bg-gray-100">
                  <Pagination
                    showTotal={(total, range) =>
                      `${range[0]}-${range[1]} of ${total} items`
                    }
                    current={Number(params.get("PageNumber")) || 1}
                    defaultCurrent={
                      (saleList?.data &&
                        saleList?.data.currentPage.toString()) ||
                      "1"
                    }
                    total={saleList?.data && saleList?.data.totalCount}
                    pageSize={Number(params.get("PageSize")) || 20}
                    onChange={(page, _pageSize) => {
                      params.set("PageNumber", page.toString());
                      params.set("PageSize", pageSize.toString());
                      navigate(url.pathname + "?" + params.toString());
                      setQueryUrl("/api/Order?" + params.toString());
                      setSearchTerm("");
                    }}
                    showSizeChanger={true}
                    onShowSizeChange={(current, size) => {
                      setPageSize(size);
                      params.set("PageSize", size.toString());
                      navigate(url.pathname + "?" + params.toString());
                      setQueryUrl("/api/Order?" + params.toString());
                    }}
                  />
                </div>
              </div>
            </div>
          </div>
        </div>
        {/* listing end */}
      </div>
    </div>
  );
}
