import { Slider } from "antd";

export default function SliderItem({
  mark,
  min,
  max,
  defaultValue,
  title,
  step,
}: {
  step?: number;
  title: string;
  mark: { [key: number]: string };
  min: number;
  max: number;
  defaultValue: number[];
}) {
  return (
    <div className="flex flex-col mt-6">
      <div className="font-bold mulish-regular mb-2">{title}</div>
      <div className="w-full">
        <Slider
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
