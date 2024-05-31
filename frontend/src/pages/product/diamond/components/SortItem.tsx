import { ChevronDown } from "lucide-react";
import { useNavigate } from "react-router-dom";

const SortItem = ({
  property,
  params,
  setFilterProperty,
}: {
  property: string;
  params: URLSearchParams;
  setFilterProperty: any;
}) => {
  const navigate = useNavigate();
  return (
    <div
      className="w-[80px] text-center flex gap-2 items-center"
      onClick={() => {
        setFilterProperty(property);
        params.set("SortBy", property);
        console.log(params.toString());
        navigate("/product/diamond?" + params.toString());
      }}
    >
      {property} <ChevronDown size={20} />
    </div>
  );
};

export default SortItem;
