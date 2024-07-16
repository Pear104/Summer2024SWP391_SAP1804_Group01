import {
  CircleUser,
  Gem,
  HandCoins,
  Sparkles,
  TicketPercent,
} from "lucide-react";
import { Link, useLocation, useNavigate } from "react-router-dom";
import classNames from "classnames";
import {
  HiOutlineCube,
  HiOutlineShoppingCart,
  HiOutlineUsers,
  HiOutlineDocumentText,
  HiCurrencyDollar,
} from "react-icons/hi";
import { BsCardText, BsTextParagraph } from "react-icons/bs";
import { LiaToolsSolid } from "react-icons/lia";
import { RiVipDiamondLine } from "react-icons/ri";
import { useQuery } from "@tanstack/react-query";
import { GET } from "../../../utils/request";
import React, { useState } from "react";
import type { MenuProps } from "antd";
import { Button, Menu } from "antd";

import {
  MenuFoldOutlined,
  MenuUnfoldOutlined,
  PieChartOutlined,
  TagOutlined,
} from "@ant-design/icons";
const linkClasses =
  "flex items-center gap-2 font-light px-3 py-2 md:hover:bg-neutral-100 md:hover:underline hover:bg-neutral-700 hover:no-underline active:bg-neutral-600 round-sm text-base";
type Role =
  | "Manager"
  | "SaleStaff"
  | "DeliveryStaff"
  | "Administrator"
  | "WarrantyStaff";
//chia task role
const ROLE_PERMISSIONS: Record<Role, string[]> = {
  Administrator: [
    "dashboard",
    "buying",
    "warranty",
    "product",
    "account",
    "price",
    "blog",
  ],
  Manager: [
    "dashboard",
    "buying",
    "warranty",
    "product",
    "account",
    "price",
    "blog",
  ],
  SaleStaff: ["salestaff"],
  DeliveryStaff: ["deliverystaff", "warranty-request"],
  WarrantyStaff: ["warranty-request"],
};

type MenuItem = Required<MenuProps>["items"][number];

export default function Sidebar() {
  const [collapsed, setCollapsed] = useState(false);

  //function to collapse the sidebar
  const toggleCollapsed = () => {
    setCollapsed(!collapsed);
  };
  const navigate = useNavigate();
  const { data: account } = useQuery({
    queryKey: ["account"],
    queryFn: () => GET("/api/Accounts/me"),
  });
  if (account?.role == "Customer") {
    navigate("/");
  }
  const userRole: Role = account?.role;

  const DASHBOARD_SIDEBAR_LINKS = [
    {
      key: "dashboard",
      label: "Dashboard",
      path: "/admin",
      icon: <PieChartOutlined />,
    },
    {
      key: "buying",
      label: "Buying",
      icon: <HiOutlineShoppingCart size={20} />,
      children: [
        {
          key: "orders",
          label: "Orders",
          path: "/admin/order",
          icon: <HiOutlineShoppingCart size={20} />,
        },
        {
          key: "transactions",
          label: "Transactions",
          path: "/admin/transactions",
          icon: <HiOutlineDocumentText />,
        },
      ],
    },
    {
      key: "orders",
      label: "Orders",
      path: "/admin/order",
      icon: <HiOutlineShoppingCart size={20} />,
    },
    {
      key: "transactions",
      label: "Transactions",
      path: "/admin/transactions",
      icon: <HiOutlineDocumentText />,
    },
    {
      key: "warranty",
      label: "Warranty",
      icon: <LiaToolsSolid />,
      children: [
        {
          key: "warranty-request",
          label: "Warranty Request",
          path: "/admin/warranty-request",
          icon: <BsCardText />,
        },
        {
          key: "warranty-card",
          label: "Warranty Card",
          path: "/admin/warranty-card",
          icon: <BsCardText />,
        },
      ],
    },
    {
      key: "warranty-request",
      label: "Warranty Request",
      path: "/admin/warranty-request",
      icon: <BsCardText />,
    },
    {
      key: "warranty-card",
      label: "Warranty Card",
      path: "/admin/warranty-card",
      icon: <BsCardText />,
    },
    {
      key: "product",
      label: "Products",
      icon: <HiOutlineCube />,
      children: [
        {
          key: "diamonds",
          label: "Diamonds",
          icon: <RiVipDiamondLine />,
          children: [
            {
              key: "products",
              label: "Diamonds",
              path: "/admin/diamonds",
              icon: <RiVipDiamondLine />,
            },
            {
              key: "diamond-price",
              label: "Diamond Price",
              path: "/admin/diamond-price",
              icon: <HiCurrencyDollar />,
            },
          ],
        },
        {
          key: "accessory",
          label: "Accessories",
          icon: <Sparkles size={15} />,
          children: [
            {
              key: "accessories",
              label: "Accessories",
              path: "/admin/accessories",
              icon: <Sparkles size={15} />,
            },
            {
              key: "accessory-price",
              label: "Accessory Price",
              path: "/admin/accessory-price",
              icon: <HiCurrencyDollar />,
            },
          ],
        },
      ],
    },
    {
      key: "products",
      label: "Diamonds",
      path: "/admin/diamonds",
      icon: <HiOutlineCube />,
    },
    {
      key: "accessories",
      label: "Accessories",
      path: "/admin/accessories",
      icon: <Sparkles size={20} />,
    },
    {
      key: "salestaff",
      label: "Sale Staffs",
      path: "/admin/sale-staffs",
      icon: <HiOutlineUsers />,
    },
    {
      key: "deliverystaff",
      label: "Delivery Order",
      path: "/admin/delivery-staffs",
      icon: <HiOutlineUsers />,
    },
    {
      key: "deliverywarrantystaff",
      label: "Delivery Warranty",
      path: "/admin/delivery-staffs-warranty",
      icon: <HiOutlineUsers />,
    },
    {
      key: "customers",
      label: "Customers",
      path: "/admin/customers",
      icon: <HiOutlineUsers />,
    },
    {
      key: "diamond-price",
      label: "Diamond Price",
      path: "/admin/diamond-price",
      icon: <HiCurrencyDollar />,
    },
    {
      key: "accessory-price",
      label: "Accessory Price",
      path: "/admin/accessory-price",
      icon: <HiCurrencyDollar />,
    },
    {
      key: "price",
      label: "Price",
      icon: <TagOutlined />,
      children: [
        {
          key: "price-rate",
          label: "Price Rate",
          path: "/admin/price-rate",
          icon: <HandCoins />,
        },
        {
          key: "promotion",
          label: "Promotion",
          path: "/admin/promotion",
          icon: <TicketPercent />,
        },
      ],
    },
    {
      key: "price-rate",
      label: "Price Rate",
      path: "/admin/price-rate",
      icon: <HandCoins />,
    },
    {
      key: "promotion",
      label: "Promotion",
      path: "/admin/promotion",
      icon: <TicketPercent />,
    },
    {
      key: "blog",
      label: "Blog",
      path: "/admin/blogs",
      icon: <BsTextParagraph />,
    },
    {
      key: "sales-report",
      label: "Sales staffs report",
      path: "/admin/sales-report",
      icon: <BsTextParagraph />,
    },
    {
      key: "delivery-report",
      label: "Delivery staffs report",
      path: "/admin/delivery-report",
      icon: <BsTextParagraph />,
    },
    {
      key: "potential-customer-report",
      label: "Potential customer",
      path: "/admin/potential-customer-report",
      icon: <BsTextParagraph />,
    },
    {
      key: "account",
      label: "Account",
      icon: <CircleUser size={20} />,
      children: [
        {
          key: "customers",
          label: "Customers",
          path: "/admin/customers",
          icon: <HiOutlineUsers />,
        },
        {
          key: "report",
          label: "Report",
          icon: <HiOutlineUsers />,
          children: [
            {
              key: "sales-report",
              label: "Sales staffs report",
              path: "/admin/sales-report",
              icon: <BsTextParagraph />,
            },
            {
              key: "delivery-report",
              label: "Delivery staffs report",
              path: "/admin/delivery-report",
              icon: <BsTextParagraph />,
            },
            {
              key: "potential-customer-report",
              label: "Potential customer",
              path: "/admin/potential-customer-report",
              icon: <BsTextParagraph />,
            },
          ],
        },
      ],
    },
  ];

  const filteredLinks = DASHBOARD_SIDEBAR_LINKS.filter((link) =>
    ROLE_PERMISSIONS[userRole]?.includes(link.key)
  );

  interface DashboardLink {
    key: string;
    label: string;
    path?: string;
    icon: React.ReactNode;
    children?: DashboardLink[];
  }

  const generateMenuItems = (links: DashboardLink[]): MenuItem[] => {
    return links.map((item) => {
      if (item.children) {
        return {
          key: item.key,
          icon: item.icon,
          label: item.label,
          children: generateMenuItems(item.children),
          // style: {backgroundColor: '#262626',
          // },
        };
      } else {
        return {
          key: item.key,
          icon: item.icon,
          label: <Link to={item.path!}>{item.label}</Link>,
          // style: {backgroundColor: '#262626',
          //},
        };
      }
    });
  };

  const items: MenuItem[] = generateMenuItems(filteredLinks);

  return (
    <>
      {/* Reponsive sidebar */}
      <div className="hidden sm:block">
        <div className="flex-1 flex flex-col gap-0.5">
          {filteredLinks.map((items) => (
            <SidebarLink key={items.key} items={items} />
          ))}
        </div>
      </div>
      {/* Sidebar */}
      <div
        className={`sm:hidden flex flex-col bg-neutral-800 h-auto text-white overflow-y-auto ${
          !collapsed ? "w-auto" : "w-[70px]"
        }`}
      >
        <Link
          to={"/"}
          className="flex justify-center items-center gap-2 py-3 px-3"
        >
          <Gem strokeWidth={1.75} width={15} />
          <div className="text-neutral-100 text-sm">DatJ</div>
        </Link>
        <div
          className={`text-blue-600 hover:text-blue-400 flex bg-neutral-800 transition-all duration-300 ${
            collapsed ? "justify-center" : "pl-7 justify-start"
          }`}
          onClick={toggleCollapsed}
        >
          {collapsed ? <MenuUnfoldOutlined /> : <MenuFoldOutlined />}
        </div>
        <Menu
          className={`bg-neutral-800 text-neutral-100 items-center ${
            !collapsed ? "w-[240px]" : "w-full"
          }`}
          mode="inline"
          theme="dark"
          inlineCollapsed={collapsed}
          items={items}
        />

        {/* Old sidebar */}
        {/* <div className="flex-1 py-8 flex flex-col gap-0.5">
          {filteredLinks.map((items) => (
            <SidebarLink key={items.key} items={items} />
          ))}
        </div> */}
        {/* {DASHBOARD_SIDEBAR_BOTTOM_LINKS.map((items) => (
          <SidebarLink key={items.key} items={items} />
          ))} */}

        {/* <div className="flex flex-col gap-0.5 pt-2 border-t border-neutral-700">
          <Link
            to="/"
            className={classNames(" text-red-500 cursor-pointer", linkClasses)}
          >
            <span className="text-xl">
              <HiOutlineLogout />
            </span>
            Logout
          </Link>
        </div> */}
      </div>
    </>
  );
}

function SidebarLink({ items }: { items: any }) {
  const { pathname } = useLocation();
  return (
    <Link
      to={items.path}
      className={classNames(
        pathname === items.path
          ? "text-amber-300 bg-neutral-700"
          : "text-white sm:text-black",
        linkClasses
      )}
    >
      <span className="text-xl">{items.icon}</span>
      {items.label}
    </Link>
  );
}
