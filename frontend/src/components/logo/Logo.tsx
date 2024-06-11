import { DiamondPlus } from "lucide-react";
import { Link } from "react-router-dom";

export default function Logo() {
  return (
    <Link className="flex gap-2 items-center" to="/">
      <DiamondPlus size={27} strokeWidth={2} />
      <div className="cinzel-decorative-regular italic font-semibold text-3xl flex">
        DAT J
      </div>
      <DiamondPlus size={27} strokeWidth={2} />
    </Link>
  );
}
