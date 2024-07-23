import AccessoryShapeFilter from "./AccessoryShapeFilter";
import Round from "../../../../components/svg/Round";
import Pear from "../../../../components/svg/Pear";
import Heart from "../../../../components/svg/Heart";
import Marquise from "../../../../components/svg/Marquise";
import Emerald from "../../../../components/svg/Emerald";
import Cushion from "../../../../components/svg/Cushion";
import Radiant from "../../../../components/svg/Radiant";
import Asscher from "../../../../components/svg/Asscher";
import Oval from "../../../../components/svg/Oval";
import Princess from "../../../../components/svg/Princess";
import { useSearchStore } from "../../../../store/searchStore";
import { useNavigate } from "react-router-dom";
import { Divider } from "antd";
const items = [
  {
    element: <Round className="w-[50px] h-[50px]" />,
    name: "Round",
  },
  {
    element: <Pear className="w-[50px] h-[50px]" />,
    name: "Pear",
  },
  {
    element: <Heart className="w-[50px] h-[50px]" />,
    name: "Heart",
  },
  {
    element: <Marquise className="w-[50px] h-[50px]" />,
    name: "Marquise",
  },
  {
    element: <Emerald className="w-[50px] h-[50px]" />,
    name: "Emerald",
  },
  {
    element: <Cushion className="w-[50px] h-[50px]" />,
    name: "Cushion",
  },
  {
    element: <Radiant className="w-[50px] h-[50px]" />,
    name: "Radiant",
  },
  {
    element: <Asscher className="w-[50px] h-[50px]" />,
    name: "Asscher",
  },
  {
    element: <Oval className="w-[50px] h-[50px]" />,
    name: "Oval",
  },
  {
    element: <Princess className="w-[50px] h-[50px]" />,
    name: "Princess",
  },
];

export default function Filter() {
  return (
    <div className="w-full px-20">
      <div className="font-bold mulish-regular mb-4">BY SHAPE</div>
      <div className="flex justify-between mb-4">
        {items.map((item) => {
          return (
            <AccessoryShapeFilter key={item.name} title={item.name}>
              {item.element}
            </AccessoryShapeFilter>
          );
        })}
      </div>
      <Divider />
    </div>
  );
}
