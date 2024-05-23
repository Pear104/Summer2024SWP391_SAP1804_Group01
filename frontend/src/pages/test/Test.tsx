import { Button } from "antd";
import { GET } from "../../utils/request";
import { useState } from "react";

export default function Test() {
  const [diamonds, setDiamonds] = useState([]);
  const getData = async () => {
    const data = await GET("/diamond");
    console.log(data);
    setDiamonds(data);
  };
  return (
    <div className="w-full mt-24 h-[400px] flex justify-center">
      <div className="flex justify-center flex-col">
        <Button onClick={getData}>Get data</Button>
        <div className="flex flex-col">
          {diamonds.map((diamond: any) => {
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
