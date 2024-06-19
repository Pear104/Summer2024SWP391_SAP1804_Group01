import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";

export const StatusMenu = ({
  handleStatusClick,
  statusText,
}: {
  handleStatusClick: any;
  statusText: any;
}) => {
  let style = "text-white bg-green-500";
  switch (statusText) {
    case "Pending":
      style = "text-white bg-red-500";
      break;
    case "Processing":
      style = "text-white bg-yellow-500";
      break;
    case "Confirmed":
      style = "text-white bg-pink-500";
      break;
    case "Delivering":
      style = "text-white bg-blue-500";
      break;
    case "Failed":
      style = "text-white bg-red-500";
      break;
    case "Completed":
      style = "text-white bg-green-500";
      break;
  }
  return (
    <Dropdown
      overlay={
        <Menu>
          <Menu.Item disabled={statusText == "Pending" ? false : true} key="2">
            <a onClick={() => handleStatusClick("Processing")}>Processing</a>
          </Menu.Item>
          <Menu.Item
            disabled={statusText == "Processing" ? false : true}
            key="3"
          >
            <a onClick={() => handleStatusClick("Confirmed")}>Confirmed</a>
          </Menu.Item>
          <Menu.Item
            disabled={statusText == "Confirmed" ? false : true}
            key="4"
          >
            <a onClick={() => handleStatusClick("Delivering")}>Delivering</a>
          </Menu.Item>
          <Menu.Item
            disabled={statusText == "Delivering" ? false : true}
            key="5"
          >
            <a onClick={() => handleStatusClick("Completed")}>Completed</a>
          </Menu.Item>
          <Menu.Item
            disabled={statusText == "Failed" || statusText == "Completed"}
            key="6"
          >
            <a onClick={() => handleStatusClick("Failed")}>Failed</a>
          </Menu.Item>
        </Menu>
      }
      placement="bottom"
      trigger={["click"]}
    >
      <Button className={`border p-2 rounded-md flex items-center ${style}`}>
        <span>{statusText}</span>
        <DownOutlined className="ml-1" />
      </Button>
    </Dropdown>
  );
};
