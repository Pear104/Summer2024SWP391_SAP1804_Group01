export default function Banner() {
  return (
    <div
      className="aspect-[1358/452] bg-contain bg-no-repeat w-full"
      style={{
        backgroundImage: "url(/images/Banner_1.jpg)",
      }}
    >
      <div className="pl-16 pt-24">
        <div className="text-6xl playfair-display-regular">
          <div className="mb-8">Phong độ là nhất thời </div>
          <span className="">Đẳng cấp là </span>
          <i className="border-b-4 border-black mb-2">mãi mãi</i>
        </div>
        <div className="mt-16 flex gap-4">
          <div>
            <a
              href="./"
              className="inline-block py-2 px-4 font-bold border-2 border-black hover:scale-95 transition-all"
            >
              MUA KIM CƯƠNG
            </a>
          </div>
          <div>
            <a
              href="./"
              className="inline-block py-2 px-4 font-bold border-2 border-black hover:scale-95 transition-all"
            >
              MUA TRANG SỨC
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}
