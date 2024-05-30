import { ShoppingOutlined, UserOutlined } from "@ant-design/icons";
import { Menu } from "antd";
import { Outlet } from "react-router-dom";
import { setCookie } from "../utils/cookie";

export default function AccountLayout() {
  const onClick = (e: any) => {
    location.href = e.item.props.path;
  };
  const items = [
    {
      key: "1",
      label: "Account Detail",
      icon: <UserOutlined />,
      path: "/account",
    },
    {
      key: "2",
      icon: <ShoppingOutlined />,
      label: "Order History",
      path: "/account/order-history",
    },
  ];

  return (
    <div className="py-10 px-6 flex">
      <div>
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
        <div
          className="mt-14 w-full flex justify-center text-lg text-white cursor-pointer bg-black rounded-md py-2 hover:bg-black/80 transition-all duration-200"
          onClick={() => {
            setCookie("accessToken", "", 0);
            location.href = "/authentication/login";
          }}
        >
          Logout
        </div>
      </div>
      <div className="w-full min-h-[400px]">
        <div className="px-4">
          <Outlet />
        </div>
      </div>
    </div>
  );
}
