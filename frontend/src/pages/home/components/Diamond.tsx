import Round from "../../../components/svg/Round";
import Pear from "../../../components/svg/Pear";
import Heart from "../../../components/svg/Heart";
import Marquise from "../../../components/svg/Marquise";
import Emerald from "../../../components/svg/Emerald";
import Cushion from "../../../components/svg/Cushion";
import Radiant from "../../../components/svg/Radiant";
import Asscher from "../../../components/svg/Asscher";
import Oval from "../../../components/svg/Oval";
import Princess from "../../../components/svg/Princess";
import { Link } from "react-router-dom";

const items = [
  <Round className="w-[100px] h-[100px]" />,
  <Pear className="w-[100px] h-[100px]" />,
  <Heart className="w-[100px] h-[100px]" />,
  <Marquise className="w-[100px] h-[100px]" />,
  <Emerald className="w-[100px] h-[100px]" />,
  <Cushion className="w-[100px] h-[100px]" />,
  <Radiant className="w-[100px] h-[100px]" />,
  <Asscher className="w-[100px] h-[100px]" />,
  <Oval className="w-[100px] h-[100px]" />,
  <Princess className="w-[100px] h-[100px]" />,
];

export default function Diamond() {
  return (
    <div className="w-full">
      <div className="w-full flex justify-center great-vibes-regular text-7xl mt-16">
        Diverse gemstones
      </div>
      <div className="md:hidden w-full mt-8 gap-4 justify-evenly px-8 overflow-x-hidden grid grid-cols-10">
        {items.map((item: any, index) => {
          return (
            <div className="text-sm" key={index}>
              {item}
            </div>
          );
        })}
      </div>
      <div className="flex justify-center mt-16">
        <Link
          to="/product/diamond"
          className="inline-block py-2 px-4 font-bold border-2 border-black hover:scale-95 transition-all"
        >
          VIEW MORE
        </Link>
      </div>
    </div>
  );
}
