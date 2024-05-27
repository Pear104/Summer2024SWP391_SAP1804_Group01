export default function Banner() {
  return (
    <div
      className="aspect-[1358/452] bg-contain bg-no-repeat w-full flex items-center"
      style={{
        backgroundImage: "url(/images/Banner_1.jpg)",
      }}
    >
      <div className="pl-16">
        <div className="text-6xl playfair-display-regular">
          <div className="mb-8">Form is temporary,</div>
          <span className="">But class is </span>
          <i className="border-b-4 border-black mb-2">Permanent</i>
        </div>
        <div className="mt-16 flex gap-4">
          <div>
            <a
              href="./"
              className="inline-block py-2 px-4 font-bold border-2 border-black hover:scale-95 transition-all"
            >
              BUY DIAMOND
            </a>
          </div>
          <div>
            <a
              href="./"
              className="inline-block py-2 px-4 font-bold border-2 border-black hover:scale-95 transition-all"
            >
              BUY ACCESSORY
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}
