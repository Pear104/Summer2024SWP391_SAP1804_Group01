import { Menu } from "antd";
import scrollTo from "../../../utils/scroll";
import {
  UserRoundCog,
  UserRound,
  ShoppingBasket,
  CircleUser,
  Wrench,
  LockKeyhole,
  ShieldAlert,
  ShieldCheck,
} from "lucide-react";

export default function SideNav() {
  const items = [
    {
      key: "why-datj",
      // icon: <UserRound size={20} />,
      label: "Profile",
    },
    {
      key: "our-team",
      // icon: <LockKeyhole size={20} />,
      label: "Change password",
    },
    {
      key: "how-to-buy",
      // icon: <LockKeyhole size={20} />,
      label: "Change password",
    },
    {
      key: "measure-guide",
      // icon: <UserRoundCog size={20} />,
      label: "Update profile",
    },
  ];
  return (
    <div className="sticky top-0 p-4">
      <Menu
        onClick={(e: any) => {
          scrollTo(e.key);
          scrollTo;
        }}
        className="border-transparent"
        defaultSelectedKeys={["/account"]}
        defaultOpenKeys={["account", "warranty"]}
        mode="inline"
        items={items}
      />
    </div>
  );
}
