import {
  Diamond,
  DiamondMinus,
  DiamondPercent,
  DiamondPlus,
  Gem,
} from "lucide-react";
import React from "react";

export default function Logo() {
  return (
    <a className="flex gap-2 items-center" href="/">
      <DiamondPlus size={27} strokeWidth={2} />
      <div className="cinzel-decorative-regular italic font-semibold text-3xl flex">
        {/* <div className="playfair-display-regular italic font-bold text-3xl flex"> */}
        DAT J
      </div>
      <DiamondPlus size={27} strokeWidth={2} />
    </a>
  );
}
