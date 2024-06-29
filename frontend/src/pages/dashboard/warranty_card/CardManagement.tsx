import { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { Form, Input, Pagination, Empty } from "antd";
import { useSearchStore } from "../../../store/searchStore";
import { GET } from "../../../utils/request";
import { useQueries } from "@tanstack/react-query";
import WarrantyColumnHeader from "./components/WarrantyColumnHeader";
import LoadingItem from "./components/LoadingItem";
import CardRow from "./components/CardRow";

export default function CardManagement() {
  const location = useLocation();

  // sort item
  const columnHeaders = [
    "Warranty Card ID",
    "Customer",
    "Product",
    "Date of purchase",
    "Warranty period",
  ];

  const searchTerm = useSearchStore((state) => state.searchTerm);
  const setSearchTerm = useSearchStore((state) => state.setSearchTerm);
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  useEffect(() => {
    setQueryUrl("/api/WarrantyCards?");
  }, []);

  const [warrantyCardList] = useQueries({
    queries: [
      {
        queryKey: ["warrantyCard", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: 0,
      },
    ],
  });
  console.log(queryUrl);
  console.log(warrantyCardList?.data);

  const renderCardRow = (card: any) => (
    <CardRow key={card.warrantyCardId} card={card} />
  );

  // pagination, change page size
  const [pageSize, setPageSize] = useState(10);
  useEffect(() => {
    params.set("PageSize", pageSize.toString());
    navigate(url.pathname + "?" + params.toString());
    setQueryUrl("/api/WarrantyCards?" + params.toString());
  }, [pageSize]);

  return (
    <div className="p-4">
      {/* header */}
      <div className="flex justify-between items-center mt-6 mx-auto mb-8">
        <div className="flex justify-start space-x-1 items-center">
          <div className="self-center">
            <h1 className="text-2xl"> Warranty Card List </h1>
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
              </Form>
            </h3>
          </div>
          <div className="pt-lg"></div>
        </div>
        {/* listing items */}
        <div className="flex flex-col">
          <div className="my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
            <div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
              <div className="shadow overflow-hidden border-gray-200 sm:rounded-lg">
                <table className="min-w-full divide-y divide-gray-200">
                  {/* theader */}
                  <thead className="bg-gray-50">
                    <tr className="">
                      {columnHeaders.map((header) => {
                        return (
                          <WarrantyColumnHeader
                            header={header}
                            setQueryUrl={setQueryUrl}
                            params={params}
                            type="warranty-card"
                          />
                        );
                      })}
                    </tr>
                  </thead>
                  {/* body */}
                  <tbody className="bg-white divide-y divide-gray-200">
                    {warrantyCardList?.isLoading &&
                      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((key) => (
                        <LoadingItem key={key} />
                      ))}
                    {warrantyCardList?.data &&
                    warrantyCardList?.data?.warrantyCards?.length > 0 ? (
                      warrantyCardList?.data?.warrantyCards?.map(renderCardRow)
                    ) : (
                      <td colSpan={100} className="py-40 w-full">
                        <Empty description="No warranty request to process" />
                      </td>
                    )}
                  </tbody>
                </table>
                {warrantyCardList?.data?.warrantyRequests?.length > 0 && (
                  <div className="flex justify-center items-center px-8 py-4 bg-gray-100">
                    <Pagination
                      showTotal={(total, range) =>
                        `${range[0]}-${range[1]} of ${total} items`
                      }
                      current={Number(params.get("PageNumber")) || 1}
                      defaultCurrent={
                        (warrantyCardList?.data &&
                          warrantyCardList?.data.currentPage.toString()) ||
                        "1"
                      }
                      total={
                        warrantyCardList?.data &&
                        warrantyCardList?.data.totalCount
                      }
                      pageSize={Number(params.get("PageSize")) || 20}
                      onChange={(page, _pageSize) => {
                        params.set("PageNumber", page.toString());
                        params.set("PageSize", pageSize.toString());
                        navigate(url.pathname + "?" + params.toString());
                        setQueryUrl("/api/WarrantyCards?" + params.toString());
                        setSearchTerm("");
                      }}
                      showSizeChanger={true}
                      onShowSizeChange={(_current, size) => {
                        setPageSize(size);
                        params.set("PageSize", size.toString());
                        navigate(url.pathname + "?" + params.toString());
                        setQueryUrl("/api/WarrantyCards?" + params.toString());
                      }}
                    />
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>
        {/* listing end */}
      </div>
    </div>
  );
}
