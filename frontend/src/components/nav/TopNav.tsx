import {
  ChevronDown,
  Heart,
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

const TopNavItem = ({
  children,
  href,
}: {
  children: React.ReactNode;
  href: string;
}) => {
  return (
    <a
      className="mulish-regular flex gap-1 items-center py-1 px-3 border-b-2 border-b-transparent text-base hover:border-b-blue-500 duration-200 transition-all"
      href={href}
    >
      {children}
    </a>
  );
};

export default function TopNav() {
  // const isLoged = useSelector((state: any) => state.auth.isLoged);
  const [jewelryDrop, setJewelryDrop] = useState(false);
  const [diamondDrop, setDiamondDrop] = useState(false);
  return (
    <div className="top-0 left-0 fixed gap-4 py-3 px-4 bg-white w-full shadow-2xl">
      <div className="flex justify-between">
        <div className="flex justify-end gap-4 items-center">
          <div className="flex items-center gap-2">
            <MapPin size={20} absoluteStrokeWidth />
            <span className="mulish-regular font-bold text-base">
              DS chi nhánh
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
          <Heart size={20} strokeWidth={2} absoluteStrokeWidth />
          <ShoppingCart size={20} strokeWidth={2} />
          <User size={20} absoluteStrokeWidth />
        </div>
      </div>
      <div className="flex gap-4 mt-2">
        <div className="flex justify-center">
          <Logo />
        </div>
        <a
          className="relative mulish-regular flex gap-1 items-center py-1 px-3 border-b-2 border-b-transparent text-base hover:border-b-blue-500 duration-200 transition-all"
          href={"/jewelry"}
          onMouseEnter={() => {
            setJewelryDrop(true);
          }}
          onMouseLeave={() => {
            setJewelryDrop(false);
          }}
        >
          Jewelry <ChevronDown size={16} />
          {jewelryDrop && (
            <div className="z-20 w-[100vw] fixed mx-auto top-[96px] left-0 right-0 bg-white">
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
          href={"/diamond"}
          onMouseEnter={() => {
            setDiamondDrop(true);
          }}
          onMouseLeave={() => {
            setDiamondDrop(false);
          }}
        >
          Diamond <ChevronDown size={16} />
          {diamondDrop && (
            <div className="z-20 w-[100vw] fixed mx-auto top-[96px] left-0 right-0 bg-white">
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
        <TopNavItem href="/test">Test API</TopNavItem>
      </div>
      {(jewelryDrop || diamondDrop) && (
        <div className="z-10 fixed left-0 right-0 h-[100vh] w-[100vw] bg-black bg-opacity-30"></div>
      )}
    </div>
  );
}
