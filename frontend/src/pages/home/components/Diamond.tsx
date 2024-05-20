import React from "react";
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

const DiamondItem = ({ children }: { children: React.ReactNode }) => {
  return <div className="text-sm">{children}</div>;
};

export default function Diamond() {
  return (
    <div className="w-full">
      <div className="w-full flex justify-center great-vibes-regular text-7xl mt-16">
        Diverse gemstones
      </div>
      <div className="mt-8 flex gap-4 justify-evenly px-8 overflow-x-hidden">
        <DiamondItem>
          <Round />
        </DiamondItem>
        <DiamondItem>
          <Pear />
        </DiamondItem>
        <DiamondItem>
          <Heart />
        </DiamondItem>
        <DiamondItem>
          <Marquise />
        </DiamondItem>
        <DiamondItem>
          <Emerald />
        </DiamondItem>
        <DiamondItem>
          <Cushion />
        </DiamondItem>
        <DiamondItem>
          <Radiant />
        </DiamondItem>
        <DiamondItem>
          <Asscher />
        </DiamondItem>
        <DiamondItem>
          <Oval />
        </DiamondItem>
        <DiamondItem>
          <Princess />
        </DiamondItem>
      </div>
      <div className="flex justify-center mt-16">
        <a
          href="./"
          className="inline-block py-2 px-4 font-bold border-2 border-black hover:scale-95 transition-all"
        >
          VIEW MORE
        </a>
      </div>
    </div>
  );
}
