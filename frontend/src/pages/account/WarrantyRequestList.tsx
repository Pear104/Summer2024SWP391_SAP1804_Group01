import { useQueries } from "@tanstack/react-query";
import { Link } from "react-router-dom";
import { GET } from "../../utils/request";
import { formatPhoneNumber } from "../../utils/formatter";
import moment from "moment";
import { Empty } from "antd";
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
            <strong>Received Time:</strong>{" "}
            {moment(warrantyRequest.receiveTime).format("MM-DD-YYYY")}
          </div>
          <div className="text-sm">
            <strong>Return Time:</strong>{" "}
            {warrantyRequest.returnTime
              ? moment(warrantyRequest.returnTime).format("MM-DD-YYYY")
              : "Scheduling"}
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
  // const [messageApi, contextHolder] = message.useMessage();
  const [warrantyRequests] = useQueries({
    queries: [
      {
        queryKey: ["warrantyRequests"],
        queryFn: () => GET("/api/WarrantyRequests"),
        staleTime: 0,
      },
    ],
  });
  console.log(warrantyRequests?.data);
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
      <div className="flex justify-center">
        <Link
          to="/account/warranty/request"
          className="rounded-xl px-8 py-4 mt-4 text-white bg-primary font-bold uppercase"
        >
          Send a warranty request
        </Link>
      </div>
    </div>
  );
}
