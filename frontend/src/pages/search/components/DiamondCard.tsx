import { Link } from "react-router-dom";

export default function DiamondCard({ diamond }: { diamond: any }) {
  return (
    <Link
      className="items-center w-full justify-around hover:shadow-xl py-2 px-4 m-2 duration-150"
      to={`/product/diamond/detail/${diamond.diamondId}`}
    >
      <div
        className="relative my-2 aspect-square bg-cover bg-center bg-no-repeat w-full rounded-md"
        style={{
          backgroundImage: `url(${diamond.imageUrl})`,
        }}
      ></div>
      <div>
        <div className="w-full flex libre-baskerville-regular">
          Certificate number: {diamond.certificateNumber}
        </div>
        <div className="w-full flex libre-baskerville-regular">
          Shape: {diamond.shape}
        </div>
        <div className="w-full flex libre-baskerville-regular">
          Carat: {diamond.carat}
        </div>
      </div>
    </Link>
  );
}
