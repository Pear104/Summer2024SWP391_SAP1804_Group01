import { useState, useEffect } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../store/searchStore";
import { useQueries } from "@tanstack/react-query";
import { GET } from "../../../utils/request";
import CustomerRow from "./CustomerRow";
import { Empty, Form, Input, Pagination } from "antd";
import CustomerColumnHeader from "./componenets/CustomerColumnHeader";
import LoadingItem from "./componenets/LoadingItem";

function CustomerManage() {
  const [_selectedCustomers, setSelectedCustomers] = useState<number[]>([]);
  const getAllCustomerAPI: string = "/api/Accounts/Customer?";
  const location = useLocation();
  const [_statusText, setStatusText] = useState("Status");
  // const [productTypeText, setProductTypeText] = useState("Product Type");
  // sort item
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);

  const columnHeaders = [
    "Account Id",
    "Name",
    "Date of birth",
    "Gender",
    "Email",
    "Phone number",
    "Address",
    "Total order",
    "Reward point",
    "Rank",
  ];

  const navigate = useNavigate();

  //getting predefined variable from useSearchStore
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);

  const searchTerm = useSearchStore((state) => state.searchTerm);
  const setSearchTerm = useSearchStore((state) => state.setSearchTerm);

  //this useEffect will only run once. During mounting
  useEffect(() => {
    // params.delete("IsAvailability");
    // params.delete("IsDescending");
    // params.delete("SortBy");
    setQueryUrl(getAllCustomerAPI);
  }, []);

  // selected diamonds
  const [selectedCustomer, setSelectedCustomer] = useState<number[]>([]);

  // console.log("query url: " + queryUrl);

  //query data by calling api end-point
  const [customer] = useQueries({
    queries: [
      {
        queryKey: ["customer", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: Infinity,
      },
    ],
  });

  //check if {query return any data}? {get customers json from body} : {[]}
  const customersData = customer?.data?.content || [];
  console.log(customersData);
  const renderCustomerRow = (customer: any) => (
    <CustomerRow
      key={customer.accountId}
      account={customer}
      selectedAccount={selectedCustomer}
      setSelectedAccount={setSelectedCustomer}
    />
  );
  // const [selectAll, setSelectAll] = useState(false);
  // pagination, change page size
  const [pageSize, setPageSize] = useState(10);
  useEffect(() => {
    params.set("PageSize", pageSize.toString());
    navigate(url.pathname + "?" + params.toString());
    setQueryUrl(getAllCustomerAPI + params.toString());
  }, [pageSize]);

  // const handleAction = (action: string) => {
  //   if (action === "clear") {
  //     setSelectedCustomer([]);
  //     setSelectAll(false);
  //   }
  //   console.log(action);
  // };

  return (
    <>
      <div className="p-4">
        <div className="flex justify-between items-center mt-6 mx-auto mb-8">
          <div className="flex justify-start space-x-1 items-center">
            {" "}
            {/* start header */}
            <div className="self-center">
              <h1 className="text-2xl">Customer List</h1>
            </div>
          </div>
        </div>
        <div className="shadow bg-slate-50-200 border border-r-white">
          <div className="border-b-gray-200 p-[1rem] box-border">
            {" "}
            {/* start filter bar */}
            <div className="flex justify-between mb-1 items-center">
              {" "}
              {/* start filter */}
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
                        params.set("AccountName", e.target.value);
                        setQueryUrl(getAllCustomerAPI + params.toString());
                        navigate({ search: params.toString() });
                      }}
                    />
                  </Form.Item>
                  {/* <Form.Item>
                    <StatusMenu
                      handleStatusClick={handleStatusClick}
                      statusText={statusText}
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
                      params.delete("AccountName");
                      setQueryUrl(getAllCustomerAPI + params.toString());
                      // params.delete("type");
                      navigate({ search: params.toString() });
                    }}
                  >
                    Clear filter
                  </a>
                </div>
              </div>
            </div>{" "}
            {/* end filter */}
            <div className="pt-lg"></div>
          </div>{" "}
          {/* end filter bar */}
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
                            <CustomerColumnHeader
                              header={header}
                              setQueryUrl={setQueryUrl}
                              params={params}
                              type="customer"
                            />
                          );
                        })}
                      </tr>
                    </thead>
                    {/* body */}
                    {/* selected diamond pop up */}
                    <tbody className="bg-white divide-y divide-gray-200">
                      {customer?.isLoading &&
                        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((key) => (
                          <LoadingItem key={key} />
                        ))}
                      {customersData && customersData?.length > 0 ? (
                        customersData?.map(renderCustomerRow)
                      ) : (
                        <td colSpan={12} className="py-20 w-full">
                          <Empty description="There is no Customer" />
                        </td>
                      )}
                    </tbody>
                  </table>

                  <div className="flex justify-center items-center px-8 py-4 bg-gray-100">
                    {customer?.data && customer?.data?.content?.length > 0 && (
                      <Pagination
                        showTotal={(total, range) =>
                          `${range[0]}-${range[1]} of ${total} items`
                        }
                        current={Number(params.get("PageNumber")) || 1}
                        defaultCurrent={
                          (customer?.data &&
                            customer?.data.currentPage.toString()) ||
                          "1"
                        }
                        total={customer?.data && customer?.data.totalCount}
                        pageSize={Number(params.get("PageSize")) || 10}
                        onChange={(page, _pageSize) => {
                          params.set("PageNumber", page.toString());
                          params.set("PageSize", pageSize.toString());
                          navigate(url.pathname + "?" + params.toString());
                          setQueryUrl(getAllCustomerAPI + params.toString());
                          setSearchTerm("");
                        }}
                        showSizeChanger={true}
                        onShowSizeChange={(_current, size) => {
                          setPageSize(size);
                          params.set("PageSize", size.toString());
                          navigate(url.pathname + "?" + params.toString());
                          setQueryUrl(getAllCustomerAPI + params.toString());
                        }}
                      />
                    )}
                    {/* {!diamondsData?.isLoading && diamondsData?.length == 0 && (
                    <div className="text-center text-2xl">
                      There is no diamond
                    </div>
                  )} */}
                  </div>
                </div>
              </div>
            </div>
          </div>
          {/* listing end */}
        </div>
      </div>
    </>
  );
}

export default CustomerManage;
