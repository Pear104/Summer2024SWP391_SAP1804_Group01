import {
  ChevronDown,
  FlaskConical,
  Heart,
  LineChart,
  Mail,
  MapPin,
  Phone,
  ShoppingCart,
  User,
} from "lucide-react";
import Logo from "../logo/Logo";
import SearchBar from "../SearchBar";
import { useState } from "react";
import JewelryItem from "./components/JewelryItem";
import DiamondItem from "./components/DiamondItem";
import { getCookie } from "../../utils/cookie";
import { Link } from "react-router-dom";

const TopNavItem = ({
  children,
  href,
}: {
  children: React.ReactNode;
  href: string;
}) => {
  return (
    <Link
      className="mulish-regular flex gap-1 items-center py-1 px-3 border-b-2 border-b-transparent text-base hover:border-b-blue-500 duration-200 transition-all"
      to={href}
    >
      {children}
    </Link>
  );
};

export default function TopNav() {
  // const isLoged = useSelector((state: any) => state.auth.isLoged);
  const [jewelryDrop, setJewelryDrop] = useState(false);
  const [diamondDrop, setDiamondDrop] = useState(false);
  return (
    <div className="top-0 left-0 relative gap-4 py-3 px-4 bg-white w-full shadow-lg">
      <div className="flex justify-between">
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
          <SearchBar />
          <Link to="/test">
            <FlaskConical size={20} strokeWidth={2} absoluteStrokeWidth />
          </Link>
          <Link to="/admin">
            <LineChart size={20} strokeWidth={2} absoluteStrokeWidth />
          </Link>
          <Heart size={20} strokeWidth={2} absoluteStrokeWidth />
          <Link to="/cart">
            <ShoppingCart size={20} strokeWidth={2} />
          </Link>
          <Link
            to={
              !getCookie("accessToken") ? "/authentication/login" : "/account"
            }
          >
            <User size={20} absoluteStrokeWidth />
          </Link>
        </div>
      </div>
      <div className="flex gap-4 mt-2">
        <div className="flex justify-center">
          <Logo />
        </div>
        <a
          className="relative mulish-regular flex gap-1 items-center py-1 px-3 border-b-2 border-b-transparent text-base hover:border-b-blue-500 duration-200 transition-all"
          href={"/product/accessory"}
          onMouseEnter={() => {
            setJewelryDrop(true);
          }}
          onMouseLeave={() => {
            setJewelryDrop(false);
          }}
        >
          Accessory <ChevronDown size={16} />
          {jewelryDrop && (
            <div className="absolute z-50 w-[100vw] mx-auto top-[36px] -left-[184px] right-0 bg-white">
              <div className="mt-4"></div>
              <div className="grid grid-cols-3 px-4 pb-4">
                <JewelryItem />
                <JewelryItem />
                <JewelryItem />
                <JewelryItem />
                <JewelryItem />
                <div
                  className="bg-contain bg-no-repeat h-[200px]"
                  style={{
                    backgroundImage: "url(/images/Reserve_1000x.webp)",
                  }}
                ></div>
              </div>
            </div>
          )}
        </a>
        <a
          className="relative mulish-regular flex gap-1 items-center py-1 px-3 border-b-2 border-b-transparent text-base hover:border-b-blue-500 duration-200 transition-all"
          href={"/product/diamond"}
          onMouseEnter={() => {
            setDiamondDrop(true);
          }}
          onMouseLeave={() => {
            setDiamondDrop(false);
          }}
        >
          Diamond <ChevronDown size={16} />
          {diamondDrop && (
            <div className="z-50 w-[100vw] absolute mx-auto top-[36px] -left-[326px] right-0 bg-white">
              <div className="mt-4"></div>
              <div className="flex gap-4">
                <DiamondItem />
                <div
                  className="aspect-[2/1] bg-contain bg-no-repeat h-[240px]"
                  style={{
                    backgroundImage: "url(/images/diamond_desktop.jpg)",
                  }}
                ></div>
              </div>
            </div>
          )}
        </a>
        <TopNavItem href="/blog">Blog</TopNavItem>
        <TopNavItem href="/about">About us</TopNavItem>
      </div>
      {(jewelryDrop || diamondDrop) && (
        <div className="z-10 fixed left-0 right-0 h-[100vh] w-[100vw] bg-black bg-opacity-30"></div>
      )}
    </div>
  );
}
