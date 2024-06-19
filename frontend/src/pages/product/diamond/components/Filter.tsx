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
import DiamondShapeFilter from "./DiamondShapeFilter";

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
  9: "M",
  10: "L",
  11: "K",
  12: "J",
  13: "I",
  14: "H",
  15: "G",
  16: "F",
  17: "E",
  18: "D",
};

// const cut: { [key: number]: string } = {
//   0: "Ideal",
//   1: "Excellent",
//   2: "Very Good",
//   3: "Good",
// };

const carat: { [key: number]: string } = {
  0: "0",
  1: "1",
  2: "2",
  3: "3",
  4: "4",
  5: "5",
  6: "6",
  7: "7",
  8: "8",
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

export default function Filter() {
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  const navigate = useNavigate();
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  return (
    <div className="w-full px-20">
      <div className="font-bold mulish-regular mb-4">BY SHAPE</div>
      <div className="flex justify-between mb-4">
        {items.map((item) => {
          return (
            <DiamondShapeFilter key={item.name} title={item.name}>
              {item.element}
            </DiamondShapeFilter>
          );
        })}
      </div>

      <div className="grid grid-cols-1 gap-4">
        {/* <SliderItem
          title="BY CUT"
          mark={cut}
          min={0}
          max={3}
          defaultValue={[
            Number(params.get("MinCut")) || 0,
            Number(params.get("MaxCut")) || 3,
          ]}
          debounceCallback={(value: any) => {
            params.delete("PageNumber");
            params.set("MinCut", value[0]);
            params.set("MaxCut", value[1]);
            navigate("/product/diamond?" + params.toString());
            setQueryUrl(`/api/Diamonds?${params.toString()}`);
          }}
        /> */}
        <SliderItem
          step={0.01}
          title="BY CARAT"
          mark={carat}
          min={0}
          max={8}
          defaultValue={[
            Number(params.get("MinCarat")) || 0,
            Number(params.get("MaxCarat")) || 8,
          ]}
          debounceCallback={(value: any) => {
            params.delete("PageNumber");
            params.set("MinCarat", value[0]);
            params.set("MaxCarat", value[1]);
            params.set("IsAvailability", "true");
            navigate("/product/diamond?" + params.toString());
            setQueryUrl(`/api/Diamonds?${params.toString()}`);
          }}
        />
      </div>
      <SliderItem
        title="BY CLARITY"
        mark={clarity}
        min={0}
        max={11}
        defaultValue={[
          Number(params.get("MinClarity")) || 0,
          Number(params.get("MaxClarity")) || 11,
        ]}
        debounceCallback={(value: any) => {
          params.delete("PageNumber");
          params.set("MinClarity", value[0]);
          params.set("MaxClarity", value[1]);
          params.set("IsAvailability", "true");
          navigate("/product/diamond?" + params.toString());
          setQueryUrl(`/api/Diamonds?${params.toString()}`);
        }}
      />
      <SliderItem
        title="BY COLOR"
        mark={color}
        min={9}
        max={18}
        defaultValue={[
          Number(params.get("MinColor")) || 9,
          Number(params.get("MaxColor")) || 18,
        ]}
        debounceCallback={(value: any) => {
          params.delete("PageNumber");
          params.set("MinColor", value[0]);
          params.set("MaxColor", value[1]);
          params.set("IsAvailability", "true");
          navigate("/product/diamond?" + params.toString());
          setQueryUrl(`/api/Diamonds?${params.toString()}`);
        }}
      />
      <Divider />
    </div>
  );
}
