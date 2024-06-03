import { useQuery } from "@tanstack/react-query";
import { GET } from "../../utils/request";
import UploadImage from "./UploadImage";

export default function Test() {
  const { data } = useQuery({
    queryKey: ["diamondPrice"],
    queryFn: () => GET("/api/DiamondPrices"),
  });
  if (data) {
    console.log(data.length);
  }
  return (
    <div className="w-full mt-24 h-[400px] flex justify-center">
      <div className="flex justify-center flex-col">
        <div className="flex flex-col">
          <UploadImage />
        </div>
      </div>
    </div>
  );
}
