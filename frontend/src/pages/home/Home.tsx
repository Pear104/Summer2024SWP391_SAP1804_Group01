import React from "react";
import Banner from "./components/Banner";
import Explore from "./components/Explore";
import Diamond from "./components/Diamond";
export default function Home() {
  return (
    <div className="">
      <Banner />
      <Explore />
      <div className="border border-black mx-64 mt-32 mb-16"></div>
      <Diamond />
    </div>
  );
}
