import { Avatar, Divider, Rate } from "antd";
import { formatAvatarName } from "../../../../utils/formatter";
import moment from "moment";
import { Check } from "lucide-react";

export default function FeedbackItem({ feedback }: { feedback: any }) {
  return (
    <div className="pt-6">
      <div className="flex">
        <Avatar className="w-[60px] h-[60px] text-3xl flex justify-center items-center">
          {formatAvatarName(feedback?.username)}
        </Avatar>
        <div className="ml-4">
          <div className="flex gap-4">
            <div className="text-xl font-bold mb-2">{feedback?.username}</div>
            <div className="text-xl mb-2 flex items-center text-green-400">
              Verified Buyer <Check className="ml-2" size={20} />
            </div>
          </div>
          <Rate value={feedback?.score} />
        </div>
      </div>
      <div className="text-xl mt-4">{feedback?.content}</div>
      <div className="text-sm pt-4 pr-10">
        {moment(feedback?.createdAt).format("DD/MM/YYYY HH:mm")}
      </div>
      <Divider />
    </div>
  );
}
