import { Form, Input, Pagination, Skeleton } from "antd";
import React, { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { GET } from "../../../utils/request";
import AccessoryRow from "./AccessoryRow";
import AccessoryColumnHeader from "./AccessoryColumnHeader";
import {
  ProductTypeMenu,
  StatusMenu,
} from "../accessory/AccessoryManageHeader";
import { useQueries } from "@tanstack/react-query";
import { useSearchStore } from "../../../store/searchStore";
import { getDiamondPrice } from "../../../utils/getPrice";

export default function AccessoryManage() {
  const location = useLocation();
  const [statusText, setStatusText] = useState("Status");
  const [productTypeText, setProductTypeText] = useState("Product Type");
  // sort item
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);

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

  const [diamond, diamondPrice, diamondSearch] = useQueries({
    queries: [
      {
        queryKey: ["diamonds", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: Infinity,
      },
      {
        queryKey: ["diamondPrices"],
        queryFn: () => GET("/api/DiamondPrices/"),
        staleTime: Infinity,
      },
      {
        queryKey: ["diamondSearch", searchTerm],
        queryFn: () => GET(`/api/Diamonds/cert/${searchTerm || ""}`),
        staleTime: Infinity,
      },
    ],
  });

  const renderAccessoryRow = (diamond: any) => (
    <AccessoryRow
      key={diamond.diamondId}
      diamond={diamond}
      selectedDiamonds={selectedDiamonds}
      setSelectedDiamonds={setSelectedDiamonds}
      price={getDiamondPrice(diamond, diamondPrice.data).toLocaleString(
        "en-US",
        {
          style: "currency",
          currency: "USD",
          maximumFractionDigits: 0,
        }
      )}
    />
  );

  const diamondsData = searchTerm
    ? diamondSearch.data
      ? [diamondSearch.data]
      : []
    : diamond?.data?.diamonds || [];
  // search and filter
  const handleStatusClick = (status: string, statusText: string) => {
    setStatusText(statusText);
    params.set("IsAvailability", status == "1" ? "true" : "false");
    setQueryUrl(`/api/Diamonds?` + params.toString());
    navigate("/admin/diamonds?" + params.toString());
  };

  const handleProductTypeClick = (type: string, typeText: string) => {
    setProductTypeText(typeText);
    params.set("IsAvailability", type == "Available" ? "true" : "false");
    navigate({ search: params.toString() });
  };

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
  const [selectAll, setSelectAll] = useState(false);
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
            <h1 className="text-2xl"> Accessorys</h1>
          </div>
        </div>
        <div className="flex justify-end space-x-1 items-center">
          <button className="px-4 py-2 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
            <a href="/admin/diamonds/new" className="button primary">
              <span>New Accessory</span>
            </a>
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
                    className="border p-2 rounded-md w-full"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                  />
                </Form.Item>
                <Form.Item>
                  <StatusMenu
                    handleStatusClick={handleStatusClick}
                    statusText={statusText}
                  />
                </Form.Item>
                <Form.Item>
                  <ProductTypeMenu
                    handleProductTypeClick={handleProductTypeClick}
                    productTypeText={productTypeText}
                  />
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
                    setProductTypeText("Product Type");
                    setSearchTerm("");
                    // Clear the URL parameters
                    const params = new URLSearchParams(location.search);
                    params.delete("IsAvailability");
                    params.delete("IsDescending");
                    params.delete("SortBy");
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
                  <thead className="bg-gray-50">
                    <tr>
                      <th
                        scope="col"
                        className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                      >
                        <div className="flex items-center">
                          <label className="flex items-center">
                            <input
                              type="checkbox"
                              value="0"
                              className="form-checkbox w-5 h-5"
                              checked={selectAll}
                              onChange={(e) => {
                                setSelectAll(e.target.checked);
                                if (e.target.checked) {
                                  setSelectedDiamonds(
                                    diamondsData.map(
                                      (diamond: any) => diamond.diamondId
                                    )
                                  );
                                } else {
                                  setSelectedDiamonds([]);
                                }
                              }}
                            />

                            <span className="checkbox-unchecked"></span>
                            <span className="pl-2"></span>
                            {/* <input type="hidden" value="0" /> */}
                          </label>
                        </div>
                      </th>
                      {columnHeaders.map((header) => {
                        return (
                          <AccessoryColumnHeader
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
                            <button
                              onClick={() => handleAction("delete")}
                              className="font-semibold py-1 px-2 border-l border-gray-300"
                            >
                              Delete
                            </button>
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
                    {(diamond?.isLoading || diamondPrice?.isLoading) && (
                      <Skeleton
                        active
                        paragraph={{
                          rows: 20,
                        }}
                      />
                    )}
                    {diamondsData.length > 0 ? (
                      diamondsData.map(renderAccessoryRow)
                    ) : (
                      <div className="text-center items-center">
                        <p>There is no diamond</p>
                      </div>
                    )}
                  </tbody>
                </table>
                <div className="flex justify-center items-center px-8 py-4 bg-gray-100">
                  {diamond?.data && diamond?.data.diamonds.length == 0 ? (
                    <div className="text-center text-2xl">
                      No Diamonds Found.
                    </div>
                  ) : (
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
                      onShowSizeChange={(current, size) => {
                        setPageSize(size);
                        params.set("PageSize", size.toString()); // Add this line
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
