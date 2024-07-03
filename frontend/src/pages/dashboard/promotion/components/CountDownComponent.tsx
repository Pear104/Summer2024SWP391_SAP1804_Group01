import { Statistic, Typography } from "antd";
const { Countdown } = Statistic;
const { Text } = Typography;

export const CountdownComponent = ({ startTime, endTime }: any) => {
  const startTimestamp = new Date(startTime).getTime();
  const endTimestamp = new Date(endTime).getTime();
  const now = Date.now();

  // Hàm xử lý khi đếm ngược kết thúc
  const onFinish = () => {
    console.log("Countdown finished");
  };
  // console.log("isExpired", isExpired);
  let content;
  if (now < startTimestamp) {
    content = (
      <Text type="warning" className="text-xl font-bold p-0 m-0">
        Pending start
      </Text>
    );
  } else if (now >= startTimestamp && now <= endTimestamp) {
    content = (
      <Countdown
        value={endTimestamp}
        onFinish={onFinish}
        format="D[d] H[h] m[m] s[s]"
      />
    );
  } else {
    content = (
      <Text type="danger" className=" text-xl font-bold p-0 m-0">
        Expired
      </Text>
    );
  }
  return <div className=" text-center p-0 m-0">{content}</div>;
};
