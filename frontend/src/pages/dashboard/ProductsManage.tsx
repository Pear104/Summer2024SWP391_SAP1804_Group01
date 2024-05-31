import { DownOutlined } from "@ant-design/icons";
import { Button, Dropdown, Form, Input, Menu } from "antd";
import React from "react";

export default function ProductsManage() {
  const [statusText, setStatusText] = React.useState("Status");
  const [productTypeText, setProductTypeText] = React.useState("Product Type");

  const statusMenu = (
    <Menu>
      <Menu.Item key="1">
        <a
          href="/admin/products?status=1"
          onClick={() => setStatusText("Enable")}
        >
          Enable
        </a>
      </Menu.Item>
      <Menu.Item key="2">
        <a href="/disable" onClick={() => setStatusText("Disable")}>
          Disable
        </a>
      </Menu.Item>
    </Menu>
  );

  const productTypeMenu = (
    <Menu>
      <Menu.Item key="1">
        <a href="/type1" onClick={() => setProductTypeText("Type 1")}>
          Type 1
        </a>
      </Menu.Item>
      <Menu.Item key="2">
        <a href="/type2" onClick={() => setProductTypeText("Type 2")}>
          Type 2
        </a>
      </Menu.Item>
    </Menu>
  );
  return (
    <div className="p-4">
      <div className="flex justify-between items-center mt-6 mx-auto mb-8">
        <div className="flex justify-start scpace-x-1 items-center">
          <div className="self-center">
            <h1 className="text-2xl"> Products</h1>
          </div>
        </div>
        <div className="flex justify-end scpace-x-1 items-center">
          <button className="px-4 py-2 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75">
            <a href="/admin/products/new" className="button primary">
              <span>New Product</span>
            </a>
          </button>
        </div>
      </div>

      <div className="shadow bg-slate-200 border border-r-white">
        <div className="border-b-gray-200 p-[1rem] box-border">
          <div className="flex justify-between mb-1 items-center">
            <h3>
              <Form
                name="search_form"
                layout="inline"
                className="flex gap-2 items-center"
              >
                <Form.Item className="flex-grow">
                  <Input
                    type="text"
                    placeholder="Search"
                    id="keyword"
                    className="border p-2 rounded-md w-full"
                  />
                </Form.Item>
                <Form.Item>
                  <Dropdown
                    overlay={statusMenu}
                    placement="bottomCenter"
                    trigger={["click"]}
                  >
                    <Button className="border p-2 rounded-md flex items-center">
                      <span>{statusText}</span>
                      <DownOutlined className="ml-1" />
                    </Button>
                  </Dropdown>
                </Form.Item>
                <Form.Item>
                  <Dropdown
                    overlay={productTypeMenu}
                    placement="bottomCenter"
                    trigger={["click"]}
                  >
                    <Button className="border p-2 rounded-md flex items-center">
                      <span>{productTypeText}</span>
                      <DownOutlined className="ml-1" />
                    </Button>
                  </Dropdown>
                </Form.Item>
              </Form>
            </h3>
            <div className="flex space-x-075">
              <div className="card-action">
                <a href="#" className="text-interactive">
                  Clear filter
                </a>
              </div>
            </div>
          </div>
          <div className="pt-lg"></div>
        </div>
      </div>
    </div>
  );
}
