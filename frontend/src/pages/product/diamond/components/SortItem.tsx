import { ChevronDown, ChevronUp } from "lucide-react";
import { useNavigate } from "react-router-dom";

const SortItem = ({
  property,
  params,
  setQueryUrl,
  type,
}: {
  property: string;
  params: URLSearchParams;
  setQueryUrl: any;
  type: string;
}) => {
  const navigate = useNavigate();
  return (
    <div
      className="w-[80px] text-center flex items-center justify-center"
      onClick={() => {
        const isDescending = params.get("IsDescending") === "true";
        params.set("IsDescending", (!isDescending).toString());
        params.set("SortBy", property);
        navigate(`/product/${type}?` + params.toString());
        setQueryUrl(`/api/${type}s?` + params.toString());
      }}
    >
      {property}{" "}
      {params.get("SortBy") == property &&
      params.get("IsDescending") === "false" ? (
        <ChevronUp size={20} />
      ) : (
        <ChevronDown size={20} />
      )}
    </div>
  );
};

export default SortItem;
