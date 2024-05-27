import { Outlet } from "react-router-dom";
import ChooseItem from "../pages/product/components/ChooseItem";

export default function ProductLayout() {
  return (
    <div className="flex justify-center flex-col items-center mt-20">
      <ChooseItem />
      <div className="mt-10 w-full">
        <Outlet />
      </div>
    </div>
  );
}
