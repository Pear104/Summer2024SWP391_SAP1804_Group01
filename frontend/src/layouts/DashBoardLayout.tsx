import React from "react";
import { Outlet } from "react-router-dom";
import Sidebar from "../pages/dashboard/Sidebar";

export default function DashBoardLayout() {
  return (
    <div className="flex flex-row bg-neutral-100 h-screen w-screen">
      <Sidebar />
      <div className="p-4">
        <div className="bg-teal-200">header</div>
        <div>
          <Outlet />
        </div>
      </div>
    </div>
  );
}
