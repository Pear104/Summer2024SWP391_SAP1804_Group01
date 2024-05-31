import { Divider } from "antd";
import Round from "../../../../components/svg/Round";
import Pear from "../../../../components/svg/Pear";
import Marquise from "../../../../components/svg/Marquise";
import Emerald from "../../../../components/svg/Emerald";
import Cushion from "../../../../components/svg/Cushion";
import Radiant from "../../../../components/svg/Radiant";
import Asscher from "../../../../components/svg/Asscher";
import Oval from "../../../../components/svg/Oval";
import Princess from "../../../../components/svg/Princess";
import Heart from "../../../../components/svg/Heart";
import SliderItem from "./SliderItem";

const DiamondItem = ({
  children,
  title,
}: {
  title: string;
  children: React.ReactNode;
}) => {
  return (
    <div className="hover:border-black transition-all px-6 py-2 border rounded-md flex flex-col items-center gap-2">
      <div className="">{children}</div>
      <div className="text-xs">{title}</div>
    </div>
  );
};

const clarity: { [key: number]: string } = {
  0: "I3",
  1: "I2",
  2: "I1",
  3: "SI3",
  4: "SI2",
  5: "SI1",
  6: "VS2",
  7: "VS1",
  8: "VVS2",
  9: "VVS1",
  10: "IF",
  11: "FL",
};
const color: { [key: number]: string } = {
  0: "M",
  1: "L",
  2: "K",
  3: "J",
  4: "I",
  5: "H",
  6: "G",
  7: "F",
  8: "E",
  9: "D",
};

const cut: { [key: number]: string } = {
  0: "Ideal",
  1: "Excellent",
  2: "Very Good",
  3: "Good",
};

const carat: { [key: number]: string } = {
  0: "0",
  6: "6",
};

export default function Filter() {
  return (
    <div className="w-full px-20">
      <div className="font-bold mulish-regular mb-4">BY SHAPE</div>
      <div className="flex justify-between">
        <DiamondItem title="Round">
          <Round className="w-[50px] h-[50px]" />
        </DiamondItem>
        <DiamondItem title="Pear">
          <Pear className="w-[50px] h-[50px]" />
        </DiamondItem>
        <DiamondItem title="Heart">
          <Heart className="w-[50px] h-[50px]" />
        </DiamondItem>
        <DiamondItem title="Marquise">
          <Marquise className="w-[50px] h-[50px]" />
        </DiamondItem>
        <DiamondItem title="Emerald">
          <Emerald className="w-[50px] h-[50px]" />
        </DiamondItem>
        <DiamondItem title="Cushion">
          <Cushion className="w-[50px] h-[50px]" />
        </DiamondItem>
        <DiamondItem title="Radiant">
          <Radiant className="w-[50px] h-[50px]" />
        </DiamondItem>
        <DiamondItem title="Asscher">
          <Asscher className="w-[50px] h-[50px]" />
        </DiamondItem>
        <DiamondItem title="Oval">
          <Oval className="w-[50px] h-[50px]" />
        </DiamondItem>
        <DiamondItem title="Princess">
          <Princess className="w-[50px] h-[50px]" />
        </DiamondItem>
      </div>

      <div className="grid grid-cols-2 gap-16">
        <SliderItem
          title="BY CUT"
          mark={cut}
          min={0}
          max={3}
          defaultValue={[0, 3]}
        />
        <SliderItem
          step={0.01}
          title="BY CARAT"
          mark={carat}
          min={0}
          max={6}
          defaultValue={[0, 6]}
        />
      </div>
      <SliderItem
        title="BY CLARITY"
        mark={clarity}
        min={0}
        max={11}
        defaultValue={[0, 11]}
      />
      <SliderItem
        title="BY COLOR"
        mark={color}
        min={0}
        max={9}
        defaultValue={[0, 9]}
      />
      <div></div>
      <div></div>
      <div></div>
      <Divider />
    </div>
  );
}
