import React, { useState } from "react";
import { Button, Modal, Input, message, DatePicker } from "antd";
import { POST } from "../../../../utils/request";
import type { DatePickerProps, GetProps } from "antd";

const App: React.FC = () => {
  const [open, setOpen] = useState(false);
  const [confirmLoading, setConfirmLoading] = useState(false);
  const [discountPercent, setDiscountPercent] = useState(0);
  const [promotionName, setPromotionName] = useState("");
  const [promotionCode, setPromotionCode] = useState("");
  const [startDate, setStartDate] = useState<string>("");
  const [endDate, setEndDate] = useState<string>("");
  const [_errorMessages, setErrorMessages] = useState<string[]>([]);

  const { RangePicker } = DatePicker;
  type RangePickerProps = GetProps<typeof DatePicker.RangePicker>;
  const convertToISOFormat = (dateString: string): string => {
    const [datePart, timePart] = dateString.split(" ");
    const isoDateString = `${datePart}T${timePart}:00.000Z`;
    return isoDateString;
  };

  const showModal = () => {
    setOpen(true);
  };
  const onOk = (
    value: DatePickerProps["value"] | RangePickerProps["value"]
  ) => {
    console.log("onOk: ", value);
    setErrorMessages([]);
  };

  const handleOk = async () => {
    const errors: string[] = [];

    // Validate input fields
    if (!promotionName) {
      errors.push("Promotion Name is required.");
    } else if (promotionName.length > 100) {
      errors.push("Promotion Name must not exceed 100 characters.");
    }
    if (!promotionCode) {
      errors.push("Promotion Code is required.");
    } else if (promotionCode.length < 6 || promotionCode.length > 10) {
      errors.push("Promotion Code must be between 6 and 10 characters.");
    }
    if (discountPercent <= 0 || discountPercent >= 1) {
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
      if (start.getTime() < today.getTime()) {
        errors.push("Start date cannot be in the past.");
      }
      if (end.getTime() > maxEndDate.getTime()) {
        errors.push(
          "End date cannot be more than 5 years after the start date."
        );
      }
    }

    // Display errors if any
    if (errors.length > 0) {
      setErrorMessages(errors);
      for (let i = 0; i < errors.length; i++) {
        message.error(errors[i]);
      }
      return;
    }
    Modal.confirm({
      title: "Are you sure you want to create this promotion?",
      onOk: async () => {
        setConfirmLoading(true);
        try {
          const response = await POST("/api/Promotion?", {
            promotionName: promotionName,
            promotionCode: promotionCode,
            discountPercent: discountPercent,
            startTime: startDate,
            endTime: endDate,
          });
          console.log("API response:", response);
          window.location.reload();
          setOpen(false);
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

  const handleCancel = () => {
    setOpen(false);
  };

  return (
    <>
      <Button
        className="px-4 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75"
        type="primary"
        onClick={showModal}
      >
        Create Promotion
      </Button>
      <Modal
        title="Create New Promotion"
        visible={open}
        onOk={handleOk}
        confirmLoading={confirmLoading}
        onCancel={handleCancel}
      >
        <div>
          <div>
            Promotion Name:
            <Input
              type="string"
              value={promotionName}
              onChange={(e) => setPromotionName(e.target.value)}
              placeholder="Enter name"
            />
          </div>
          <div>
            Promotion Code:
            <Input
              type="string"
              value={promotionCode}
              onChange={(e) => setPromotionCode(e.target.value)}
              placeholder="Enter name"
            />
          </div>
          <div>
            Discount rate:
            <Input
              type="number"
              value={discountPercent}
              onChange={(e) => setDiscountPercent(Number(e.target.value))}
              placeholder="Enter percent"
              step="0.01"
            />
          </div>
          <div>
            Select time for this promotion:
            <RangePicker
              showTime={{ format: "HH:mm" }}
              format="YYYY-MM-DD HH:mm"
              onChange={(value, dateString) => {
                console.log("Selected Time: ", value);
                console.log("Formatted Selected Time: ", dateString);
                if (dateString && dateString.length === 2) {
                  setStartDate(convertToISOFormat(dateString[0]));
                  setEndDate(convertToISOFormat(dateString[1]));
                }
                console.log(startDate);
                console.log(endDate);
              }}
              onOk={onOk}
            />
          </div>
        </div>
      </Modal>
    </>
  );
};

export default App;
