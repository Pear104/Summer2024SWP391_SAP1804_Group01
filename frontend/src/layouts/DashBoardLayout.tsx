import { Outlet } from "react-router-dom";
import Sidebar from "../pages/dashboard/Sidebar";
import DashboardHeader from "../pages/dashboard/DashboardHeader";
import Dashboard from "../pages/dashboard/Dashboard";

export default function DashBoardLayout() {
  return (
    <div className="fixed flex flex-row bg-neutral-100 h-screen w-screen">
      <Sidebar />
      <div className="flex-1 overflow-y-scroll">
        <DashboardHeader />
        <div className="p-4">
          <Outlet />
        </div>
      </div>
    </div>
  );
}
