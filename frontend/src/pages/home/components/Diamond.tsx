import React from "react";
import Round from "../../../components/svg/RoundDiamond";
import Pear from "../../../components/svg/Pear";
import Heart from "../../../components/svg/Heart";
import Marquise from "../../../components/svg/Marquise";
import Emerald from "../../../components/svg/Emerald";
import Cushion from "../../../components/svg/Cushion";
import Radiant from "../../../components/svg/Radiant";
import Asscher from "../../../components/svg/Asscher";
import Oval from "../../../components/svg/Oval";
import Princess from "../../../components/svg/Princess";

const DiamondItem = () => {
  return (
    <div className="text-sm">
      <Round />
    </div>
  );
};

export default function Diamond() {
  return (
    <div className="w-full">
      <div className="w-full flex justify-center great-vibes-regular text-7xl mt-16">
        Đa dạng đá quý
      </div>
      <div className="mt-8 flex gap-4 justify-evenly">
        <Round />
        <Pear />
        <Heart />
        <Marquise />
        <Emerald />
        <Cushion />
        <Radiant />
        <Asscher />
        <Oval />
        <Princess />
      </div>
    </div>
  );
}
