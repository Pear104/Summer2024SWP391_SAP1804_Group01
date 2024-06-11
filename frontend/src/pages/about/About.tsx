import DatJContent from "./components/DatJContent";
import SideNav from "./components/SideNav";

export default function About() {
  return (
    <div className="top-0 grid grid-cols-12 max-h-screen overflow-y-scroll no-scrollbar">
      <div className="sticky top-0 col-span-2 border-r-2">
        <SideNav />
      </div>
      <div className="col-span-10 p-4 no-scrollbar">
        <DatJContent />
      </div>
    </div>
  );
}
