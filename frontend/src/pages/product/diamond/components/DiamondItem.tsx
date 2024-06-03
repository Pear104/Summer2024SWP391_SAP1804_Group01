import { Link } from "react-router-dom";

const DiamondItem = ({ diamond, price }: { diamond: any; price: any }) => {
  return (
    <Link
      className="flex items-center w-full justify-around hover:bg-slate-100"
      to={`/product/diamond/detail/${diamond.diamondId}`}
    >
      <div
        className="my-4 aspect-square bg-cover bg-center bg-no-repeat w-[100px]"
        style={{
          // backgroundImage: `url(/images/face-without-mouth_1f636.png)`,
          backgroundImage: `url(${diamond.imageUrl})`,
        }}
      ></div>
      <div className="w-[80px] flex justify-center">{diamond.shape}</div>
      <div className="w-[80px] flex justify-center">{price}</div>
      <div className="w-[80px] flex justify-center">{diamond.carat}</div>
      <div className="w-[80px] flex justify-center">{diamond.color}</div>
      <div className="w-[80px] flex justify-center">{diamond.clarity}</div>
      <div className="w-[80px] flex justify-center">{diamond.cut}</div>
      <div className="w-[80px] flex justify-center">{diamond.lab}</div>
      <div className="w-[80px] flex justify-center">
        <div className="text-xs border-2 border-stone-800 hover:font-bold rounded-full px-4 py-2 hover:bg-black hover:text-white transition-all">
          VIEW
        </div>
      </div>
    </Link>
  );
};

export default DiamondItem;
