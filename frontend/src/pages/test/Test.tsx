import { GET } from "../../utils/request";
import { useAuthStore } from "../../store/authStore";
import { useQuery } from "@tanstack/react-query";
import Loading from "../../components/Loading";

export default function Test() {
  // const [diamonds, setDiamonds] = useState([]);
  // const getData = async () => {
  //   const data = await GET("/diamond");
  //   console.log(data);
  //   setDiamonds(data);
  // };
  const { data: diamonds, isLoading } = useQuery({
    queryKey: ["diamonds"],
    queryFn: () => GET("/api/Diamonds"),
  });

  const count = useAuthStore((state) => state.count);
  const increase = useAuthStore((state) => state.increase);
  return (
    <div className="w-full mt-24 h-[400px] flex justify-center">
      {isLoading && <Loading />}
      <Loading />
      {count}
      <div className="w-[300px] h-[300px] bg-slate-400" onClick={increase}>
        Click
      </div>
      <div className="flex justify-center flex-col">
        {/* <Button onClick={getData}>Get data</Button> */}
        <div className="flex flex-col">
          {diamonds?.map((diamond: any) => {
            return (
              <div className="flex gap-8">
                <div>{diamond.carat}</div>
                <div>{diamond.cut}</div>
                <div>{diamond.clarity}</div>
                <div>{diamond.color}</div>
                <div>{diamond.polish}</div>
                <div>{diamond.symmetry}</div>
                <div>{diamond.flourescence}</div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}
