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
    <>
      {data?.feedbacks?.map((feedback: any) => (
        <FeedbackItem feedback={feedback} />
      ))}
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
    </>
  );
}
