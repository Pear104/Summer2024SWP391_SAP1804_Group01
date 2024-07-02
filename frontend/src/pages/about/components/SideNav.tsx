import { Menu } from "antd";
import scrollTo from "../../../utils/scroll";

export default function SideNav() {
  const items = [
    {
      key: "about",
      label: "About",
      children: [
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
      ],
    },
    // {
    //   key: "policies",
    //   label: "Policies",
    //   children: [
    //     {
    //       key: "return-policy",
    //       label: "Return Policy",
    //     },
    //     {
    //       key: "payment-policy",
    //       label: "Payment Policy",
    //     },
    //     {
    //       key: "privacy-policy",
    //       label: "Privacy Policy",
    //     },
    //   ],
    // },
    {
      key: "contact",
      label: "Contact",
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
