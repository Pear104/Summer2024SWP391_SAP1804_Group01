import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../../store/searchStore";
import scrollTo from "../../../../utils/scroll";

const AccessoryShapeFilter = ({
  children,
  title,
}: {
  title: string;
  children: React.ReactNode;
}) => {
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  const navigate = useNavigate();
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  return (
    <div
      className={`hover:border-black transition-all px-6 py-2 border rounded-md flex flex-col items-center gap-2 ${
        params.get("Shape") === title ? "border-black" : ""
      }`}
      onClick={() => {
        params.delete("PageNumber");
        if (params.get("Shape") === title) {
          params.delete("Shape");
        } else {
          params.set("Shape", title);
        }
        params.set("IsAvailability", "true");
        navigate("/product/accessory?" + params.toString());
        setQueryUrl(`/api/Accessories?${params.toString()}`);
        scrollTo("table-header", "center");
      }}
    >
      <div className="">{children}</div>
      <div className="text-xs">{title}</div>
    </div>
  );
};
export default AccessoryShapeFilter;
