import React from "react";
import { Menu, Dropdown, Button, Form, Input } from "antd";
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
          <a onClick={() => handleStatusClick("1", "Available")}>Available</a>
        </Menu.Item>
        <Menu.Item key="2">
          <a onClick={() => handleStatusClick("2", "UnAvailable")}>
            UnAvailable
          </a>
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

export const ProductTypeMenu = ({
  handleProductTypeClick,
  productTypeText,
}: {
  handleProductTypeClick: any;
  productTypeText: any;
}) => (
  <Dropdown
    overlay={
      <Menu>
        <Menu.Item key="1">
          <a onClick={() => handleProductTypeClick("1", "Type 1")}>Type 1</a>
        </Menu.Item>
        <Menu.Item key="2">
          <a onClick={() => handleProductTypeClick("2", "Type 2")}>Type 2</a>
        </Menu.Item>
      </Menu>
    }
    placement="bottomCenter"
    trigger={["click"]}
  >
    <Button className="border p-2 rounded-md flex items-center">
      <span>{productTypeText}</span>
      <DownOutlined className="ml-1" />
    </Button>
  </Dropdown>
);
