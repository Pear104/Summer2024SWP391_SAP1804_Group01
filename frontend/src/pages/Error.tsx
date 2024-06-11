import { Button } from "antd";
import { useRouteError } from "react-router-dom";

export default function Error() {
  const error: any = useRouteError();
  const errorImages = [
    "url(/images/error_1.png)",
    "url(/images/error_2.png)",
    "url(/images/error_3.png)",
    "url(/images/error_4.png)",
    "url(/images/error_5.png)",
    "url(/images/error_6.png)",
    "url(/images/error_7.png)",
    "url(/images/error_8.png)",
  ];

  function getRandomInteger(min: number, max: number) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }
  const randomIndex = getRandomInteger(1, 8) - 1; // Trừ 1 để chuyển đổi từ 1-8 thành 0-7
  const randomImage = errorImages[randomIndex];
  return (
    <div className="w-screen h-screen flex justify-center items-center">
      <div className="-translate-y-10 flex flex-col gap-4 items-center">
        <div
          className="aspect-square bg-contain bg-no-repeat w-[500px]"
          style={{
            backgroundImage: "url(/images/face-without-mouth_1f636.png)",
            // backgroundImage: randomImage,
          }}
        ></div>
        <div className="font-bold text-3xl">Oops!</div>
        <div className="text-lg">
          Sorry, an unexpected error has occurred:{" "}
          <span className="text-slate-600 italic">
            {error.statusText || error.message}
          </span>
        </div>
        <a href="/">
          <Button>Back to Home</Button>
        </a>
      </div>
    </div>
  );
}
