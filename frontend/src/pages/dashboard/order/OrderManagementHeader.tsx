import { Menu, Dropdown, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";

export const StatusMenu = ({
  handleStatusClick,
  statusText,
}: {
  handleStatusClick: any;
  statusText: any;
}) => (
  <Dropdown
    overlay={
      <Menu>
        <Menu.Item key="1">
          <a onClick={() => handleStatusClick("1", "Pending")}>Pending</a>
        </Menu.Item>
        <Menu.Item key="2">
          <a onClick={() => handleStatusClick("2", "Processing")}>Processing</a>
        </Menu.Item>
        <Menu.Item key="3">
          <a onClick={() => handleStatusClick("3", "Delivering")}>Delivering</a>
        </Menu.Item>
        <Menu.Item key="4">
          <a onClick={() => handleStatusClick("4", "Completed")}>Completed</a>
        </Menu.Item>
        <Menu.Item key="5">
          <a onClick={() => handleStatusClick("5", "Failed")}>Failed</a>
        </Menu.Item>
      </Menu>
    }
    placement="bottomCenter"
    trigger={["click"]}
  >
    <Button className="border p-2 rounded-md flex items-center">
      <span>{statusText}</span>
      <DownOutlined className="ml-1" />
    </Button>
  </Dropdown>
);
