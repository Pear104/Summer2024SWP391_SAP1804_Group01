import { CountdownComponent } from "./CountDownComponent";
import { useState } from "react";
import { Button, Modal, message, DatePicker, Input } from "antd";
import { PencilLine } from "lucide-react";
import { PUT } from "../../../../utils/request";
import type { DatePickerProps, GetProps } from "antd";
import dayjs from "dayjs";
function formatDateTime(dateString: string): string {
  const date = new Date(dateString);
  const day = String(date.getDate()).padStart(2, "0");
  const month = String(date.getMonth() + 1).padStart(2, "0"); // Tháng bắt đầu từ 0
  const year = date.getFullYear();
  return `${day}/${month}/${year}`;
}

export default function PromotionRow({ promotion }: { promotion: any }) {
  const [confirmLoading, setConfirmLoading] = useState(false);
  const [showPopup, setShowPopup] = useState(false); // State để điều khiển hiển thị popup
  const [discountPercent, setDiscountPercent] = useState(
    promotion.discountPercent
  );
  const [errorMessages, setErrorMessages] = useState<string[]>([]);
  type RangePickerProps = GetProps<typeof DatePicker.RangePicker>;
  const { RangePicker } = DatePicker;

  const start = new Date(promotion.startTime);
  const end = new Date(promotion.endTime);
  const now = new Date();
  const isExpired = end < now;
  const isOngoing = start <= now && end >= now;
  const durationMs = end.getTime() - start.getTime();
  const millisecondsInSecond = 1000;
  const millisecondsInMinute = millisecondsInSecond * 60;
  const millisecondsInHour = millisecondsInMinute * 60;
  const millisecondsInDay = millisecondsInHour * 24;

  const days = Math.floor(durationMs / millisecondsInDay);
  const hours = Math.floor(
    (durationMs % millisecondsInDay) / millisecondsInHour
  );
  const minutes = Math.floor(
    (durationMs % millisecondsInHour) / millisecondsInMinute
  );
  const seconds = Math.floor(
    (durationMs % millisecondsInMinute) / millisecondsInSecond
  );
  const duration = `${days}d ${hours}h ${minutes}m ${seconds}s`;
  const convertToISOFormat = (dateString: any): string => {
    const [datePart, timePart] = dateString.split(" ");
    const isoDateString = `${datePart}T${timePart}:00.000Z`;
    return isoDateString;
  };
  const convertFromISOFormat = (isoDateString: string): string => {
    const date = new Date(isoDateString);
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    const hours = String(date.getHours()).padStart(2, "0");
    const minutes = String(date.getMinutes()).padStart(2, "0");
    return `${year}-${month}-${day} ${hours}:${minutes}`;
  };
  const [startDate, setStartDate] = useState<string>(
    convertFromISOFormat(promotion.startTime)
  );
  const [endDate, setEndDate] = useState<string>(
    convertFromISOFormat(promotion.endTime)
  );
  const handleButtonClick = () => {
    if (isExpired) {
      message.error("Cannot update an expired promotion.");
      return;
    }
    setShowPopup(true); // Mở popup
  };
  const onOk = (
    value: DatePickerProps["value"] | RangePickerProps["value"]
  ) => {
    console.log("onOk: ", value);
    setErrorMessages([]);
  };
  const handlePopupClose = () => {
    setShowPopup(false); // Đóng popup
  };
  const handleOk = async () => {
    const errors: string[] = [];

    if (discountPercent <= 0 || discountPercent >= 1) {
      errors.push("Discount rate must be greater than 0 and less than 1.");
    }
    if (!isOngoing && (discountPercent <= 0 || discountPercent >= 1)) {
      errors.push("Discount rate must be greater than 0 and less than 1.");
    }
    if (!startDate || !endDate) {
      errors.push("Please select start and end dates for the promotion.");
    } else {
      const start = new Date(startDate);
      const end = new Date(endDate);
      const today = new Date();
      const maxEndDate = new Date(start);
      maxEndDate.setFullYear(start.getFullYear() + 5);

      if (!isOngoing && start.getTime() < today.getTime()) {
        errors.push("Start date cannot be in the past.");
      }

      if (end.getTime() > maxEndDate.getTime()) {
        errors.push("End date cannot be more than 5 years after the start date.");
      }
    }


    // Display errors if any
    if (errors.length > 0) {
      setErrorMessages(errors);
      console.log(errorMessages)
      for (let i = 0; i < errors.length; i++) {
        message.error(errors[i]);
      }
      return;
    }

    Modal.confirm({
      title: "Are you sure you want to update this promotion?",
      onOk: async () => {
        setConfirmLoading(true);
        try {
          const response = await PUT(
            `/api/Promotion/${promotion.promotionCode}`,
            {
              discountPercent: discountPercent,
              startTime: startDate,
              endTime: endDate,
            }
          );
          console.log("API response:", response);
          window.location.reload();
          setShowPopup(false);
        } catch (error) {
          console.error("API error:", error);
          message.error("Failed to create promotion.");
        } finally {
          setConfirmLoading(false);
        }
      },
      onCancel: () => {
        console.log("Action canceled");
      },
    });

  };


  return (
    <>
      <tr key={promotion.promotionId} className="">
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="flex items-center">
            {"#"}
            {promotion.promotionId}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{promotion.promotionName}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{promotion.promotionCode}</div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {promotion.discountPercent}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {formatDateTime(promotion.startTime)}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">
            {formatDateTime(promotion.endTime)}
          </div>
        </td>
        <td className="px-6 py-4 whitespace-nowrap">
          <div className="text-sm text-gray-500">{duration}</div>
        </td>
        <td className="px-4 py-0 whitespace-nowrap mb-2">
          <CountdownComponent
            startTime={promotion.startTime}
            endTime={promotion.endTime}
          />
        </td>
        <td className="px-4 py-0 whitespace-nowrap mb-2">
          <Button
            className="items-center justify-center"
            onClick={handleButtonClick}
          >
            <PencilLine className="items-center w-4 h-5" />
          </Button>
        </td>
      </tr>

      <Modal
        title="Update Promotion"
        visible={showPopup}
        onOk={handleOk}
        onCancel={handlePopupClose}
        confirmLoading={confirmLoading}
      >
        <div>
          <div>
            Update discount rate:
            <Input
              type="number"
              value={discountPercent}
              defaultValue={Number(promotion.discountPercent)}
              onChange={(e) => setDiscountPercent(Number(e.target.value))}
              min="0"
              max="1"
              step="0.01"
              placeholder="Enter discount rate"
            />
          </div>
          <div>
            {isOngoing ? (
              <div>
                Update end time for this promotion:
                <DatePicker
                  showTime={{ format: "HH:mm" }}
                  format="YYYY-MM-DD HH:mm"
                  defaultValue={dayjs(promotion.endTime)}
                  onChange={(value, dateString) => {
                    console.log("Selected Time: ", value);
                    console.log("Formatted Selected Time: ", dateString);
                    setEndDate(convertToISOFormat(dateString));
                  }}
                  onOk={onOk}
                />
              </div>
            ) : (
              <div>
                Update time for this promotion:
                <RangePicker
                  showTime={{ format: "HH:mm" }}
                  format="YYYY-MM-DD HH:mm"
                  defaultValue={[
                    dayjs(promotion.startTime),
                    dayjs(promotion.endTime),
                  ]}
                  onChange={(value, dateString) => {
                    console.log("Selected Time: ", value);
                    console.log("Formatted Selected Time: ", dateString);
                    if (dateString && dateString.length === 2) {
                      setStartDate(convertToISOFormat(dateString[0]));
                      setEndDate(convertToISOFormat(dateString[1]));
                    }
                  }}
                  onOk={onOk}
                />
              </div>
            )}
          </div>
        </div>
      </Modal>
    </>
  );
}
