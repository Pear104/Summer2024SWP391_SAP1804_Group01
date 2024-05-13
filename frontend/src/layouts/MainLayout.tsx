import React from "react";
import { Outlet } from "react-router-dom";
import Footer from "../components/Footer";
import TopNav from "../components/nav/TopNav";

export default function MainLayout() {
  return (
    <div className="relative min-h-screen h-[5000px]">
      <TopNav />
      <div className="h-[100px]"></div>
      <div className="">
        <Outlet />
      </div>
      <Footer />
    </div>
  );
}
