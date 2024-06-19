import { Menu } from "antd";
import scrollTo from "../../../utils/scroll";

export default function SideNav() {
  const items = [
    {
      key: "why-datj",
      // icon: <UserRound size={20} />,
      label: "Why DatJ",
    },
    {
      key: "our-team",
      // icon: <LockKeyhole size={20} />,
      label: "About us",
    },
    {
      key: "how-to-buy",
      // icon: <LockKeyhole size={20} />,
      label: "How to buy",
    },
    {
      key: "measure-guide",
      // icon: <UserRoundCog size={20} />,
      label: "How to measure finger size",
    },
  ];
  return (
    <div className="sticky top-0 p-4">
      <Menu
        onClick={(e: any) => {
          scrollTo(e.key, "center");
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
