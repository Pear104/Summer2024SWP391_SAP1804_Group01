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
  return (
    <Dropdown
      // disabled={
      //   (jwtDecode(getCookie("accessToken") || "") as any)?.role == "Manager"
      // }
      overlay={
        <Menu>
          <Menu.Item key="2" disabled={statusText != "Pending"}>
            <a onClick={() => handleStatusClick("Getting")}>Getting</a>
          </Menu.Item>

          <Menu.Item key="3" disabled={statusText != "Getting"}>
            <a onClick={() => handleStatusClick("Processing")}>Processing</a>
          </Menu.Item>
          <Menu.Item key="4" disabled={statusText != "Processing"}>
            <a onClick={() => handleStatusClick("Returning")}>Returning</a>
          </Menu.Item>

          <Menu.Item
            key="5"
            disabled={statusText == "Completed" || statusText == "Failed"}
          >
            <a onClick={() => handleStatusClick("Failed")}>Failed</a>
          </Menu.Item>
          <Menu.Item
            disabled={statusText != "Returning" || statusText == "Completed"}
            key="6"
          >
            <a onClick={() => handleStatusClick("Completed")}>Completed</a>
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
