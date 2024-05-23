import { Pagination } from "antd";
import React, { useEffect, useState } from "react";
import { GET } from "../../../utils/request";

const AccessoryItem = ({ accessory }: { accessory: any }) => {
  return (
    <a
      className="flex items-center w-full justify-around hover:bg-slate-100"
      href="/product/accessory/detail"
    >
      <div
        className="my-2 aspect-square bg-cover bg-center bg-no-repeat w-[100px]"
        style={{
          // backgroundImage: `url(/images/face-without-mouth_1f636.png)`,
          backgroundImage: `url(${accessory.imageUrl})`,
        }}
      ></div>
      <div className="w-[80px] flex justify-center">{accessory.name}</div>
      <div className="w-[80px] flex justify-center">Price</div>
      <div className="w-[80px] flex justify-center">{accessory.carat}</div>
      <div className="w-[80px] flex justify-center">{accessory.color}</div>
      <div className="w-[80px] flex justify-center">{accessory.clarity}</div>
      <div className="w-[80px] flex justify-center">{accessory.cut}</div>
      <div className="w-[80px] flex justify-center">{accessory.lab}</div>
      <div className="w-[80px] flex justify-center">
        <a className="border-2 border-stone-800 hover:font-bold rounded-full px-4 py-2 text-sm hover:bg-black hover:text-white transition-all">
          VIEW
        </a>
      </div>
    </a>
  );
};

export default function AccessoryList() {
  const [accessories, setAccessories] = useState([]);

  useEffect(() => {
    (async () => {
      const data = await GET("/api/Accessories");
      setAccessories(data);
    })();
  }, []);
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  return (
    <div className="flex items-center justify-around flex-col mb-20">
      <div className="w-full px-20 mt-10">
        <div className="font-bold mulish-regular flex items-center w-full justify-around mb-4">
          Ahihi
        </div>
        <div className="grid grid-cols-3">
          {accessories.map((accessory: any) => {
            return <AccessoryItem accessory={accessory} />;
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
