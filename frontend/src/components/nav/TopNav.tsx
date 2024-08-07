import {
  LineChart,
  Mail,
  MapPin,
  Phone,
  ShoppingCart,
  User,
  Menu,
} from "lucide-react";
import Logo from "../logo/Logo";
import { App } from "antd";
import SearchBar from "../SearchBar";
import { useState } from "react";
import { Link, useLocation, useNavigate } from "react-router-dom";
import { useCartStore } from "../../store/cartStore";
import { GET } from "../../utils/request";
import { jwtDecode } from "jwt-decode";
import { getCookie } from "../../utils/cookie";
import { useQueries } from "@tanstack/react-query";

const TopNavItem = ({
  children,
  href,
  setMenuDrop,
}: {
  children: React.ReactNode;
  href: string;
  setMenuDrop: any;
}) => {
  return (
    <Link
      className="mulish-regular flex gap-1 items-center py-1 px-3 border-b-2 border-b-transparent text-base hover:border-b-blue-500 duration-200 transition-all"
      to={href}
      onClick={() => {
        setMenuDrop(false);
      }}
    >
      {children}
    </Link>
  );
};

export default function TopNav() {
  // const isLoged = useSelector((state: any) => state.auth.isLoged);
  const cart = useCartStore((state) => state.cart);
  const cartItemCount = cart.length;
  const token = getCookie("accessToken") || "";
  let decode;
  if (!token) {
    console.error("Token is empty or cookie does not exist.");
  } else if (token.split(".").length !== 3) {
    console.error("Invalid token format: ", token);
  } else {
    try {
      decode = jwtDecode(token) as any;
    } catch (error: any) {
      console.error("Error decoding token: ", error.message);
    }
  }
  const [menuDrop, setMenuDrop] = useState(false);
  const { message } = App.useApp();
  const location = useLocation();
  const navigate = useNavigate();

  const [info] = useQueries({
    queries: [
      {
        queryKey: ["info", location],
        queryFn: () => GET("/api/Accounts/me"),
        staleTime: 0,
      },
    ],
  });
  return (
    <div className="top-0 left-0 relative gap-4 py-3 px-4 bg-white w-full shadow-lg h-full">
      <div className="flex justify-between md:hidden">
        <div className="flex justify-end gap-6 items-center">
          <div className="flex items-center gap-2">
            <MapPin size={20} absoluteStrokeWidth />
            <span className="mulish-regular font-bold text-base">
              District 9, Ho Chi Minh City
            </span>
          </div>
          <div className="flex items-center gap-2">
            <Phone size={20} strokeWidth={2} absoluteStrokeWidth />
            <span className="mulish-regular font-bold text-base">
              0123.456.789
            </span>
          </div>
          <div className="flex items-center gap-2">
            <Mail size={20} absoluteStrokeWidth />
            <span className="mulish-regular font-bold text-base">
              datj.company@gmail.com
            </span>
          </div>
        </div>
        <div className="flex justify-end gap-4 items-center">
          <div className="cursor-pointer">
            <SearchBar />
          </div>
          {decode && decode?.role != "Customer" && (
            <div
              className="cursor-pointer"
              onClick={async () => {
                const response = await GET("/api/Accounts/me");
                console.log(response);
                switch (response.role) {
                  case "Manager":
                    navigate("/admin");
                    break;
                  case "SaleStaff":
                    navigate("/admin/sale-staffs");
                    break;
                  case "DeliveryStaff":
                    navigate("/admin/delivery-staffs");
                    break;
                  case "Administrator":
                    navigate("/admin");
                    break;
                  case "WarrantyStaff":
                    navigate("/admin/warranty-request");
                    break;
                  default:
                    navigate("/");
                    break;
                }
              }}
            >
              <LineChart size={20} strokeWidth={2} absoluteStrokeWidth />
            </div>
          )}
          {/* <Heart size={20} strokeWidth={2} absoluteStrokeWidth /> */}
          <div className="relative">
            <Link to="/cart">
              <ShoppingCart size={20} strokeWidth={2} />
              {cartItemCount > 0 && (
                <span className="absolute -top-2 -right-2 bg-slate-500 text-white rounded-full h-4 w-4 flex items-center justify-center text-xs">
                  {cartItemCount}
                </span>
              )}
            </Link>
          </div>
          {info?.data && (
            <div className="text-lg font-semibold text-gray-800 pl-4 py-2">
              Welcome, {info?.data?.name}
            </div>
          )}
          <div
            className="cursor-pointer"
            onClick={async () => {
              const response = await GET("/api/Accounts/me");
              console.log(response);
              if (!response) {
                navigate("/authentication/login");
                message.info("You need to login!");
              } else {
                navigate("/account");
              }
            }}
          >
            <User size={20} absoluteStrokeWidth />
          </div>
        </div>
      </div>
      <div className="flex md:flex-col gap-4 mt-2">
        <div className="flex justify-between">
          <Menu
            className="hidden md:block"
            onClick={() => {
              setMenuDrop(!menuDrop);
            }}
          />
          <span className="md:hidden">
            <Logo />
          </span>
        </div>
        <span className={`flex ${menuDrop ? "md:block" : "md:hidden"}`}>
          <span className="hidden md:block ">
            <TopNavItem setMenuDrop={setMenuDrop} href="/">
              Home
            </TopNavItem>
          </span>
          <Link
            className="relative mulish-regular flex gap-1 items-center py-1 px-3 border-b-2 border-b-transparent text-base hover:border-b-blue-500 duration-200 transition-all"
            to={"/product/accessory"}
            onClick={() => {
              setMenuDrop(false);
            }}
          >
            Accessory
          </Link>
          <Link
            className="relative mulish-regular flex gap-1 items-center py-1 px-3 border-b-2 border-b-transparent text-base hover:border-b-blue-500 duration-200 transition-all"
            to={"/product/diamond"}
            onClick={() => {
              setMenuDrop(false);
            }}
          >
            Diamond
          </Link>
          <TopNavItem setMenuDrop={setMenuDrop} href="/promotions">
            Promotion
          </TopNavItem>
          <TopNavItem setMenuDrop={setMenuDrop} href="/blogs">
            Blog
          </TopNavItem>
          <TopNavItem setMenuDrop={setMenuDrop} href="/about">
            About us
          </TopNavItem>
          <TopNavItem setMenuDrop={setMenuDrop} href="/policies">
            Privacy Policy
          </TopNavItem>
          <span className="hidden md:block">
            <TopNavItem setMenuDrop={setMenuDrop} href="/account">
              Account
            </TopNavItem>
          </span>
        </span>
      </div>
    </div>
  );
}
