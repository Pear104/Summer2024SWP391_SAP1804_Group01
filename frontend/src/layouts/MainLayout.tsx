import { Outlet } from "react-router-dom";
import Footer from "../components/Footer";
import TopNav from "../components/nav/TopNav";

export default function MainLayout() {
  return (
    <div className="relative min-h-screen overflow-x-hidden">
      <TopNav />
      <div className="">
        <Outlet />
      </div>
      <Footer />
    </div>
  );
}
