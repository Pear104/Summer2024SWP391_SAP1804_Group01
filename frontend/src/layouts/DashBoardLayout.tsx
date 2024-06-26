import { Outlet } from "react-router-dom";
import Sidebar from "../pages/dashboard/components/Sidebar";
import DashboardHeader from "../pages/dashboard/components/DashboardHeader";

export default function DashBoardLayout() {
  return (
    <div className="bg-neutral-100 h-screen w-screen overflow-hidden flex flex-row sm:flex-col">
      <Sidebar />
      <div className="flex flex-col flex-1 overflow-y-scroll">
        <span className="sm:hidden">
          <DashboardHeader />
        </span>
        <div className="flex-1 p-4 min-h-0 overflow-auto">
          <Outlet />
        </div>
      </div>
    </div>
  );
}
