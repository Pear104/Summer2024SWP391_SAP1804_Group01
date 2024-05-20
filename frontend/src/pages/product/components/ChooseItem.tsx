import { Gem } from "lucide-react";
import React from "react";

export default function ChooseItem() {
  return (
    <div className="flex gap-4">
      <div className="font-bold border py-4 px-8 rounded-l-xl">
        <div>1</div>
        <div>Choose a Diamond</div>
        <Gem />
      </div>
      <div className="font-bold">
        <div>2. Choose an Accessory</div>
      </div>
      <div className="font-bold">
        <div>3. Complete your Accessory</div>
      </div>
    </div>
  );
}
