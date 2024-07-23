import { DiamondPlus } from "lucide-react";
import { Link } from "react-router-dom";

export default function Logo({ size = 27 }: { size?: number }) {
  return (
    <Link className="flex gap-2 items-center" to="/">
      <DiamondPlus size={size} strokeWidth={2} />
      <div className="cinzel-decorative-regular italic font-semibold text-3xl flex sm:text-xl">
        DAT J
      </div>
      <DiamondPlus size={size} strokeWidth={2} />
    </Link>
  );
}
