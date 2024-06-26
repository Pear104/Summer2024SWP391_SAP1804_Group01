import Explore from "./components/Explore";
import Diamond from "./components/Diamond";
import Content from "./components/Content";
import { Carousel } from "antd";
import Banner1 from "./components/banner/Banner1";
import Banner2 from "./components/banner/Banner2";
import Banner3 from "./components/banner/Banner3";
import Banner4 from "./components/banner/Banner4";
// import Banner5 from "./components/banner/Banner5";
import Banner7 from "./components/banner/Banner7";
export default function Home() {
  return (
    <div className="">
      <div className="hidden sm:flex sm:flex-col justify-center items-center">
        <div className="mt-10 text-2xl px-6 text-center">
          Mobile version only support for our staffs
        </div>
        <a
          href="/authentication/login"
          className="border-2 border-black px-5 py-2 mt-10 text-2xl flex justify-center items-center"
        >
          Login
        </a>
      </div>
      <span className="sm:hidden">
        <Carousel autoplay autoplaySpeed={3000}>
          <Banner3 />
          <Banner4 />
          <Banner1 />
          <Banner2 />
          {/* <Banner5 /> */}
          <Banner7 />
          {/* <Banner6 /> */}
        </Carousel>
        <Explore />
        <div className="border border-black border-opacity-40 mx-64 mt-16 mb-16"></div>
        <Diamond />
        <div className="border border-black border-opacity-40 mx-64 mt-32 mb-16"></div>
        <Content />
      </span>
    </div>
  );
}
