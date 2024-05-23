import DiamondIcon from "./DiamondIcon";
import RingIcon from "./RingIcon";
import CompleteRingIcon from "./CompleteRingIcon";

export default function ChooseItem() {
  return (
    <div className="flex mulish-regular">
      <div className="font-bold border-2 border-primary py-4 px-8 rounded-l-full flex items-center w-[400px] justify-between">
        <div className="font-bold text-2xl">1</div>
        <div className="flex-grow px-4">Choose a Diamond</div>
        <div className="w-[24px]">
          <DiamondIcon />
        </div>
      </div>
      <div className="font-bold border-primary border-y-2 py-4 px-8 flex items-center w-[400px] justify-between">
        <div className="font-bold text-2xl">2</div>
        <div className="flex-grow px-4">Choose an Accessory</div>
        <div className="w-[24px]">
          <RingIcon />
        </div>
      </div>
      <div className="font-bold border-2 border-primary py-4 px-8 rounded-r-full flex items-center w-[400px] justify-between">
        <div className="font-bold text-2xl">3</div>
        <div className="flex-grow px-4">Complete Accessory</div>
        <div className="w-[24px]">
          <CompleteRingIcon />
        </div>
      </div>
    </div>
  );
}
