import { Undo2, Truck, Wrench, Gem, Sparkles, HandCoins } from "lucide-react";

const data = [
  {
    icon: <Gem color="white" />,
    lable: "Pure original diamonds",
    content: (
      <div>
        <ul className="list-disc pl-4">
          <li>
            Authenticity Guaranteed: Our diamonds are sourced directly from
            trusted suppliers, ensuring purity and quality.
          </li>
          <li>
            Secure Packaging: Each diamond is carefully packaged and sealed to
            maintain its original brilliance.
          </li>
          <li>
            Ethically Sourced: We prioritize ethical practices in the sourcing
            and extraction of our diamonds.
          </li>
        </ul>
      </div>
    ),
  },
  {
    icon: <Sparkles color="white" />,
    lable: "Variety of accessories",
    content: (
      <div>
        <ul className="list-disc pl-4">
          <li>
            Diverse Selection: Explore a wide range of accessories, from elegant
            jewelry to stylish handbags.
          </li>
          <li>
            Easy Returns: Enjoy hassle-free returns within 30 days, with free
            shipping for exchanges or refunds.
          </li>
          <li>
            Quality Assurance: Our accessories are crafted with attention to
            detail and quality materials.
          </li>
        </ul>
      </div>
    ),
  },
  {
    icon: <HandCoins color="white" />,
    lable: "Good prices",
    content: (
      <div>
        <ul className="list-disc pl-4">
          <li>
            Affordable Options: Discover a selection of high-quality products at
            competitive prices.
          </li>
          <li>
            Value for Money: Get the best value for your purchase with our
            cost-effective pricing.
          </li>
          <li>
            Discounts Available: Stay updated on promotions and discounts to
            save on your favorite items.
          </li>
        </ul>
      </div>
    ),
  },
  {
    icon: <Undo2 color="white" />,
    lable: "Returns are free",
    content: (
      <div>
        <ul className="list-disc pl-4">
          <li>
            Hassle-Free Returns: Enjoy the convenience of free returns or
            exchanges within a 30-day window.
          </li>
          <li>
            Shipping Included: Receive a prepaid return shipping label for easy
            returns at no additional cost.
          </li>
          <li>
            Secure Refunds: Rest assured that your returns are processed swiftly
            and securely.
          </li>
        </ul>
      </div>
    ),
  },
  {
    icon: <Truck color="white" />,
    lable: "Free shipping",
    content: (
      <div>
        <ul className="list-disc pl-4">
          <li>
            Complimentary Shipping: Benefit from free shipping on all orders to
            your preferred address.
          </li>
          <li>
            Fast Delivery: Experience prompt delivery services for a seamless
            shopping experience.
          </li>
          <li>
            Reliable Service: Trust in our commitment to timely and efficient
            shipping practices.
          </li>
        </ul>
      </div>
    ),
  },
  {
    icon: <Wrench color="white" />,
    lable: "Product warranty",
    content: (
      <div>
        <ul className="list-disc pl-4">
          <li>
            Extended Warranty: Enjoy peace of mind with our comprehensive
            product warranty coverage.
          </li>
          <li>
            Quality Assurance: Our products are backed by a reliable warranty
            ensuring durability and performance.
          </li>
          <li>
            Customer Support: Contact our dedicated support team for any
            warranty-related queries or assistance.
          </li>
        </ul>
      </div>
    ),
  },
];

const WhyItem = ({
  icon,
  lable,
  content,
}: {
  icon: any;
  lable: string;
  content: any;
}) => {
  return (
    <div className="border bg-slate-50 rounded-lg p-4">
      <div className="flex items-center gap-2">
        <div className="p-2 bg-indigo-500 rounded-full">{icon}</div>
        <div className="text-xl mulish-regular font-bold">{lable}</div>
      </div>
      <div className="text-[13px] mt-2">{content}</div>
    </div>
  );
};

export default function WhyDatJ() {
  return (
    <>
      <div id="why-datj" className="bg-blue-50 rounded-lg p-4 mb-4">
        <h2 className="text-2xl font-bold mb-4 text-blue-300">Why DATJ?</h2>
        <div className="grid grid-cols-3 gap-x-4 gap-y-4">
          {data.map((item) => (
            <WhyItem
              icon={item.icon}
              lable={item.lable}
              content={item.content}
            />
          ))}
        </div>
      </div>
    </>
  );
}
