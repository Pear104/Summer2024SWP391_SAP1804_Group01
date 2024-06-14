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
    </div>
  );
}
