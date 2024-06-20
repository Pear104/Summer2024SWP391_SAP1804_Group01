import { Image } from "antd";
import { Check } from "lucide-react";
import { Link } from "react-router-dom";

const AccessoryItem = ({
  detail,
  percent,
  orderStatus,
  setIsModalOpen,
  setFeedbackInfo,
  orderId,
  form,
}: {
  detail: any;
  percent: any;
  orderStatus: any;
  setIsModalOpen: any;
  setFeedbackInfo: any;
  orderId: any;
  form: any;
}) => {
  return (
    <div className="flex text-lg">
      <Link
        className="w-1/5 flex aspect-square"
        to={`/product/accessory/detail/${detail?.accessory?.accessoryId}`}
      >
        {detail?.accessory != null
          ? detail.accessory?.accessoryImages[0]?.url && (
              <Image
                // style={{ objectFit: "contain" }}
                // object-cover full hinh bi cat, object-contain full hinh khong bi cat
                className="h-full object-cover aspect-square"
                src={detail?.accessory?.accessoryImages[0].url}
                alt="accessory"
              />
            )
          : ""}
      </Link>
      <div className="pl-4 flex flex-col gap-2 text-lg">
        <div className="font-bold">
          {detail.accessory != null ? detail.accessory?.name : ""}
        </div>
        {detail.accessory != null && (
          <div>Material weight: {detail.accessory?.materialWeight} g</div>
        )}
        {detail.accessory != null && (
          <div>Gold Karat: {detail.accessory?.karat}K</div>
        )}
        {detail?.accessory && (
          <div className="flex items-center gap-8">
            <div className="text-gray-800 font-bold">
              Price:{" "}
              {(
                ((detail?.accessory?.materialWeight + detail?.size - 3) *
                  detail?.materialPrice?.unitPrice +
                  detail?.accessory?.accessoryType?.processingPrice) *
                percent
              ).toLocaleString("en-US", {
                style: "currency",
                currency: "USD",
                maximumFractionDigits: 0,
              })}
            </div>
            {orderStatus != "Pending" && (
              <button
                className="bg-gray-200 text-gray-800 px-4 py-2 rounded mr-4 text-sm border border-black"
                onClick={() => {
                  form.resetFields();
                  form.setFieldValue(
                    "content",
                    detail?.feedback?.content || ""
                  );
                  setFeedbackInfo({
                    accessoryId: detail.accessory.accessoryId,
                    accessoryName: detail.accessory.name,
                    accessoryKarat: detail.accessory.karat,
                    orderId: orderId,
                    orderDetailId: detail?.orderDetailId,
                    score: detail?.feedback?.score || 5,
                    content: detail?.feedback?.content || "",
                  });
                  setIsModalOpen(true);
                }}
              >
                {detail?.feedback?.content ? (
                  <span className="flex gap-2">
                    Your feedback <Check />
                  </span>
                ) : (
                  "Send Feedback"
                )}
              </button>
            )}
          </div>
        )}
      </div>
    </div>
  );
};

export default AccessoryItem;
