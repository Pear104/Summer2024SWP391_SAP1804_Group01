import Banner from "./components/Banner";
import Explore from "./components/Explore";
import Diamond from "./components/Diamond";
import Content from "./components/Content";
export default function Home() {
  return (
    <div className="">
      <Banner />
      <Explore />
      <div className="border border-black border-opacity-40 mx-64 mt-32 mb-16"></div>
      <Diamond />
      <div className="border border-black border-opacity-40 mx-64 mt-32 mb-16"></div>
      <Content />
    </div>
  );
}
