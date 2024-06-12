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

        <div className="w-full flex ">
          {price == 0 ? <Skeleton.Input active={true} size={"small"} /> : price}
        </div>
      </div>
    </Link>
  );
};

export default AccessoryItem;
