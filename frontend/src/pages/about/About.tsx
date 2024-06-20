import { useEffect } from "react";
import DatJContent from "./components/DatJContent";
import SideNav from "./components/SideNav";
import scrollTo from "../../utils/scroll";

export default function About() {
  useEffect(() => {
    new URLSearchParams(window.location.search).get("action") ===
      "measure-guide" && scrollTo("measure-guide", "center");
  }, []);
  return (
    <div className="grid grid-cols-12 h-[100vh] no-scrollbar overflow-scroll">
      <div className="sticky top-0 h-[100vh] col-span-2">
        <SideNav />
      </div>
      <div className="col-span-10 no-scrollbar border-l-2">
        <DatJContent />
      </div>
    </div>
  );
}
