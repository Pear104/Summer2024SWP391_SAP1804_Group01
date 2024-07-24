import { useEffect, useState } from "react";
import { GET, POST } from "../../utils/request";
import { Pagination, Empty, Modal, Rate, Form, App } from "antd";
import { useNavigate } from "react-router-dom";
import { useSearchStore } from "../../store/searchStore";
import { useQueries, useQueryClient, useMutation } from "@tanstack/react-query";
import OrderItem from "./components/OrderItem";
import TextArea from "antd/es/input/TextArea";
import LoadingOrderItem from "./components/LoadingOrderItem";

export default function OrderHistory() {
  useEffect(() => {
    setQueryUrl("/api/Order?");
  }, []);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [feedbackInfo, setFeedbackInfo] = useState({
    accessoryId: "",
    accessoryName: "",
    accessoryKarat: "",
    score: 1,
    content: "",
  });
  const { message } = App.useApp();
  const queryClient = useQueryClient();
  const mutation = useMutation({
    mutationFn: (newFeedback: any) => {
      return POST("/api/Feedbacks", newFeedback);
    },
    onSuccess: () => {
      message.success("Feedback created successfully");
      queryClient.invalidateQueries({ queryKey: ["orders"] });
    },
    onError: () => {
      message.error("Create feedback failed");
      queryClient.invalidateQueries({ queryKey: ["orders"] });
    },
  });
  const [form] = Form.useForm();

  const handleOk = () => {
    form
      .validateFields()
      .then(() => {
        mutation.mutate({
          ...feedbackInfo,
          content: form.getFieldValue("content"),
        });
        form.resetFields();
        setIsModalOpen(false);
      })
      .catch(() => {});
  };
  const handleCancel = () => {
    setIsModalOpen(false);
  };
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const navigate = useNavigate();
  const queryUrl = useSearchStore((state) => state.queryUrl);
  const setQueryUrl = useSearchStore((state) => state.setQueryUrl);
  const [orderHistories] = useQueries({
    queries: [
      {
        queryKey: ["orders", queryUrl],
        queryFn: () => GET(queryUrl),
        staleTime: 0,
      },
    ],
  });
  return (
    <div className="p-4 w-full">
      {/* Feedback modal */}
      <Modal
        className="w-[600px]"
        centered
        title={`${
          feedbackInfo.content == "" ? "Enter your" : "Your"
        } feedback for Accessory#${feedbackInfo.accessoryId}`}
        open={isModalOpen}
        onOk={handleOk}
        okButtonProps={{ disabled: feedbackInfo.content != "" }}
        onCancel={handleCancel}
      >
        <div>
          <div>
            <span className="font-bold">Name:</span>{" "}
            {feedbackInfo.accessoryName}
          </div>
          <div>
            <span className="font-bold">Karat:</span>{" "}
            {feedbackInfo.accessoryKarat}K
          </div>
        </div>
        <div className="flex gap-2 mt-2">
          <div className="mb-2 font-bold">Rating</div>
          <Rate
            allowClear={false}
            disabled={feedbackInfo.content != ""}
            value={feedbackInfo.score}
            onChange={(e) => {
              setFeedbackInfo({
                ...feedbackInfo,
                score: e,
              });
            }}
          />
        </div>
        <Form form={form} layout="vertical">
          <Form.Item
            label={<span className="font-bold">Comment</span>}
            name="content"
            rules={[
              {
                required: true,
                message: "Please input more than 20 characters",
              },
              {
                min: 20,
                message: "Please input more than 20 characters",
              },
              {
                max: 256,
                message: "Please input less than 256 characters",
              },
            ]}
          >
            <TextArea
              disabled={feedbackInfo.content != ""}
              rows={10}
              className="border text-base py-2 px-2 without-ring w-full rounded-none text-black"
              placeholder="Write your comment"
            />
          </Form.Item>
        </Form>
      </Modal>
      {/* Feedback modal */}
      {/* <Modal
        className="w-[400px]"
        centered
        title="Enter new unit price (USD) for: "
        open={isModalOpen}
        onOk={handleOk}
        onCancel={handleCancel}
      >
        <div className="mb-2 tracking-wider"></div>
      </Modal> */}
      <div className="text-2xl font-serif mb-6">ORDER HISTORY</div>
      {orderHistories?.data?.orders?.length != 0 ? (
        <div className="w-full">
          {orderHistories?.data?.orders?.map((order: any, index: number) => (
            <OrderItem
              form={form}
              key={index}
              setFeedbackInfo={setFeedbackInfo}
              setIsModalOpen={setIsModalOpen}
              order={order}
            />
          ))}
        </div>
      ) : (
        <div>
          <Empty
            description="You haven't placed any orders yet"
            className="text-xl"
            imageStyle={{ scale: 2, height: 300 }}
          />
        </div>
      )}
      <div>
        {orderHistories?.isLoading && (
          <>
            {[1, 2, 3, 4, 5].map((key) => (
              <LoadingOrderItem key={key} />
            ))}
          </>
        )}
      </div>
      <div className="mt-4 flex justify-center">
        {orderHistories?.data?.totalCount > orderHistories?.data?.pageSize ? (
          <Pagination
            showTotal={(total, range) =>
              `${range[0]}-${range[1]} of ${total} items`
            }
            current={Number(orderHistories.data?.currentPage)}
            defaultCurrent={
              (orderHistories?.data &&
                orderHistories?.data.currentPage.toString()) ||
              "1"
            }
            total={orderHistories?.data?.totalCount}
            pageSize={Number(orderHistories.data?.pageSize)}
            showSizeChanger={false}
            onChange={(page, _pageSize) => {
              params.set("PageNumber", page.toString());
              navigate(url.pathname + "?" + params.toString());
              setQueryUrl("/api/Order?" + params.toString());
            }}
          />
        ) : (
          ""
        )}
      </div>
      <div className="flex justify-center mt-10">
        <a
          className="w-96 h-12 bg-black text-white text-lg flex justify-center items-center rounded-md cursor-pointer"
          href="/product/diamond"
        >
          Continue Shopping
        </a>
      </div>
    </div>
  );
}
