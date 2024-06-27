import { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { Form, Input, Pagination, Skeleton, Empty } from "antd";
import { useSearchStore } from "../../../store/searchStore";
import { GET } from "../../../utils/request";
import { useQueries } from "@tanstack/react-query";
import PromotionRow from "./components/PromotionRow";
import PriceRateColumnHeader from "./components/PromotionColumnHeader";
import CreatePromotion from "./components/CreatePromotion";

export default function PriceRate() {
  const location = useLocation();
  const columnHeaders = ["Promotion ID", "Promotion Name", "Promotion Code" ,"Discount Rate", "Start Date", "End Date", "Duration"];
  const searchTerm = useSearchStore((state) => state.searchTerm);
  const setSearchTerm = useSearchStore((state) => state.setSearchTerm);
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  useEffect(() => {
    setQueryUrl("/api/Promotion?");
  }, []);

  const [promotionList] = useQueries({
    queries: [
      {
        queryKey: ["promotion", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: 0,
      },
    ],
  });
  console.log(queryUrl);
  console.log(promotionList?.data);
  console.log(promotionList?.data?.promotion?.length);


  const renderPromotionRow = (promotion: any) => (
    <PromotionRow key={promotion.promotionId} promotion={promotion} />
  );

  // pagination, change page size
  const [pageSize, setPageSize] = useState(10);
  useEffect(() => {
    params.set("PageSize", pageSize.toString());
    navigate(url.pathname + "?" + params.toString());
    setQueryUrl("/api/Promotion?" + params.toString());
  }, [pageSize]);
  return (
    <div className="p-4">
      {/* header */}
      <div className="flex justify-between items-center mt-6 mx-auto mb-8">
        <div className="flex justify-start space-x-1 items-center">
          <div className="self-center">
            <h1 className="text-2xl"> Promotion List </h1>
          </div>
        </div>
        <div className="flex justify-end space-x-1 items-center">   
              <CreatePromotion />
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
            <div className="flex space-x-075">
              <div className="card-action ">
                <a
                  href="/admin/price-rate"
                  className="text-interactive "
                  onClick={(event) => {
                    event.preventDefault();
                    setSearchTerm("");
                    // Clear the URL parameters
                    const params = new URLSearchParams(location.search);
                    setQueryUrl(`/api/Promotion?` + params.toString());
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
                    <tr className="">
                      {columnHeaders.map((header) => {
                        return (
                          <PriceRateColumnHeader
                            header={header}
                            setQueryUrl={setQueryUrl}
                            params={params}
                            type="price-rate"
                          />
                        );
                      })}
                    </tr>
                  </thead>
                  {/* body */}
                  <tbody className="bg-white divide-y divide-gray-200">
                    {promotionList?.isLoading && (
                      <td className="p-4" colSpan={100}>
                        <Skeleton
                          active
                          paragraph={{
                            rows: 20,
                          }}
                          className="w-full"
                        />
                      </td>
                    )}
                    {promotionList?.data &&
                      promotionList?.data?.promotion?.length > 0 ? (
                      promotionList?.data?.promotion?.map(renderPromotionRow)
                    ) : (
                      <td colSpan={100} className="py-20 w-full">
                        <Empty description="No Promotion Found" />
                      </td>
                    )}
                  </tbody>
                </table>
                {promotionList?.data?.promotion?.length > 0 && (
                  <div className="flex justify-center items-center px-8 py-4 bg-gray-100">
                    <Pagination
                      showTotal={(total, range) =>
                        `${range[0]}-${range[1]} of ${total} items`
                      }
                      current={Number(params.get("PageNumber")) || 1}
                      defaultCurrent={
                        (promotionList?.data &&
                          promotionList?.data.currentPage.toString()) ||
                        "1"
                      }
                      total={
                        promotionList?.data && promotionList?.data.totalCount
                      }
                      pageSize={Number(params.get("PageSize")) || 20}
                      onChange={(page, _pageSize) => {
                        params.set("PageNumber", page.toString());
                        params.set("PageSize", pageSize.toString());
                        navigate(url.pathname + "?" + params.toString());
                        setQueryUrl("/api/Promotion?" + params.toString());
                        setSearchTerm("");
                      }}
                      showSizeChanger={true}
                      onShowSizeChange={(_current, size) => {
                        setPageSize(size);
                        params.set("PageSize", size.toString());
                        navigate(url.pathname + "?" + params.toString());
                        setQueryUrl("/api/Promotion?" + params.toString());
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