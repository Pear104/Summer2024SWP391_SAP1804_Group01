const DiamondItem = ({ diamond }: { diamond: any }) => {
  return (
    <a
      className="flex items-center w-full justify-around hover:bg-slate-100"
      href="/product/diamond/detail"
    >
      <div
        className="my-4 aspect-square bg-cover bg-center bg-no-repeat w-[100px]"
        style={{
          // backgroundImage: `url(/images/face-without-mouth_1f636.png)`,
          backgroundImage: `url(${diamond.imageUrl})`,
        }}
      ></div>
      <div className="w-[80px] flex justify-center">{diamond.shape}</div>
      <div className="w-[80px] flex justify-center">Price</div>
      <div className="w-[80px] flex justify-center">{diamond.carat}</div>
      <div className="w-[80px] flex justify-center">{diamond.color}</div>
      <div className="w-[80px] flex justify-center">{diamond.clarity}</div>
      <div className="w-[80px] flex justify-center">{diamond.cut}</div>
      <div className="w-[80px] flex justify-center">{diamond.lab}</div>
      <div className="w-[80px] flex justify-center">
        <div className="border-2 border-stone-800 hover:font-bold rounded-full px-4 py-2 text-sm hover:bg-black hover:text-white transition-all">
          VIEW
        </div>
      </div>
    </a>
  );
};

export default DiamondItem;
