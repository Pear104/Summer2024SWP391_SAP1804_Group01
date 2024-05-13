import { useRouteError } from "react-router-dom";

export default function Error() {
  const error: any = useRouteError();
  return (
    <div className="w-screen h-screen flex justify-center items-center">
      <div className="-translate-y-10 flex flex-col gap-4 items-center">
        <div className="font-bold text-3xl">Oops!</div>
        <div className="text-lg">Sorry, an unexpected error has occurred.</div>
        <div className="text-slate-600 italic">
          {error.statusText || error.message}
        </div>
      </div>
    </div>
  );
}
