import { Pagination } from "antd";
import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";

const AccessoryItem = ({ accessory }: { accessory: any }) => {
  return (
    <a
      className="items-center w-full justify-around hover:shadow-xl p-2 m-2 duration-150"
      href="/product/accessory/detail"
    >
      <div
        className="my-2 aspect-square bg-cover bg-center bg-no-repeat w-full"
        style={{
          backgroundImage: `url(${accessory.accessoryImages[0].url})`,
        }}
      ></div>
      <div>
        <div className="w-full flex ">{accessory.name}</div>

        {/* luc nao co gia thi thay karat = price*/}
        <div className="w-full flex ">{accessory.karat}</div>
      </div>
    </a>
  );
};

export default function AccessoryList() {
  const [accessories, setAccessories] = useState([]);
  // const [lastAccessoryId, setLastAccessoryId] = useState(null);

  useEffect(() => {
    (async () => {
      const data = await GET("/api/Accessories");
      setAccessories(data);
      // const lastAccessoryId = data[data.length - 1].id;
      // setLastAccessoryId(lastAccessoryId);
    })();
  }, []);
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  return (
    <div className="flex items-center justify-around flex-col mb-20 px-36">
      <div className="w-[400] px-20">
        <div>Showing {accessories.length} of products</div>
        <div className="font-bold mulish-regular flex items-center w-full justify-around mb-4">
          Accessory
        </div>
        <div className="grid grid-cols-3 gap-3">
          {accessories.map((accessory: any) => {
            return <AccessoryItem accessory={accessory} />;
          })}
        </div>
        <div className="mt-10 flex justify-center">
          <Pagination
            defaultCurrent={Number.parseInt(params.get("page") || "1")}
            total={500}
            onChange={(page, _pageSize) => {
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
