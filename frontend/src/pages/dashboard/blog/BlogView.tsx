import { App, Button, Form, Input } from "antd";
import { ArrowLeft, Eye, EyeOff, ScrollText } from "lucide-react";
import { Link, useNavigate, useParams, useLocation } from "react-router-dom";
import TextEditor from "./components/TextEditor";
import * as z from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { DELETE, GET, POST, PUT } from "../../../utils/request";
import { useState } from "react";
import { FormItem } from "react-hook-form-antd";
import Loading from "../../../components/Loading";
import { useMutation, useQueries, useQueryClient } from "@tanstack/react-query";

const schema = z.object({
  title: z.string().min(8, { message: "Title must more than 8 characters" }),
  content: z
    .string()
    .min(20, { message: "Content must more than 20 characters" }),
});
export default function BlogView() {
  const location = useLocation();
  const navigate = useNavigate();
  const { blogId } = useParams();
  const [isLoading, setIsLoading] = useState(false);
  const [isHidden, setIsHidden] = useState(false);
  const queryClient = useQueryClient();
  const { control, handleSubmit, reset } = useForm({
    defaultValues: {
      title: "",
      content: "",
    },
    resolver: zodResolver(schema),
  });
  const [blog] = useQueries({
    queries: [
      {
        queryKey: ["blog", blogId, reset],
        queryFn: async () => {
          const data = await GET(`/api/Blogs/${blogId}`);
          if (data.blogId) {
            setIsHidden(data.isHidden);
            reset({
              title: data?.title,
              content: data?.content,
            });
          }
        },
      },
    ],
  });
  const mutatePost = useMutation({
    mutationFn: (blog: any) => {
      return POST("/api/Blogs", blog);
    },
    onSuccess: (data: any) => {
      message.success("Blog added successfully");
      queryClient.invalidateQueries({ queryKey: ["blogs"] });
      queryClient.invalidateQueries({ queryKey: ["blog"] });
      navigate(`/admin/blogs/detail/${data.blogId}`);
    },
  });
  const mutatePut = useMutation({
    mutationFn: (blog: any) => {
      return PUT(`/api/Blogs/${blogId}`, blog);
    },
    onSuccess: () => {
      message.success("Blog updated successfully");
      queryClient.invalidateQueries({ queryKey: ["blog"] });
      queryClient.invalidateQueries({ queryKey: ["blogs"] });
    },
  });
  const mutateDelete = useMutation({
    mutationFn: () => {
      return DELETE(`/api/Blogs/${blogId}/${!isHidden}`, "");
    },
    onSuccess: () => {
      message.success("Blog updated successfully");
      queryClient.invalidateQueries({ queryKey: ["blog"] });
      queryClient.invalidateQueries({ queryKey: ["blogs"] });
    },
  });
  const { message } = App.useApp();
  return (
    <div>
      {(blog.isLoading || isLoading) && <Loading />}
      <div className="flex justify-between">
        <div className="flex self-center items-center gap-2">
          <Link
            to="/admin/blogs"
            className="rounded-full inline-block px-4 border bg-black text-white p-1"
          >
            <ArrowLeft />
          </Link>
          <div className="ml-2 text-2xl">Blogs</div>
        </div>
        <div className="flex self-center items-center gap-2">
          <div
            onClick={async () => {
              mutateDelete.mutate();
            }}
            className="cursor-pointer flex self-center items-center gap-2 rounded-md py-2 px-4 border bg-black text-white p-1"
          >
            {!isHidden ? <EyeOff /> : <Eye />}
            <div className="ml-2 text-lg">{!isHidden ? "Hide" : "Show"}</div>
          </div>
          <a
            href={`/blogs/${blogId}`}
            target="_blank"
            className="flex self-center items-center gap-2 rounded-md py-2 px-4 border bg-black text-white p-1"
          >
            <ScrollText />
            <div className="ml-2 text-lg">View</div>
          </a>
        </div>
      </div>
      <div className="bg-white rounded-lg my-4 p-4">
        <Form
          name="search_form"
          className=""
          layout="vertical"
          onFinish={handleSubmit(async (formData) => {
            console.log(formData);
            setIsLoading(true);
            if (location.pathname.includes("detail")) {
              await mutatePut.mutate(formData);
            } else {
              await mutatePost.mutate(formData);
            }
            setIsLoading(false);
          })}
        >
          <FormItem label="Title" name="title" control={control} required>
            <Input
              placeholder="Blog title"
              className="font-thin border p-2 rounded-md w-full"
            />
          </FormItem>
          <FormItem label="Content" name="content" control={control} required>
            {/* @ts-expect-error -full-text-editor */}
            <TextEditor />
          </FormItem>
          <Form.Item className="mt-8 mb-0">
            <div className="mt-8">
              <Button
                className="flex items-center px-4 py-5 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75"
                htmlType="submit"
              >
                {location.pathname.includes("detail") ? "UPDATE" : "CREATE"}
              </Button>
            </div>
          </Form.Item>
        </Form>
      </div>
      <div></div>
    </div>
  );
}
