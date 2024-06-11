import { Link, Outlet } from "react-router-dom";
import ChooseItem from "../pages/product/components/ChooseItem";
import { Breadcrumb } from "antd";

export default function ProductLayout() {
  const url = new URL(window.location.href);
  return (
    <div className="flex justify-center flex-col items-center">
      <div>
        <div className="justify-self-start w-full">
          {url.pathname.includes("product") && (
            <Breadcrumb
              className="mt-10 mb-4"
              items={[
                {
                  title: "Products",
                },
                {
                  title: (
                    <Link
                      to={`/product/${
                        url.pathname.includes("diamond")
                          ? "diamond"
                          : "accessory"
                      }`}
                    >
                      {url.pathname.includes("diamond")
                        ? "Diamonds"
                        : "Accessories"}
                    </Link>
                  ),
                },
              ]}
            />
          )}
        </div>
        <ChooseItem />
      </div>
      <div className="mt-10 w-full">
        <Outlet />
      </div>
    </div>
  );
}
