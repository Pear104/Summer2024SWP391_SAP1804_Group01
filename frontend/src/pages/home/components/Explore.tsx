const ProductItem = () => {
  return (
    <div className="">
      <div className="aspect-square w-[300px] bg-slate-400"></div>
      <div className="mt-2 text-xl flex justify-center">Nhẫn kim cương 24K</div>
    </div>
  );
};

export default function Explore() {
  return (
    <div className="w-full">
      <div className="w-full flex justify-center great-vibes-regular text-7xl mt-16">
        Featured products
      </div>
      <div className="mt-8 flex gap-4 justify-evenly">
        <ProductItem />
        <ProductItem />
        <ProductItem />
        <ProductItem />
      </div>
    </div>
  );
}
