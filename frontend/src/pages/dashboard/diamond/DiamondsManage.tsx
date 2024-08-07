import { Empty, Form, Input, Pagination } from "antd";
import { useEffect, useState } from "react";
import { useLocation, useNavigate, Link } from "react-router-dom";
import { GET } from "../../../utils/request";
import DiamondRow from "./DiamondRow";
import { useQueries } from "@tanstack/react-query";
import { useSearchStore } from "../../../store/searchStore";
import { getDiamondPrice } from "../../../utils/getPrice";
import { StatusMenu } from "./DiamondsManageHeader";
import DiamondColumnHeader from "./DiamondColumnHeader";
import LoadingItem from "./componenets/LoadingItem";

const columnHeaders = [
  "Thumbnail",
  "Certificate",
  "Price",
  "Shape",
  "Carat",
  "Color",
  "Clarity",
  "Cut",
  "Status",
];

export default function ProductsManage() {
  const location = useLocation();
  const [statusText, setStatusText] = useState("Status");
  const [_productTypeText, setProductTypeText] = useState("Product Type");
  // sort item
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);

  const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  const searchTerm = useSearchStore((state) => state.searchTerm);
  const setSearchTerm = useSearchStore((state) => state.setSearchTerm);
  console.log("query url: " + queryUrl);
  useEffect(() => {
    params.delete("IsAvailability");
    params.delete("IsDescending");
    params.delete("SortBy");
    setQueryUrl("/api/Diamonds?");
  }, []);

  const [diamond, diamondPrice, priceRate] = useQueries({
    queries: [
      {
        queryKey: ["diamond", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: 0,
      },
      {
        queryKey: ["diamondPrice"],
        queryFn: () => GET("/api/DiamondPrices/"),
        staleTime: 0,
      },
      // {
      //   queryKey: ["diamondSearch", searchTerm],
      //   queryFn: () => GET(`/api/Diamonds/cert/${searchTerm || ""}`),
      //   staleTime: Infinity,
      // },
      {
        queryKey: ["priceRate"],
        queryFn: () => GET("/api/PriceRate/latest"),
        staleTime: 0,
      },
    ],
  });

  const diamondsData = diamond?.data?.diamonds || [];
  const renderDiamondRow = (diamond: any) => (
    <DiamondRow
      key={diamond.diamondId}
      diamond={diamond}
      selectedDiamonds={selectedDiamonds}
      setSelectedDiamonds={setSelectedDiamonds}
      price={getDiamondPrice(
        diamond,
        diamondPrice?.data,
        priceRate?.data?.percent
      )}
    />
  );

  // search and filter
  const handleStatusClick = (status: string, statusText: string) => {
    setStatusText(statusText);
    params.set("IsAvailability", status == "1" ? "true" : "false");
    setQueryUrl(`/api/Diamonds?` + params.toString());
    navigate("/admin/diamonds?" + params.toString());
  };

  // const handleProductTypeClick = (type: string, typeText: string) => {
  //   setProductTypeText(typeText);
  //   params.set("IsAvailability", type == "Available" ? "true" : "false");
  //   navigate({ search: params.toString() });
  // };

  useEffect(() => {
    const params = new URLSearchParams(location.search);
    const status = params.get("status");

    const type = params.get("type");
    if (status) {
      setStatusText(status === "1" ? "Available" : "UnAvailable");
    }
    if (type) {
      setProductTypeText(type === "1" ? "Type 1" : "Type 2");
    }
  }, [location.search]);

  // selected diamonds
  const [selectedDiamonds, setSelectedDiamonds] = useState<number[]>([]);
  // select all
  const [_selectAll, setSelectAll] = useState(false);
  // pagination, change page size
  const [pageSize, setPageSize] = useState(10);
  useEffect(() => {
    params.set("PageSize", pageSize.toString());
    navigate(url.pathname + "?" + params.toString());
    setQueryUrl("/api/Diamonds?" + params.toString());
  }, [pageSize]);

  const handleAction = (action: string) => {
    if (action === "clear") {
      setSelectedDiamonds([]);
      setSelectAll(false);
    }
    console.log(action);
  };

  return (
    <div className="p-4">
      {/* header */}
      <div className="flex justify-between items-center mt-6 mx-auto mb-8">
        <div className="flex justify-start space-x-1 items-center">
          <div className="self-center">
            <h1 className="text-2xl"> Diamonds</h1>
          </div>
        </div>
        <div className="flex justify-end space-x-1 items-center">
          <button className="px-4 py-2 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
            <Link to="/admin/diamonds/new" className="button primary">
              <span>New Diamond</span>
            </Link>
          </button>
        </div>
      </div>

      <div className="shadow bg-slate-50-200 border border-r-white">
        {/* filter bar */}
        <div className="border-b-gray-200 p-[1rem] box-border">
          {/* filter */}
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
                    onChange={(e) => {
                      setSearchTerm(e.target.value);
                      params.set("SearchQuery", e.target.value);
                      setQueryUrl(`/api/Diamonds?` + params.toString());
                      navigate({ search: params.toString() });
                    }}
                  />
                </Form.Item>
                <Form.Item>
                  <StatusMenu
                    handleStatusClick={handleStatusClick}
                    statusText={statusText}
                  />
                </Form.Item>
                {/* <Form.Item>
                  <ProductTypeMenu
                    handleProductTypeClick={handleProductTypeClick}
                    productTypeText={productTypeText}
                  />
                </Form.Item> */}
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
                    // setProductTypeText("Product Type");
                    setSearchTerm("");
                    // Clear the URL parameters
                    const params = new URLSearchParams(location.search);
                    params.delete("IsAvailability");
                    params.delete("IsDescending");
                    params.delete("SortBy");
                    params.delete("SearchQuery");
                    setQueryUrl(`/api/Diamonds?` + params.toString());
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
                  <thead className="w-full bg-gray-50">
                    <tr className="">
                      {columnHeaders.map((header) => {
                        return (
                          <DiamondColumnHeader
                            header={header}
                            setQueryUrl={setQueryUrl}
                            params={params}
                            type="diamond"
                          />
                        );
                      })}
                    </tr>
                  </thead>
                  {/* body */}
                  {/* selected diamond pop up */}
                  <tbody className="bg-white divide-y divide-gray-200">
                    {selectedDiamonds.length > 0 && (
                      <tr>
                        <td colSpan={100} className="border-t-0">
                          <div className="inline-flex border border-gray-300 rounded justify-start">
                            <button
                              onClick={() => handleAction("selected")}
                              className="font-semibold py-1 px-2"
                            >
                              {selectedDiamonds.length} selected
                            </button>
                            <button
                              onClick={() => handleAction("disable")}
                              className="font-semibold py-1 px-2 border-l border-gray-300"
                            >
                              Disable
                            </button>
                            <button
                              onClick={() => handleAction("enable")}
                              className="font-semibold py-1 px-2 border-l border-gray-300"
                            >
                              Enable
                            </button>
                            {/* <button
                              onClick={() => handleAction("delete")}
                              className="font-semibold py-1 px-2 border-l border-gray-300"
                            >
                              Delete
                            </button> */}
                            <button
                              onClick={() => handleAction("clear")}
                              className="font-semibold py-1 px-2 border-l border-gray-300"
                            >
                              Clear
                            </button>
                          </div>
                        </td>
                      </tr>
                    )}
                    {diamond.isLoading &&
                      [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((key) => (
                        <LoadingItem key={key} />
                      ))}
                    {diamond?.data && diamondsData?.length == 0 && (
                      <td colSpan={12} className="py-20 w-full">
                        <Empty description="There is no diamond" />
                      </td>
                    )}
                    {diamondsData?.length > 0 &&
                      diamondsData?.map(renderDiamondRow)}
                  </tbody>
                </table>

                <div className="flex justify-center items-center px-8 py-4 bg-gray-100">
                  {diamond?.data && diamond?.data?.diamonds?.length > 0 && (
                    <Pagination
                      showTotal={(total, range) =>
                        `${range[0]}-${range[1]} of ${total} items`
                      }
                      current={Number(params.get("PageNumber")) || 1}
                      defaultCurrent={
                        (diamond?.data &&
                          diamond?.data.currentPage.toString()) ||
                        "1"
                      }
                      total={diamond?.data && diamond?.data.totalCount}
                      pageSize={Number(params.get("PageSize")) || 20}
                      onChange={(page, _pageSize) => {
                        params.set("PageNumber", page.toString());
                        params.set("PageSize", pageSize.toString());
                        navigate(url.pathname + "?" + params.toString());
                        setQueryUrl("/api/Diamonds?" + params.toString());
                        setSearchTerm("");
                      }}
                      showSizeChanger={true}
                      onShowSizeChange={(_current, size) => {
                        setPageSize(size);
                        params.set("PageSize", size.toString());
                        navigate(url.pathname + "?" + params.toString());
                        setQueryUrl("/api/Diamonds?" + params.toString());
                      }}
                    />
                  )}
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
