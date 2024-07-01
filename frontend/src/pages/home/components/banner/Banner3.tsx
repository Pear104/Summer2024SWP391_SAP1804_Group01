import { Link } from "react-router-dom";

export default function Banner3() {
  return (
    <div
      className="md:aspect-video aspect-[1358/452] md:bg-cover bg-contain bg-no-repeat bg-center w-full flex items-center"
      style={{
        backgroundImage: "url(/images/banner3.jpg)",
      }}
    >
      <div className="pl-16">
        <div className="md:text-4xl text-6xl playfair-display-regular">
          <div className="mb-8">Form is temporary,</div>
          <span className="">But class is </span>
          <i className="border-b-4 border-black mb-2">Permanent</i>
        </div>
        <div className="mt-16 flex gap-4">
          <div>
            <Link
              to="/product/diamond"
              className="hover:text-black inline-block py-2 px-4 font-bold border-2 border-black hover:scale-95 transition-all"
            >
              BUY DIAMOND
            </Link>
          </div>
          <div>
            <Link
              to="/product/accessory"
              className="hover:text-black inline-block py-2 px-4 font-bold border-2 border-black hover:scale-95 transition-all"
            >
              BUY ACCESSORY
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
