import {
  HiOutlineViewGrid,
  HiOutlineCube,
  HiOutlineShoppingCart,
  HiOutlineUsers,
  HiOutlineDocumentText,
  HiOutlineQuestionMarkCircle,
  HiOutlineCog,
  HiCurrencyDollar,
} from "react-icons/hi";

export const DASHBOARD_SIDEBAR_LINKS = [
  {
    key: "dashboard",
    label: "Dashboard",
    path: "/admin",
    icon: <HiOutlineViewGrid />,
  },
  {
    key: "products",
    label: "Products",
    path: "/admin/products",
    icon: <HiOutlineCube />,
  },
  {
    key: "orders",
    label: "Orders",
    path: "/admin/orders",
    icon: <HiOutlineShoppingCart />,
  },
  {
    key: "customers",
    label: "Customers",
    path: "/admin/customers",
    icon: <HiOutlineUsers />,
  },
  {
    key: "transactions",
    label: "Transactions",
    path: "/admin/transactions",
    icon: <HiOutlineDocumentText />,
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
];

export const DASHBOARD_SIDEBAR_BOTTOM_LINKS = [
  {
    key: "settings",
    label: "Settings",
    path: "/admin/settings",
    icon: <HiOutlineCog />,
  },
  {
    key: "support",
    label: "Help & Support",
    path: "/admin/support",
    icon: <HiOutlineQuestionMarkCircle />,
  },
  //   {
  //     key: "logout",
  //     label: "Log out",
  //     path: "/admin/support",
  //     icon: <HiOutlineQuestionMarkCircle />,
  //   },
];
