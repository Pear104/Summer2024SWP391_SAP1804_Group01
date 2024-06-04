import { Form, Input, Pagination } from "antd";
import React, { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { GET } from "../../../utils/request";
import DiamondRow from "./DiamondRow";
import { useQueries } from "@tanstack/react-query";
import { useSearchStore } from "../../../store/searchStore";
import { getDiamondPrice } from "../../../utils/getPrice";
import { ProductTypeMenu, StatusMenu } from "./DiamondsManageHeader";

export default function ProductsManage() {
  const location = useLocation();
  const navigate = useNavigate();
  const [statusText, setStatusText] = useState("Status");
  const [productTypeText, setProductTypeText] = useState("Product Type");
  const [data, setData] = useState<any>([]);
  // sort item
  const [sortConfig, setSortConfig] = useState<{
    field: string;
    direction: "asc" | "desc" | "none";
    isNumber: boolean;
  }>({ field: "", direction: "none", isNumber: false });

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
  // search and filter
  const handleStatusClick = (status: string, statusText: string) => {
    setStatusText(statusText);
    const params = new URLSearchParams(location.search);
    params.set("status", status);
    navigate({ search: params.toString() });
  };

  const handleProductTypeClick = (type: string, typeText: string) => {
    setProductTypeText(typeText);
    const params = new URLSearchParams(location.search);
    params.set("type", type);
    navigate({ search: params.toString() });
  };

  useEffect(() => {
    const params = new URLSearchParams(location.search);
    const status = params.get("status");

    const type = params.get("type");
    if (status) {
      setStatusText(status === "1" ? "Enable" : "Disable");
    }
    if (type) {
      setProductTypeText(type === "1" ? "Type 1" : "Type 2");
    }
  }, [location.search]);

  const sortableColumns = [
    "price",
    "shape",
    "carat",
    "color",
    "clarity",
    "cut",
  ];
  // search item
  const [searchTerm, setSearchTerm] = useState("");
  // selected diamonds
  const [selectedDiamonds, setSelectedDiamonds] = useState<number[]>([]);
  // select all
  const [selectAll, setSelectAll] = useState(false);
  // pagination
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);
  const [pageSize, setPageSize] = useState(10);
  // many diamond action

  // get diamond price
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const [diamond, diamondPrice] = useQueries({
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
    ],
  });
  // fetch data
  useEffect(() => {
    (async () => {
      const data = await GET(
        `/api/Diamonds?PageNumber=${currentPage}&PageSize=${pageSize}`
      );
      console.log(data); // Log the data here
      setData(data);
      setTotalPages(data.totalPages);
    })();
  }, [currentPage, pageSize]);

  const handleSort = async (field: string) => {
    let direction: "asc" | "desc" | "none" = "asc";
    let isNumber = false;
    if (sortConfig.field === field && sortConfig.direction === "asc") {
      direction = "desc";
    } else if (sortConfig.field === field && sortConfig.direction === "desc") {
      direction = "none";
    }

    // Check if the field should be sorted as a number
    if (field === "price") {
      isNumber = true;
    }

    setSortConfig({ field, direction, isNumber });

    // Make a request to the API with the new sort configuration
    const queryUrl = `/api/Diamonds?SortBy=${field}&IsDescending=${
      direction === "desc"
    }&PageNumber=${currentPage}&PageSize=${pageSize}`;
    const data = await GET(queryUrl);
    setData(data);
  };

  const handleAction = (action: string) => {
    console.log(action);
  };
  //search item
  useEffect(() => {
    (async () => {
      let data;
      if (searchTerm) {
        // Fetch data based on searchTerm
        data = await GET(`/api/Diamonds/cert/${searchTerm}`);
      } else {
        // Fetch original data when searchTerm is empty
        data = await GET(
          `/api/Diamonds?PageNumber=${currentPage}&PageSize=${pageSize}`
        );
      }
      setData(data);
    })();
  }, [searchTerm, currentPage, pageSize]);

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
            <a href="/admin/products/new" className="button primary">
              <span>New Diamond</span>
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
                  href="/admin/products"
                  className="text-interactive "
                  onClick={(event) => {
                    event.preventDefault();
                    setStatusText("Status");
                    setProductTypeText("Product Type");
                    // Clear the URL parameters
                    const params = new URLSearchParams(location.search);
                    params.delete("status");
                    params.delete("type");
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
                              className="form-checkbox"
                              checked={selectAll}
                              onChange={(e) => {
                                setSelectAll(e.target.checked);
                                if (e.target.checked) {
                                  setSelectedDiamonds(
                                    data.diamonds.map(
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
                      {columnHeaders.map((header) => (
                        <th
                          key={header}
                          scope="col"
                          className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider "
                        >
                          <div className="flex flex-row items-center gap-[5px]">
                            <span>{header}</span>
                            {sortableColumns.includes(header.toLowerCase()) && (
                              <div className="sort">
                                <button
                                  type="button"
                                  onClick={() =>
                                    handleSort(header.toLowerCase())
                                  }
                                >
                                  <svg
                                    width="12"
                                    height="12"
                                    viewBox="0 0 17 23"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                  >
                                    <path
                                      d="M1 8.5L8.5 1L16 8.5"
                                      stroke={
                                        sortConfig.field ===
                                          header.toLowerCase() &&
                                        sortConfig.direction === "asc"
                                          ? "black"
                                          : "#e1e3e5"
                                      }
                                      strokeWidth="1.5"
                                      strokeLinecap="round"
                                      strokeLinejoin="round"
                                    />
                                    <path
                                      d="M16 14L8.5 21.5L1 14"
                                      stroke={
                                        sortConfig.field ===
                                          header.toLowerCase() &&
                                        sortConfig.direction === "desc"
                                          ? "black"
                                          : "#e1e3e5"
                                      }
                                      strokeWidth="1.5"
                                      strokeLinecap="round"
                                      strokeLinejoin="round"
                                    />
                                  </svg>
                                </button>
                              </div>
                            )}
                          </div>
                        </th>
                      ))}
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
                          </div>
                        </td>
                      </tr>
                    )}

                    {data && data.diamonds && diamondPrice?.data ? (
                      data.diamonds.map((diamond: any) => (
                        <DiamondRow
                          key={diamond.diamondId}
                          diamond={diamond}
                          selectedDiamonds={selectedDiamonds}
                          setSelectedDiamonds={setSelectedDiamonds}
                          price={getDiamondPrice(
                            diamond,
                            diamondPrice.data
                          ).toLocaleString("en-US", {
                            style: "currency",
                            currency: "USD",
                            maximumFractionDigits: 0,
                          })}
                        />
                      ))
                    ) : data ? (
                      <DiamondRow
                        key={data.diamondId}
                        diamond={data}
                        selectedDiamonds={selectedDiamonds}
                        setSelectedDiamonds={setSelectedDiamonds}
                        price={getDiamondPrice(
                          diamond,
                          diamondPrice.data
                        ).toLocaleString("en-US", {
                          style: "currency",
                          currency: "USD",
                          maximumFractionDigits: 0,
                        })}
                      />
                    ) : (
                      <div className="text-center items-center">
                        <p>There is no diamond</p>
                      </div>
                    )}
                  </tbody>
                </table>
                <div className="flex justify-center items-center px-8 py-4 bg-gray-100">
                  <Pagination
                    className="text-center"
                    current={currentPage}
                    total={totalPages * pageSize}
                    pageSize={pageSize}
                    onChange={(page) => {
                      setCurrentPage(page);
                      setSearchTerm(""); // Clear the search term when the page changes
                    }}
                    showSizeChanger={true}
                    onShowSizeChange={(current, size) => setPageSize(size)}
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
