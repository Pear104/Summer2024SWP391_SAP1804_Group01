import { Button, Form, Input, notification } from "antd";
import { ArrowLeft, X } from "lucide-react";
import { Link, useNavigate } from "react-router-dom";
import TextEditor from "./components/TextEditor";
import * as z from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { POST } from "../../../utils/request";
import { useState } from "react";
import { FormItem } from "react-hook-form-antd";
import Loading from "../../../components/Loading";

const schema = z.object({
  title: z
    .string()
    .min(8, { message: "Invalid email" })
    .max(32, { message: "Email should be less than 32 characters" }),
  content: z.string().min(8, { message: "Required" }),
});
export default function NewBlog() {
  const [isLoading, setIsLoading] = useState(false);
  const { control, handleSubmit } = useForm({
    defaultValues: {
      title: "",
      content: "",
    },
    resolver: zodResolver(schema),
  });
  const [api, contextHolder] = notification.useNotification();
  const openNotification = () => {
    api.open({
      message: "Error",
      description: "You dont have permission",
      icon: <X color="#ff0000" />,
    });
  };
  const navigate = useNavigate();
  return (
    <div>
      {isLoading && <Loading />}
      {contextHolder}
      <div className="flex self-center items-center gap-2">
        <Link
          to="/admin/blogs"
          className="inline-block border border-black p-1"
        >
          <ArrowLeft />
        </Link>
        <div className="ml-2 text-2xl">Blogs</div>
      </div>
      <div className="bg-white rounded-lg my-4 p-4">
        <Form
          name="search_form"
          className=""
          layout="vertical"
          onFinish={handleSubmit(async (formData) => {
            console.log(formData);
            setIsLoading(true);
            const response = await POST("/api/Blogs", formData);
            setIsLoading(false);
            if (response) {
              navigate("/admin/blogs");
            } else {
              openNotification();
            }
          })}
        >
          <FormItem label="Title" name="title" control={control} required>
            <Input
              placeholder="Blog title"
              className="font-thin border p-2 rounded-md w-full"
            />
          </FormItem>
          <FormItem label="Content" name="content" control={control} required>
            {/* @ts-expect-error -text-editor */}
            <TextEditor />
          </FormItem>
          <Form.Item className="mt-8 mb-0">
            <div className="mt-8">
              <Button
                className="flex items-center px-4 py-5 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75"
                htmlType="submit"
              >
                CREATE
              </Button>
            </div>
          </Form.Item>
        </Form>
      </div>
      <div></div>
    </div>
  );
}
