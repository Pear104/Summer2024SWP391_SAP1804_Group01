import { DownOutlined } from "@ant-design/icons";
import { Button, Dropdown, Form, Input, Menu, Pagination } from "antd";
import React, { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { GET } from "../../../utils/request";
// interface Diamond {
//   diamondId: number;
//   imageUrl: string;
//   name: string;
//   price: number;
//   shape: string;
//   carat: number;
//   color: string;
//   clarity: string;
//   cut: string;
//   availability: boolean;
// }
export default function ProductsManage() {
  const location = useLocation();
  const navigate = useNavigate();
  const [statusText, setStatusText] = useState("Status");
  const [productTypeText, setProductTypeText] = useState("Product Type");
  const [data, setData] = useState<any>([]);
  // selected diamonds
  const [selectedDiamonds, setSelectedDiamonds] = useState<number[]>([]);
  // select all
  const [selectAll, setSelectAll] = useState(false);
  // pagination
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(0);
  const [pageSize, setPageSize] = useState(10);
  // many diamond action
  const handleAction = (action: string) => {
    // Handle your action here...
    console.log(action);
  };

  // useEffect(() => {
  //   (async () => {
  //     const data = await GET("/api/Diamonds");
  //     console.log(data); // Log the data here
  //     setData(data);
  //   })();
  // }, []);
  useEffect(() => {
    (async () => {
      const data = await GET(
        `/api/Diamonds?PageNumber=${currentPage}&PageSize=${pageSize}`
      );
      console.log(data); // Log the data here
      setData(data);
      // Assuming the API returns the total number of pages in data.totalPages
      setTotalPages(data.totalPages);
    })();
  }, [currentPage, pageSize]);

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
  const columnHeaders = [
    "Thumbnail",
    // "Name",
    "Price",
    "Shape",
    "Carat",
    "Color",
    "Clarity",
    "Cut",
    "Status",
  ];
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

  const productTypeMenu = (
    <Menu>
      <Menu.Item key="1">
        <a onClick={() => handleProductTypeClick("1", "Type 1")}>Type 1</a>
      </Menu.Item>
      <Menu.Item key="2">
        <a onClick={() => handleProductTypeClick("2", "Type 2")}>Type 2</a>
      </Menu.Item>
    </Menu>
  );

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
              <span>New Product</span>
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
                  />
                </Form.Item>
                <Form.Item>
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
                </Form.Item>
                <Form.Item>
                  <Dropdown
                    overlay={productTypeMenu}
                    placement="bottomCenter"
                    trigger={["click"]}
                  >
                    <Button className="border p-2 rounded-md flex items-center">
                      <span>{productTypeText}</span>
                      <DownOutlined className="ml-1" />
                    </Button>
                  </Dropdown>
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
                          className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                          {header}
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
                    {data.diamonds &&
                      data.diamonds.map((diamond: any) => {
                        return (
                          <tr key={diamond.diamondId}>
                            <td className="px-6 py-4 whitespace-nowrap">
                              <div className="flex items-center">
                                <label className="flex items-center">
                                  <input
                                    type="checkbox"
                                    value="0"
                                    className="form-checkbox"
                                    checked={selectedDiamonds.includes(
                                      diamond.diamondId
                                    )}
                                    onChange={(e) => {
                                      if (e.target.checked) {
                                        setSelectedDiamonds([
                                          ...selectedDiamonds,
                                          diamond.diamondId,
                                        ]);
                                      } else {
                                        setSelectedDiamonds(
                                          selectedDiamonds.filter(
                                            (id) => id !== diamond.diamondId
                                          )
                                        );
                                      }
                                    }}
                                  />

                                  <span className="checkbox-unchecked"></span>
                                  <span className="pl-2"></span>
                                  <input type="hidden" value="0" />
                                </label>
                              </div>
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap">
                              <div className="flex items-center">
                                <a href="#">
                                  <img
                                    className="h-14  w-14 square-full"
                                    src={diamond.imageUrl}
                                    alt=""
                                  />
                                </a>
                              </div>
                            </td>
                            {/* <td className="px-6 py-4 whitespace-nowrap">
                              <div className="text-sm text-gray-500">
                                <a href="/">{diamond.name}</a>Name
                              </div>
                            </td> */}
                            <td className="px-6 py-4 whitespace-nowrap">
                              <div className="text-sm text-gray-500">
                                {/* ${diamond.price} */} Price
                              </div>
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                              {diamond.shape}
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                              {diamond.carat}
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                              {diamond.color}
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                              {diamond.clarity}
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                              {diamond.cut}
                            </td>
                            <td className="px-6 py-4 whitespace-nowrap text-left text-sm font-medium">
                              <div className="text-indigo-600 hover:text-indigo-900">
                                {diamond.availability
                                  ? "Available"
                                  : "Not Available"}
                              </div>
                            </td>
                          </tr>
                        );
                      })}
                  </tbody>
                </table>
                <div className="flex justify-center items-center px-8 py-4 bg-gray-100">
                  <Pagination
                    className="text-center"
                    current={currentPage}
                    total={totalPages * pageSize}
                    pageSize={pageSize}
                    onChange={(page) => setCurrentPage(page)}
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
