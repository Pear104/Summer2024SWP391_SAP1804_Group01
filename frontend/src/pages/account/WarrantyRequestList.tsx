import { useQueries } from "@tanstack/react-query";
import { useNavigate } from "react-router-dom";
import { GET } from "../../utils/request";
import { formatPhoneNumber } from "../../utils/formatter";
import moment from "moment";
import { Empty, Pagination } from "antd";
import { useSearchStore } from "../../store/searchStore";
const WarrantyRequestItem = ({ warrantyRequest }: { warrantyRequest: any }) => {
  let statusStyle = "";
  switch (warrantyRequest.warrantyStatus) {
    case "Pending":
      statusStyle = "bg-yellow-100 border-yellow-400";
      break;
    case "Getting":
      statusStyle = "bg-blue-200/90";
      break;
    case "Processing":
      statusStyle = "bg-blue-400/90";
      break;
    case "Returning":
      statusStyle = "bg-blue-600/90";
      break;
    case "Failed":
      statusStyle = "bg-red-200/90";
      break;
    case "Completed":
      statusStyle = "bg-green-200/90";
      break;
  }

  return (
    <div
      className={`border-2 bg-slate-400-100 rounded-lg px-4 py-4 ${statusStyle}`}
    >
      <div className="flex flex-col gap-2">
        <div className="font-bold text-lg mb-2 col-span-4 flex items-center gap-2">
          Warranty Request{" "}
          <span className="text-xs">#{warrantyRequest.warrantyRequestId}</span>
        </div>
        <div className="text-sm">
          <strong>Product:</strong> {warrantyRequest.product}
        </div>
        <div className="text-sm">
          <strong>Reason:</strong> {warrantyRequest.warrantyReason}
        </div>
        <div className="text-sm">
          <strong>Phone Number:</strong>{" "}
          {formatPhoneNumber(warrantyRequest.phoneNumber)}
        </div>
        <div className="text-sm">
          <strong>Shipping Address:</strong> {warrantyRequest.shippingAddress}
        </div>
        <div className="grid grid-cols-3 gap-y-2">
          <div className="text-sm">
            <strong>Receive Date:</strong>{" "}
            {moment(warrantyRequest.receiveTime).format("MM-DD-YYYY")}
          </div>
          <div className="text-sm">
            <strong>Warranty Status:</strong> {warrantyRequest.warrantyStatus}
          </div>
        </div>
      </div>
    </div>
  );
};

export default function WarrantyRequestList() {
  const [warrantyRequests] = useQueries({
    queries: [
      {
        queryKey: ["warrantyRequests"],
        queryFn: () => GET("/api/WarrantyRequests"),
        staleTime: 0,
      },
    ],
  });
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  return (
    <div className="px-2 pt-4 pb-8">
      <div className="uppercase font-semibold text-xl mb-4">
        Warranty Requests
      </div>
      <div className="mt-2 grid gap-4">
        {warrantyRequests?.data &&
        warrantyRequests?.data?.warrantyRequests.length > 0 ? (
          warrantyRequests?.data?.warrantyRequests?.map(
            (warrantyRequest: any, index: any) => (
              <WarrantyRequestItem
                key={index}
                warrantyRequest={warrantyRequest}
              />
            )
          )
        ) : (
          <Empty description="You haven't send any warranty request yet" />
        )}
      </div>
      <div className="flex justify-center border-b items-center px-8 py-4 mt-4">
        {warrantyRequests?.data &&
          warrantyRequests?.data?.warrantyRequests?.length != 0 && (
            <Pagination
              showTotal={(total, range) =>
                `${range[0]}-${range[1]} of ${total} items`
              }
              className="text-center"
              current={warrantyRequests.data.currentPage}
              total={warrantyRequests.data.totalCount}
              pageSize={warrantyRequests.data.pageSize}
              onChange={(page) => {
                params.set("PageNumber", page.toString());
                navigate(url.pathname + "?" + params.toString());
                setQueryUrl("/api/WarrantyRequests?" + params.toString());
              }}
              // showSizeChanger={true}
              // onShowSizeChange={(current, size) => setPageSize(size)}
            />
          )}
      </div>
    </div>
  );
}
