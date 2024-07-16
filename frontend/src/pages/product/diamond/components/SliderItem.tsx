import { Popover, Slider } from "antd";
import { useDebouncedCallback } from "use-debounce";
import scrollTo from "../../../../utils/scroll";
import { CircleHelp } from "lucide-react";
import { Link } from "react-router-dom";

const Content = (description: string, img: string) => {
  return (
    <div className="w-[400px] text-sm">
      {description}
      <div
        className="w-full h-[100px] bg-no-repeat bg-cover bg-center mt-2 rounded-lg"
        style={{
          backgroundImage: `url(${img})`,
        }}
      ></div>
      <Link className="mt-2 block text-blue-500" to={"/blogs/1"}>
        More detail
      </Link>
    </div>
  );
};

export default function SliderItem({
  mark,
  min,
  max,
  defaultValue,
  info,
  step,
  debounceCallback,
}: {
  step?: number;
  info: any;
  mark: { [key: number]: string };
  min: number;
  max: number;
  defaultValue: number[];
  debounceCallback: any;
}) {
  const debounced = useDebouncedCallback(debounceCallback, 800);
  return (
    <div className="flex flex-col">
      <div className="font-bold mulish-regular mb-2 flex items-center gap-2">
        BY {info.title.toUpperCase()}
        <Popover
          placement="right"
          content={Content(info.description, info.img)}
          title={info.title}
          trigger="hover"
        >
          <CircleHelp className="cursor-pointer w-5 h-5 inline" />
        </Popover>
      </div>
      <div className="w-full">
        <Slider
          onChange={(value) => {
            debounced(value);
            scrollTo("table-header", "center");
          }}
          tooltip={{
            formatter: (value?: number): React.ReactNode => {
              if (typeof value === "number") {
                return mark[value] || value;
              }
              return "";
            },
          }}
          step={step}
          range
          marks={mark}
          min={min}
          max={max}
          defaultValue={defaultValue}
        />
      </div>
    </div>
  );
}
