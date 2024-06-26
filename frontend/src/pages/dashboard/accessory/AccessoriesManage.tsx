import { DownOutlined } from "@ant-design/icons";
import { Button, Dropdown, Form, Input, Menu, Pagination } from "antd";
import { useEffect, useState } from "react";
import { useLocation, useNavigate, Link } from "react-router-dom";
import { GET } from "../../../utils/request";
import AccessoryRow from "./AccessoryRow";
import { useQueries } from "@tanstack/react-query";
import { useSearchStore } from "../../../store/searchStore";
import { getAccessoryPrice } from "../../../utils/getPrice";
import LoadingItem from "./components/LoadingItem";

export default function AccessoriesManage() {
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const location = useLocation();
  const navigate = useNavigate();
  const [statusText, setStatusText] = useState("Status");
  const [productTypeText, setProductTypeText] = useState("Product Type");
  const [searchTerm, setSearchTerm] = useState("");
  const [selectedAccessories, setSelectedAccessories] = useState<number[]>([]);
  const [selectAll, setSelectAll] = useState(false);
  // many diamond action
  const handleAction = (action: string) => {
    console.log(action);
  };
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  useEffect(() => {
    setQueryUrl("/api/Accessories?");
  }, []);

  const [accessories, materialPrices, priceRate] = useQueries({
    queries: [
      {
        queryKey: ["accessories", queryUrl],
        queryFn: () => GET(queryUrl),
      },
      {
        queryKey: ["materialPrices"],
        queryFn: () => GET("/api/MaterialPrices/"),
        staleTime: 0,
      },
      {
        queryKey: ["priceRate"],
        queryFn: () => GET("/api/PriceRate/latest"),
        staleTime: 0,
      },
    ],
  });

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

  console.log(accessories.data);

  return (
    <div className="p-4">
      {/* header */}
      <div className="flex justify-between items-center mx-auto mb-8">
        <div className="flex justify-start space-x-1 items-center">
          <div className="self-center">
            <h1 className="text-2xl">Accessories</h1>
          </div>
        </div>
        <div className="flex justify-end space-x-1 items-center">
          <button className="px-4 py-2 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
            <Link to="/admin/accessories/detail" className="button primary">
              <span>New Accessory</span>
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
                    className="border p-2 rounded-md w-full"
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
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
                  <thead className="w-full bg-gray-50">
                    <tr className="w-full grid grid-cols-12">
                      <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
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
                                  setSelectedAccessories(
                                    accessories?.data.accessories.map(
                                      (accessory: any) => accessory.accessoryId
                                    )
                                  );
                                } else {
                                  setSelectedAccessories([]);
                                }
                              }}
                            />
                            <span className="checkbox-unchecked"></span>
                            <span className="pl-2"></span>
                            {/* <input type="hidden" value="0" /> */}
                          </label>
                        </div>
                      </th>
                      <th
                        scope="col"
                        className={`px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider col-span-1`}
                      >
                        Thumbnail
                      </th>
                      <th
                        scope="col"
                        className={`justify-center flex px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider col-span-4`}
                      >
                        Name
                      </th>
                      <th
                        scope="col"
                        className={`px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider col-span-1`}
                      >
                        Weight
                      </th>
                      <th
                        scope="col"
                        className={`flex justify-center px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider col-span-2`}
                      >
                        Price
                      </th>
                      <th
                        scope="col"
                        className={`px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider`}
                      >
                        Shape
                      </th>
                      <th
                        scope="col"
                        className={`px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider`}
                      >
                        Quantity
                      </th>
                      <th
                        scope="col"
                        className={`px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider col-span-1`}
                      >
                        Karat
                      </th>
                    </tr>
                  </thead>
                  {/* body */}
                  <tbody className="bg-white divide-y divide-gray-200">
                    {selectedAccessories.length > 0 && (
                      <tr>
                        <td colSpan={100} className="border-t-0">
                          <div className="inline-flex border border-gray-300 rounded justify-start">
                            <button
                              onClick={() => handleAction("selected")}
                              className="font-semibold py-1 px-2"
                            >
                              {selectedAccessories.length} selected
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
                    {accessories.isLoading && (
                      <>
                        {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((key) => (
                          <LoadingItem key={key} />
                        ))}
                      </>
                    )}
                    {accessories?.data?.accessories?.map(
                      (accessory: any, index: number) => (
                        <AccessoryRow
                          key={index}
                          accessory={accessory}
                          price={getAccessoryPrice(
                            accessory,
                            materialPrices?.data,
                            3,
                            priceRate?.data?.percent
                          )}
                          selectedAccessories={selectedAccessories}
                          setSelectedAccessories={setSelectedAccessories}
                        />
                      )
                    )}
                  </tbody>
                </table>
                <div className="flex justify-center items-center px-8 py-4 bg-gray-100">
                  {accessories?.data &&
                    accessories?.data?.accessories?.length != 0 && (
                      <Pagination
                        showTotal={(total, range) =>
                          `${range[0]}-${range[1]} of ${total} items`
                        }
                        className="text-center"
                        current={accessories.data.currentPage}
                        total={accessories.data.totalCount}
                        pageSize={accessories.data.pageSize}
                        onChange={(page) => {
                          setSearchTerm("");
                          params.set("PageNumber", page.toString());
                          navigate(url.pathname + "?" + params.toString());
                          setQueryUrl("/api/Accessories?" + params.toString());
                        }}
                        showSizeChanger={true}
                        // onShowSizeChange={(current, size) => setPageSize(size)}
                      />
                    )}
                  {!accessories?.isLoading &&
                    accessories?.data?.accessories?.length == 0 && (
                      <div className="text-center text-2xl">
                        No Accessories Found.
                      </div>
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
