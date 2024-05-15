import React from "react";
import Logo from "../../../components/logo/Logo";

const FirstContentSection = () => {
  return (
    <div className="w-full px-8">
      <div className="w-full flex justify-center great-vibes-regular text-7xl mt-16">
        Thương hiệu uy tín, chất lượng hàng đầu Việt Nam
      </div>
      <div className="grid grid-cols-7 gap-4 mt-8">
        <div className="col-span-3 w-full bg-slate-300">
          <div
            className="aspect-square bg-contain bg-no-repeat w-[200px]"
            style={{
              backgroundImage: "url(/images/logo.png)",
            }}
          >
            <Logo />
          </div>
        </div>
        <div className="col-span-4 w-full bg-blue-300 h-[300px]">Ahihihi</div>
      </div>
    </div>
  );
};

const SecondContentSection = () => {
  return (
    <div className="w-full px-8">
      <div className="w-full flex justify-center great-vibes-regular text-7xl mt-16">
        Thương hiệu uy tín, chất lượng hàng đầu Việt Nam
      </div>
      <div className="grid grid-cols-7 gap-4 mt-8">
        <div className="col-span-3 w-full bg-slate-300">
          <div
            className="aspect-square bg-contain bg-no-repeat w-[200px]"
            style={{
              backgroundImage: "url(/images/logo.png)",
            }}
          >
            <Logo />
          </div>
        </div>
        <div className="col-span-4 w-full bg-blue-300 h-[300px]">Ahihihi</div>
      </div>
    </div>
  );
};

const ThirdContentSection = () => {
  return (
    <div className="w-full px-8">
      <div className="w-full flex justify-center great-vibes-regular text-7xl mt-16">
        Thương hiệu uy tín, chất lượng hàng đầu Việt Nam
      </div>
      <div className="grid grid-cols-7 gap-4 mt-8">
        <div className="col-span-3 w-full bg-slate-300">
          <div
            className="aspect-square bg-contain bg-no-repeat w-[200px]"
            style={{
              backgroundImage: "url(/images/logo.png)",
            }}
          >
            <Logo />
          </div>
        </div>
        <div className="col-span-4 w-full bg-blue-300 h-[300px]">Ahihihi</div>
      </div>
    </div>
  );
};

export default function Content() {
  return (
    <div className="w-full">
      <FirstContentSection />
      <div className="border border-black border-opacity-40 mx-64 mt-32 mb-16"></div>
      <SecondContentSection />
      <div className="border border-black border-opacity-40 mx-64 mt-32 mb-16"></div>
      <ThirdContentSection />
    </div>
  );
}
