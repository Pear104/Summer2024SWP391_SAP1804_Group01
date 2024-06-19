import { Empty, Pagination } from "antd";
import FeedbackItem from "./FeedbackItem";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../../../store/searchStore";

export default function AccessoryFeedback({ data }: { data: any }) {
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  console.log(data);
  return (
    <div className="w-[1200px]">
      <div className="w-full text-2xl font-bold mt-4 pb-4 border-b border-black">
        Accessory Review
      </div>
      {data?.feedbacks?.map((feedback: any) => (
        <FeedbackItem feedback={feedback} />
      ))}
      {data?.feedbacks?.length == 0 && (
        <Empty
          description="This product doesn't have any feedback yet"
          className="text-xl py-10"
          imageStyle={{ height: 200 }}
        />
      )}
      <div className="flex justify-center border-b items-center px-8 py-4 mt-4">
        {data?.feedbacks?.length != 0 && (
          <Pagination
            showTotal={(total, range) =>
              `${range[0]}-${range[1]} of ${total} items`
            }
            className="text-center"
            current={data?.currentPage}
            total={data?.totalCount}
            pageSize={data?.pageSize}
            onChange={(page) => {
              params.set("PageNumber", page.toString());
              navigate(url.pathname + "?" + params.toString());
              setQueryUrl("/api/Feedbacks?" + params.toString());
            }}
          />
        )}
      </div>
    </div>
  );
}
