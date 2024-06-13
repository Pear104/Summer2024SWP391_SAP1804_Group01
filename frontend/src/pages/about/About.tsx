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
    <div className="top-0 grid grid-cols-12 no-scrollbar">
      <div className="sticky top-0 col-span-2 border-r-2">
        <SideNav />
      </div>
      <div className="col-span-10 p-4 no-scrollbar">
        <DatJContent />
      </div>
    </div>
  );
}
