import { Slider } from "antd";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../../store/searchStore";
import { useDebouncedCallback } from "use-debounce";
export default function SliderItem({
  mark,
  min,
  max,
  defaultValue,
  title,
  step,
  debounceCallback,
}: {
  step?: number;
  title: string;
  mark: { [key: number]: string };
  min: number;
  max: number;
  defaultValue: number[];
  debounceCallback: any;
}) {
  const debounced = useDebouncedCallback(debounceCallback, 800);

  return (
    <div className="flex flex-col mt-6">
      <div className="font-bold mulish-regular mb-2">{title}</div>
      <div className="w-full">
        <Slider
          onChange={(value) => {
            debounced(value);
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
