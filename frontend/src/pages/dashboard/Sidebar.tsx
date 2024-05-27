import { Gem } from "lucide-react";
import React from "react";
import {
  DASHBOARD_SIDEBAR_BOTTOM_LINKS,
  DASHBOARD_SIDEBAR_LINKS,
} from "./navigation";
import { Link, useLocation } from "react-router-dom";
import classNames from "classnames";
import { HiOutlineLogout } from "react-icons/hi";

const linkClasses =
  "flex items-center gap-2 font-light px-3 py-2 hover:bg-neutral-700 hover:no-underline active:bg-neutral-600 round-sm text-base";

export default function Sidebar() {
  return (
    <div className="flex flex-col bg-neutral-900 w-60 p-3 text-white">
      <div className="flex items-center gap-2 px-1 py-3">
        <Gem strokeWidth={1.75} />
        <span className="text-neutral-100 text-xl">DatJ</span>
      </div>

      <div className="flex-1 py-8 flex flex-col gap-0.5">
        {DASHBOARD_SIDEBAR_LINKS.map((items) => (
          <SidebarLink key={items.key} items={items} />
        ))}
      </div>
      <div className="flex flex-col gap-0.5 pt-2 border-t border-neutral-700">
        {DASHBOARD_SIDEBAR_BOTTOM_LINKS.map((items) => (
          <SidebarLink key={items.key} items={items} />
        ))}

        <Link
          to="/"
          className={classNames(" text-red-500 cursor-pointer", linkClasses)}
        >
          <span className="text-xl">
            <HiOutlineLogout />
          </span>
          Logout
        </Link>
      </div>
    </div>
  );
}

function SidebarLink({ items }: { items: any }) {
  const { pathname } = useLocation();
  return (
    <Link
      to={items.path}
      className={classNames(
        pathname === items.path
          ? "text-amber-300 bg-neutral-700"
          : "text-white",
        linkClasses
      )}
    >
      <span className="text-xl">{items.icon}</span>
      {items.label}
    </Link>
  );
}
