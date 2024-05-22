export default function DiamondDetail() {
  return (
    <div className="flex justify-center">
      <div className="w-[1000px] grid grid-cols-2 gap-10">
        <div
          className="place-self-center aspect-square bg-contain bg-no-repeat w-full border"
          style={{
            backgroundImage: `url(/images/face-without-mouth_1f636.png)`,
            // backgroundImage: `url(${diamond.imageUrl})`,
          }}
        ></div>
        <div>
          <div className="mulish-regular text-2xl">
            1.00 Carat Round Shape Natural Diamond
          </div>
          <div className="text-sm flex gap-2">
            <div>Certificate Number#: </div>
            <div>100.123</div>
          </div>
          <div>Ahihi</div>
          <div>Ahihi</div>
        </div>
      </div>
    </div>
  );
}
