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
import { useSearchStore } from "../../../../store/searchStore";
import { useNavigate } from "react-router-dom";

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

const DiamondItem = ({
  children,
  title,
}: {
  title: string;
  children: React.ReactNode;
}) => {
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  const navigate = useNavigate();
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  return (
    <div
      className={`hover:border-black transition-all px-6 py-2 border rounded-md flex flex-col items-center gap-2 ${
        params.get("Shape") === title ? "border-black" : ""
      }`}
      onClick={() => {
        if (params.get("Shape") === title) {
          params.delete("Shape");
        } else {
          params.set("Shape", title);
        }
        navigate("/product/diamond?" + params.toString());
        setQueryUrl(`/api/Diamonds?${params.toString()}`);
      }}
    >
      <div className="">{children}</div>
      <div className="text-xs">{title}</div>
    </div>
  );
};

export default function Filter() {
  return (
    <div className="w-full px-20">
      <div className="font-bold mulish-regular mb-4">BY SHAPE</div>
      <div className="flex justify-between">
        {items.map((item) => {
          return (
            <DiamondItem key={item.name} title={item.name}>
              {item.element}
            </DiamondItem>
          );
        })}
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
      <div className="transition-all cursor-pointer font-bold mulish-regular mb-4 px-4 my-3 hover:bg-primary/85 hover:shadow-md py-3 bg-primary text-white flex justify-center">
        Filter
      </div>
      <div></div>
      <Divider />
    </div>
  );
}
