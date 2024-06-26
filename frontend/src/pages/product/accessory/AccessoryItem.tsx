import { Skeleton } from "antd";
import { Link } from "react-router-dom";

const AccessoryItem = ({
  accessory,
  price,
}: {
  accessory: any;
  price: any;
}) => {
  return (
    <Link
      className="items-center w-full justify-around hover:shadow-xl py-2 px-4 m-2 duration-150"
      to={`/product/accessory/detail/${accessory.accessoryId}`}
    >
      <div className="relative aspect-square w-full">
        {/* <div
          className="opacity-5 z-10 absolute filter-red my-2 aspect-square bg-cover bg-center bg-no-repeat w-full"
          style={{
            backgroundImage: `url(${accessory.accessoryImages[0].url})`,
          }}
        ></div> */}
        <div
          className="absolute my-2 aspect-square bg-cover bg-center bg-no-repeat w-full"
          style={{
            backgroundImage: `url(${accessory.accessoryImages[0].url})`,
          }}
        ></div>
        <div className="absolute opacity-70 left-1/2 top-1/3 -translate-x-1/2 translate-y-1/3 w-1/3 h-1/3 bg-red-300 rounded-full"></div>
      </div>
      <div>
        <div className="mt-6 w-full flex libre-baskerville-regular">
          {accessory.name}
        </div>

        <div className="w-full flex ">
          {price == 0 ? <Skeleton.Input active={true} size={"small"} /> : price}
        </div>
      </div>
    </Link>
  );
};

export default AccessoryItem;
