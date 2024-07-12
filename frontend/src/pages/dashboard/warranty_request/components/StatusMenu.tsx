import { Dropdown, Menu, Button, Modal } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { jwtDecode } from "jwt-decode";
import { getCookie } from "../../../../utils/cookie";
import { useState } from "react";

export const StatusMenu = ({
  handleStatusClick,
  statusText,
}: {
  handleStatusClick: any;
  statusText: any;
}) => {
  const role = (jwtDecode(getCookie("accessToken") || "") as any)?.role;
  const [modalVisible, setModalVisible] = useState(false);
  const [targetStatus, setTargetStatus] = useState("");
  const [thisStatus, setThisStatus] = useState("");

  let style = "text-yellow bg-green-500";
  switch (statusText) {
    case "Pending":
      style = "text-white bg-yellow-500";
      break;
    case "Getting":
      style = "text-white bg-blue-500";
      break;
    case "Processing":
      style = "text-white bg-blue-600";
      break;
    case "Returning":
      style = "text-white bg-blue-800";
      break;
    case "Failed":
      style = "text-white bg-red-500";
      break;
    case "Completed":
      style = "text-white bg-green-500";
      break;
  }
  if (role == "Manager") {
    switch (statusText) {
      case "Pending":
        style = "text-yellow-500 font-bold";
        break;
      case "Getting":
        style = "text-blue-500 font-bold";
        break;
      case "Processing":
        style = "text-blue-600 font-bold";
        break;
      case "Returning":
        style = "text-blue-800 font-bold";
        break;
      case "Failed":
        style = "text-red-500 font-bold";
        break;
      case "Completed":
        style = "text-green-500 font-bold";
        break;
      default:
        break;
    }
  } 
  const handleStatusChange = (newStatus: string) => {
    setTargetStatus(newStatus);
    setThisStatus(statusText);
    setModalVisible(true);
  };
  const handleConfirmStatusChange = () => {
    handleStatusClick(targetStatus);
    setModalVisible(false);
  };
  const handleCancelStatusChange = () => {
    setModalVisible(false);
  };

  const isDisabled = (targetStatus: string) => {
    if (role === "Administrator") return false;
    if (statusText === "Failed" || statusText === "Completed") {
      return true;
    }

    if (role === "Manager") return true;

    switch (role) {
      case "DeliveryStaff":
        switch (statusText) {
          case "Pending":
            return targetStatus !== "Getting" && targetStatus !== "Failed";
          case "Getting":
            return targetStatus !== "Failed";
          case "Processing":
            return targetStatus !== "Returning";
          case "Returning":
            return (
              targetStatus === "Returning" ||
              targetStatus === "Pending" ||
              targetStatus === "Processing" ||
              targetStatus === "Getting" ||
              targetStatus === "Failed"
            );
          default:
            // For any other status, allow all changes except "Failed" and "Completed"
            return targetStatus !== "Failed" && targetStatus !== "Completed";
        }
      case "WarrantyStaff":
        return statusText !== "Getting" || targetStatus !== "Processing";
      default:
        return false;
    }
  };
  return (
    <>
      {role === "Manager" ? (
        <div className={`p-2 rounded-md flex items-center ${style}`}>
         {statusText}
        </div>
      ) : (
        <Dropdown
          overlay={
            <Menu>
              <Menu.Item key="2" disabled={isDisabled("Getting")}>
                <a onClick={() => handleStatusChange("Getting")}>Getting</a>
              </Menu.Item>

              <Menu.Item key="3" disabled={isDisabled("Processing")}>
                <a onClick={() => handleStatusChange("Processing")}>
                  Processing
                </a>
              </Menu.Item>

              <Menu.Item key="4" disabled={isDisabled("Returning")}>
                <a onClick={() => handleStatusChange("Returning")}>Returning</a>
              </Menu.Item>

              <Menu.Item key="5" disabled={isDisabled("Failed")}>
                <a onClick={() => handleStatusChange("Failed")}>Failed</a>
              </Menu.Item>

              <Menu.Item key="6" disabled={isDisabled("Completed")}>
                <a onClick={() => handleStatusChange("Completed")}>Completed</a>
              </Menu.Item>
            </Menu>
          }
          placement="bottom"
          trigger={["click"]}
        >
          <Button
            className={`border p-2 rounded-md flex items-center ${style}`}
          >
            <span>{statusText}</span>
            <DownOutlined className="ml-1" />
          </Button>
        </Dropdown>
      )}

      <Modal
        title={`Confirm Change from ${thisStatus} to ${targetStatus}`}
        visible={modalVisible}
        onOk={handleConfirmStatusChange}
        onCancel={handleCancelStatusChange}
      >
        <p>
          Are you sure you want to change the status from {thisStatus} to{" "}
          {targetStatus}?
        </p>
      </Modal>
    </>
  );
};
