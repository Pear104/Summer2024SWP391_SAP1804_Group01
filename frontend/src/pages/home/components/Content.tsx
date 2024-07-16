const FirstContentSection = () => {
  return (
    <div className="w-full px-8 flex flex-col justify-start">
      <div className="md:text-5xl great-vibes-regular w-full flex flex-col items-center justify-center text-7xl">
        Enhance beauty - Honor value
      </div>
      <div className="grid grid-cols-7 gap-4 mt-8 w-[1000px] self-center">
        <div className="md:hidden col-span-2 w-full flex flex-col justify-between">
          <div
            className="aspect-[4/3] bg-contain bg-no-repeat w-full"
            style={{
              backgroundImage: "url(/images/bracelets.6c0c2.jpg)",
            }}
          ></div>
          <div
            className="aspect-[4/3] bg-contain bg-no-repeat w-full"
            style={{
              backgroundImage: "url(/images/earrings.f4074.jpg)",
            }}
          ></div>
        </div>
        <div className="md:col-span-7 col-span-5 w-full">
          <div
            className="md:aspect-video aspect-[4/3] md:bg-cover bg-contain bg-no-repeat w-full"
            style={{
              backgroundImage: "url(/images/model.46226.jpg)",
            }}
          ></div>
        </div>
      </div>
    </div>
  );
};

const SecondContentSection = () => {
  return (
    <div className="w-full px-8">
      <div className="grid grid-cols-7 gap-4 mt-8">
        <div className="md:col-span-7 md:py-10 col-span-3 w-full bg-slate-300 flex flex-col justify-center px-8">
          <div className="font-bold text-2xl mulish-regular mb-4">
            Handcrafted In Ho Chi Minh City
          </div>
          <div className="text-sm mb-4">
            Our highly skilled artisans exceed industry standards with sparkling
            GIA-graded natural diamonds, the finest-quality materials and
            outstanding engagement ring design at an amazing value.
          </div>
          <div>
            <a
              href="/about"
              className="inline-block py-2 px-4 font-bold border-2 border-black hover:scale-95 transition-all"
            >
              ABOUT DATJ
            </a>
          </div>
        </div>
        <div className="md:hidden col-span-4 w-full bg-blue-300">
          <div
            className="aspect-[5/4] bg-contain bg-no-repeat w-full"
            style={{
              backgroundImage: "url(/images/Handcrafted_v1.6ae02.jpg)",
            }}
          ></div>
        </div>
      </div>
    </div>
  );
};

const ThirdContentSection = () => {
  return (
    <div className="mt-20 w-full px-8 bg-[#151542] text-white">
      <div className="pt-20 flex flex-col items-center">
        <div className="w-full flex justify-center mulish-regular text-3xl font-bold">
          Be Part Of Something Brilliant
        </div>
        <p className="w-[1000px] text-lg self-center text-center my-4">
          Follow us on Instagram for gorgeous engagement rings and wedding
          bands, real life proposals, and dreamy wedding day inspiration. Be
          sure to tag us in your Blue Nile jewelry pics @bluenilediamond for a
          chance to be featured.
        </p>
      </div>
      <div className="grid grid-cols-6 w-full gap-4 mt-8 pb-14">
        <div className="grid col-span-3 grid-cols-3 gap-4">
          <div
            className="col-span-2 row-span-2 aspect-square bg-contain bg-no-repeat w-full"
            style={{
              backgroundImage: "url(/images/kiss1.jpg)",
            }}
          ></div>
          <div
            className="col-span-1 aspect-square bg-contain bg-no-repeat w-full"
            style={{
              backgroundImage: "url(/images/dog.jpg)",
            }}
          ></div>
          <div
            className="col-span-1 aspect-square bg-contain bg-no-repeat w-full"
            style={{
              backgroundImage: "url(/images/hand.jpg)",
            }}
          ></div>
        </div>
        <div className="grid col-span-3 grid-cols-3 gap-4">
          <div
            className="col-span-2 row-span-2 aspect-square bg-contain bg-no-repeat w-full"
            style={{
              backgroundImage: "url(/images/propose.jpg)",
            }}
          ></div>
          <div
            className="col-span-1 aspect-square bg-contain bg-no-repeat w-full"
            style={{
              backgroundImage: "url(/images/kiss2.jpg)",
            }}
          ></div>
          <div
            className="col-span-1 aspect-square bg-contain bg-no-repeat w-full"
            style={{
              backgroundImage: "url(/images/hand2.jpg)",
            }}
          ></div>
        </div>
      </div>
    </div>
  );
};

export default function Content() {
  return (
    <div className="w-full mb-20">
      <FirstContentSection />
      <div className="border border-black border-opacity-40 mx-64 mt-32 mb-16"></div>
      <SecondContentSection />
      {/* <div className="border border-black border-opacity-40 mx-64 mt-32 mb-16"></div> */}
      <ThirdContentSection />
    </div>
  );
}
