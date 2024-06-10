import { Menu } from "antd";
import { Outlet, useNavigate } from "react-router-dom";
import {
  UserRoundCog,
  UserRound,
  ShoppingBasket,
  CircleUser,
  Wrench,
  LockKeyhole,
  ShieldAlert,
  ShieldCheck,
} from "lucide-react";

export default function AccountLayout() {
  const items = [
    {
      key: "account",
      label: "Account",
      icon: <CircleUser size={20} />,
      children: [
        {
          key: "/account",
          icon: <UserRound size={20} />,
          label: "Profile",
        },
        {
          key: "/account/edit",
          icon: <UserRoundCog size={20} />,
          label: "Update profile",
        },
        {
          key: "/account/order-history",
          icon: <ShoppingBasket size={20} />,
          label: "Order History",
          path: "/account/order-history",
        },
        {
          key: "/account/change-password",
          icon: <LockKeyhole size={20} />,
          label: "Change password",
          disabled: true,
        },
      ],
    },
    {
      key: "warranty",
      icon: <Wrench size={20} />,
      label: "Warranty",
      children: [
        {
          key: "/account/warranty/request",
          icon: <ShieldAlert size={20} />,
          label: "Request a Warranty",
        },
        {
          key: "/account/warranty",
          icon: <ShieldCheck size={20} />,
          label: "My warranty",
        },
      ],
    },
  ];
  const navigate = useNavigate();
  return (
    <div className="py-6 px-6 flex">
      <div>
        <div className="flex flex-col gap-2">
          <Menu
            onClick={(e: any) => {
              navigate(e.key);
            }}
            style={{
              width: 256,
            }}
            className="border-transparent"
            defaultSelectedKeys={["/account"]}
            defaultOpenKeys={["account", "warranty"]}
            mode="inline"
            items={items}
          />
        </div>
      </div>
      <div className="w-full min-h-[400px] bg-slate-100/60 mx-4 rounded-xl">
        <div className="px-4 ">
          <Outlet />
        </div>
      </div>
    </div>
  );
}
