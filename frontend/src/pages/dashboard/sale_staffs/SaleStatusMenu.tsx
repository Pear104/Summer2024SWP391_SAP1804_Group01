import { Dropdown, Menu, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";

export const SaleStatusMenu = ({
  handleStatusClick,
  statusText,
}: {
  handleStatusClick: any;
  statusText: any;
}) => (
  <Dropdown
    overlay={
      <Menu>
        <Menu.Item disabled={true} key="2">
          <a onClick={() => handleStatusClick("Processing")}>Processing</a>
        </Menu.Item>
        <Menu.Item disabled={statusText == "Processing" ? false : true} key="3">
          <a onClick={() => handleStatusClick("Delivering")}>Delivering</a>
        </Menu.Item>
        <Menu.Item disabled={statusText == "Delivering" ? false : true} key="4">
          <a onClick={() => handleStatusClick("Completed")}>Completed</a>
        </Menu.Item>
        <Menu.Item
          disabled={statusText == "Failed" || statusText == "Completed"}
          key="5"
        >
          <a onClick={() => handleStatusClick("Failed")}>Failed</a>
        </Menu.Item>
      </Menu>
    }
    placement="bottom"
    trigger={["click"]}
  >
    <Button className="border p-2 rounded-md flex items-center">
      <span>{statusText}</span>
      <DownOutlined className="ml-1" />
    </Button>
  </Dropdown>
);
