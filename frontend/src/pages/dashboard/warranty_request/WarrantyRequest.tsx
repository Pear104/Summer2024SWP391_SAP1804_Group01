import { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { Form, Input, Pagination, Skeleton } from "antd";
import { useSearchStore } from "../../../store/searchStore";
import { GET } from "../../../utils/request";
import { useQueries } from "@tanstack/react-query";
import { StatusFilter } from "./components/StatusFilter";
import WarrantyRow from "./components/WarrantyRow";
import WarrantyColumnHeader from "./components/WarrantyColumnHeader";

export default function WarrantyRequest() {
    const location = useLocation();
    const [statusText, setStatusText] = useState("Status");
    // sort item
  
    const columnHeaders = [
      "Warranty Request ID",
      "Warranty Card ID",
      "Reason",
      "Customer",
      "Shipping Address",
      "Phone Number",
      "Sale Staff",
      "Delivery Staff",
      "Status",
    ];
  
    const searchTerm = useSearchStore((state) => state.searchTerm);
    const setSearchTerm = useSearchStore((state) => state.setSearchTerm);
    const url = new URL(window.location.href);
    const params = new URLSearchParams(url.searchParams);
    const navigate = useNavigate();
    const queryUrl = useSearchStore((state) => state.queryUrl);
    const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
    useEffect(() => {
      setQueryUrl("/api/WarrantyRequests?");
    },[]);
  
    const [warrantyRequestList] = useQueries({
      queries: [
        {
          queryKey: ["warrantyRequests", queryUrl],
          queryFn: () => GET(queryUrl),
          staleTime: Infinity,
        },
      ],
    });
    console.log(queryUrl);
    console.log(warrantyRequestList?.data);
  
    const renderWarrantyRow = (warranty: any) => (
      <WarrantyRow key={warranty.warrantyRequestId} warranty={warranty} />
    );
  
    // search and filter
    useEffect(() => {
      const params = new URLSearchParams(location.search);
      const status = params.get("warrantyStatus");
  
      if (status) {
        setStatusText(
          status === "1"
            ? "Pending"
            : status === "2"
            ? "Processing"
            : status === "3"
            ? "Delivering"
            : status === "4"
            ? "Returning"
            : status === "5"
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
      setQueryUrl("/api/WarrantyRequests?" + params.toString());
    }, [pageSize]);
  
    return (
      <div className="p-4">
        {/* header */}
        <div className="flex justify-between items-center mt-6 mx-auto mb-8">
          <div className="flex justify-start space-x-1 items-center">
            <div className="self-center">
              <h1 className="text-2xl"> Warranty Request List</h1>
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
                    <StatusFilter statusText={statusText} />
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
                      setQueryUrl(`/api/WarrantyRequests?` + params.toString());
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
            <div className="my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
              <div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                <div className="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                  <table className="min-w-full divide-y divide-gray-200">
                    {/* theader */}
                    <thead className="bg-gray-50">
                      <tr>
                        {columnHeaders.map((header) => {
                          return (
                            <WarrantyColumnHeader
                              header={header}
                              setQueryUrl={setQueryUrl}
                              params={params}
                              type="warranty-request"
                            />
                          );
                        })}
                      </tr>
                    </thead>
                    {/* body */}
                    <tbody className="bg-white divide-y divide-gray-200">
                      {warrantyRequestList?.isLoading && (
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
                      {warrantyRequestList?.data?.warrantyRequests?.length > 0 ? (
                        warrantyRequestList?.data?.warrantyRequests?.map(renderWarrantyRow)
                      ) : (
                        <tr>
                          <div className="text-center items-center">
                            There is no warranty
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
                        (warrantyRequestList?.data &&
                            warrantyRequestList?.data.currentPage.toString()) ||
                        "1"
                      }
                      total={warrantyRequestList?.data && warrantyRequestList?.data.totalCount}
                      pageSize={Number(params.get("PageSize")) || 20}
                      onChange={(page, _pageSize) => {
                        params.set("PageNumber", page.toString());
                        params.set("PageSize", pageSize.toString());
                        navigate(url.pathname + "?" + params.toString());
                        setQueryUrl("/api/WarrantyRequest?" + params.toString());
                        setSearchTerm("");
                      }}
                      showSizeChanger={true}
                      onShowSizeChange={(current, size) => {
                        setPageSize(size);
                        params.set("PageSize", size.toString());
                        navigate(url.pathname + "?" + params.toString());
                        setQueryUrl("/api/WarrantyRequest?" + params.toString());
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
