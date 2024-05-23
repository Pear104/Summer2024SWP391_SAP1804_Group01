import { Pagination } from "antd";
import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";

const DiamondItem = ({ diamond }: { diamond: any }) => {
  return (
    <a
      className="flex items-center w-full justify-around hover:bg-slate-100"
      href="/product/diamond/detail"
    >
      <div
        className="my-2 aspect-square bg-cover bg-center bg-no-repeat w-[100px]"
        style={{
          // backgroundImage: `url(/images/face-without-mouth_1f636.png)`,
          backgroundImage: `url(${diamond.imageUrl})`,
        }}
      ></div>
      <div className="w-[80px] flex justify-center">{diamond.shape.name}</div>
      <div className="w-[80px] flex justify-center">Price</div>
      <div className="w-[80px] flex justify-center">{diamond.carat}</div>
      <div className="w-[80px] flex justify-center">{diamond.color}</div>
      <div className="w-[80px] flex justify-center">{diamond.clarity}</div>
      <div className="w-[80px] flex justify-center">{diamond.cut}</div>
      <div className="w-[80px] flex justify-center">{diamond.lab}</div>
      <div className="w-[80px] flex justify-center">
        <a className="border-2 border-stone-800 hover:font-bold rounded-full px-4 py-2 text-sm hover:bg-black hover:text-white transition-all">
          VIEW
        </a>
      </div>
    </a>
  );
};

export default function DiamondList() {
  const [diamonds, setDiamonds] = useState([]);
  useEffect(() => {
    (async () => {
      const data = await GET("/api/Diamond");
      setDiamonds(data);
    })();
  }, []);
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);

  return (
    <div className="flex items-center justify-around flex-col mb-20">
      <div className="font-bold">Diamond table</div>
      <div className="w-full px-20 mt-10">
        <div className="font-bold mulish-regular flex items-center w-full justify-around mb-4">
          <div className="w-[100px] text-center">View</div>
          <div className="w-[80px] text-center">Shape</div>
          <div className="w-[80px] text-center">Price</div>
          <div className="w-[80px] text-center">Carat</div>
          <div className="w-[80px] text-center">Color</div>
          <div className="w-[80px] text-center">Clarity</div>
          <div className="w-[80px] text-center">Cut</div>
          <div className="w-[80px] text-center">Lab</div>
          <div className="w-[80px] text-center">Detail</div>
        </div>
        <div>
          {diamonds.map((diamond: any) => {
            return <DiamondItem diamond={diamond} />;
          })}
        </div>
        <div className="mt-10 flex justify-center">
          <Pagination
            defaultCurrent={Number.parseInt(params.get("page") || "1")}
            total={500}
            onChange={(page, pageSize) => {
              const url = new URL(window.location.href);
              const params = new URLSearchParams(url.searchParams);
              params.set("page", page.toString());
              url.search = params.toString();
              window.location.href = url.toString();
            }}
          />
        </div>
      </div>
    </div>
  );
}
