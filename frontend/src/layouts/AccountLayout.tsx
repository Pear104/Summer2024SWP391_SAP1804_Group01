import { ShoppingOutlined, UserOutlined } from "@ant-design/icons";
import { Menu } from "antd";
import React from "react";
import { Outlet } from "react-router-dom";

export default function AccountLayout() {
  const onClick = (e: any) => {
    console.log("click ", e);
  };
  const items = [
    {
      key: "1",
      label: "Account Detail",
      icon: <UserOutlined />,
    },
    {
      key: "2",
      icon: <ShoppingOutlined />,
      label: "Order History",
    },
  ];
  return (
    <div className="py-10 px-6 flex">
      <Menu
        onClick={onClick}
        style={{
          width: 256,
        }}
        defaultSelectedKeys={["1"]}
        defaultOpenKeys={["sub1"]}
        mode="inline"
        items={items}
        className="border-r-0"
      />
      <div className="w-full min-h-[400px]">
        <div className="px-4">
          <Outlet />
        </div>
      </div>
    </div>
  );
}
