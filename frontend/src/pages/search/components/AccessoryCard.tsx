import { Link } from "react-router-dom";

export default function AccessoryCard({ accessory }: { accessory: any }) {
  return (
    <Link
      className="items-center w-full justify-around hover:shadow-xl py-2 px-4 m-2 duration-150"
      to={`/product/accessory/detail/${accessory.accessoryId}`}
    >
      <div
        className="relative my-2 aspect-square bg-cover bg-center bg-no-repeat w-full"
        style={{
          backgroundImage: `url(${accessory.accessoryImages[0].url})`,
        }}
      >
        <div className="text-base italic text-red-400">
          *The images is for illustration purpose.
        </div>
      </div>
      <div>
        <div className="w-full flex libre-baskerville-regular">
          {accessory.name}
        </div>
      </div>
    </Link>
  );
}
