import { Button } from "antd";
import { useRouteError } from "react-router-dom";

export default function Error() {
  const error: any = useRouteError();
  return (
    <div className="w-screen h-screen flex justify-center items-center">
      <div className="-translate-y-10 flex flex-col gap-4 items-center">
        <div
          className="aspect-square bg-contain bg-no-repeat w-[200px]"
          style={{
            // backgroundImage: "url(/images/face-without-mouth_1f636.png)",
             backgroundImage: "url(/images/error.png)",
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
