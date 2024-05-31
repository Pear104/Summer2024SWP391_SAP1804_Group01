import { ChevronDown } from "lucide-react";
import { useNavigate } from "react-router-dom";

const SortItem = ({
  property,
  params,
  setFilterProperty,
  setQueryUrl,
}: {
  property: string;
  params: URLSearchParams;
  setFilterProperty: any;
  setQueryUrl: any;
}) => {
  const navigate = useNavigate();
  return (
    <div
      className="w-[80px] text-center flex items-center justify-center"
      onClick={() => {
        setFilterProperty(property);
        params.set("SortBy", property);
        navigate("/product/diamond?" + params.toString());
      }}
    >
      {property} <ChevronDown size={20} />
    </div>
  );
};

export default SortItem;
