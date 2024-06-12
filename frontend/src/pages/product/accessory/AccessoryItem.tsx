import { Skeleton } from "antd";

const AccessoryItem = ({
  accessory,
  price,
}: {
  accessory: any;
  price: any;
}) => {
  return (
    <a
      className="items-center w-full justify-around hover:shadow-xl py-2 px-4 m-2 duration-150"
      href={`/product/accessory/detail/${accessory.accessoryId}`}
    >
      <div
        className="my-2 aspect-square bg-cover bg-center bg-no-repeat w-full"
        style={{
          backgroundImage: `url(${accessory.accessoryImages[0].url})`,
        }}
      ></div>
      <div>
        <div className="w-full flex libre-baskerville-regular">
          {accessory.name}
        </div>

        {/* luc nao co gia thi thay karat = price*/}
        <div className="w-full flex ">
          {price == 0 ? (
            <Skeleton.Button active={true} size={"small"} />
          ) : (
            price
          )}
        </div>
      </div>
    </a>
  );
};

export default AccessoryItem;
