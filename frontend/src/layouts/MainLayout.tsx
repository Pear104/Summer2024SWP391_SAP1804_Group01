import { Outlet, useLocation } from "react-router-dom";
import Footer from "../components/Footer";
import TopNav from "../components/nav/TopNav";
import { useState, useEffect } from "react";

export default function MainLayout() {
  const [hideFooter, setHideFooter] = useState(false);
  const location = useLocation();
  useEffect(() => {
    if (location.pathname.includes("about")) {
      setHideFooter(true);
    } else {
      setHideFooter(false);
    }
  }, [location]);
  return (
    <div className="relative overflow-x-hidden">
      <TopNav />
      <Outlet />
      <span className="">{!hideFooter && <Footer />}</span>
    </div>
  );
}
