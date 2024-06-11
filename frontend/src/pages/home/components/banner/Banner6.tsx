import { Link } from "react-router-dom";

export default function Banner6() {
  return (
    <div
      className="aspect-[2958/752] bg-contain bg-no-repeat w-full flex  items-center text-white"
      style={{
        backgroundImage: "url(/images/banner6.jpg)",
      }}
    >
      <div className="pl-16">
        <div className="text-6xl playfair-display-regular">
          <div className="mb-8">Form is temporary,</div>
          <span className="">But class is </span>
          <i className="border-b-4 border-white mb-2">Permanent</i>
        </div>
        <div className="mt-16 flex gap-4">
          <div>
            <Link
              to="/product/diamond"
              className="inline-block py-2 px-4 font-bold border-2 border-white hover:scale-95 transition-all"
            >
              BUY DIAMOND
            </Link>
          </div>
          <div>
            <Link
              to="/product/accessory"
              className="inline-block py-2 px-4 font-bold border-2 border-white hover:scale-95 transition-all"
            >
              BUY ACCESSORY
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
