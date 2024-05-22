import { Pagination } from "antd";
import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";

const DiamondItem = ({ diamond }: { diamond: any }) => {
  return (
    <a
      className="flex items-center w-full justify-around hover:bg-slate-100"
      href="#"
    >
      <div
        className="aspect-square bg-contain bg-no-repeat w-[100px]"
        style={{
          // backgroundImage: `url(/images/face-without-mouth_1f636.png)`,
          backgroundImage: `url(${diamond.imageUrl})`,
        }}
      ></div>
      <div className="">{diamond.carat}</div>
      <div>Price</div>
      <div>{diamond.carat}</div>
      <div>{diamond.color}</div>
      <div>{diamond.clarity}</div>
      <div>{diamond.cut}</div>
      <div>{diamond.lab}</div>
      <div>View</div>
    </a>
  );
};

export default function DiamondList() {
  const [diamonds, setDiamonds] = useState([]);
  useEffect(() => {
    (async () => {
      const data = await GET("/diamond");
      console.log(data);
      setDiamonds(data);
    })();
  }, []);
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);

  return (
    <div className="flex items-center flex-col mb-20">
      <div className="font-bold">Diamond table</div>
      <div className="w-full px-20 mt-10">
        <div className="font-bold mulish-regular flex items-center w-full justify-around mb-4">
          <div className="w-[100px]"></div>
          <div>Shape</div>
          <div>Price</div>
          <div>Carat</div>
          <div>Color</div>
          <div>Clarity</div>
          <div>Cut</div>
          <div>Lab</div>
          <div>View</div>
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
