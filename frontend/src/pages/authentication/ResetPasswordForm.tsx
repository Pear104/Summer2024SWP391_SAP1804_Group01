import { zodResolver } from "@hookform/resolvers/zod";
import { Button, Form, Input } from "antd";
import { useForm } from "react-hook-form";
import { POST } from "../../utils/request";
import { setCookie } from "../../utils/cookie";
import { FormItem } from "react-hook-form-antd";
import { UserOutlined } from "@ant-design/icons";
import { CircleArrowLeft, CircleArrowRight } from "lucide-react";
import * as z from "zod";
import { jwtDecode } from "jwt-decode";

const schema = z
  .object({
    email: z
      .string()
      .email({ message: "Invalid email!" })
      .min(8, { message: "Email must be at least 8 characters" })
      .max(32, { message: "Email must be at most 32 characters" }),
    password: z
      .string()
      .min(8, { message: "Password must be at least 8 characters" }),
    confirmPassword: z
      .string()
      .min(8, { message: "Confirm Password must be at least 8 characters" }),
  })
  .superRefine(({ confirmPassword, password }, ctx) => {
    if (confirmPassword !== password) {
      ctx.addIssue({
        code: "custom",
        message: "The passwords did not match",
        path: ["confirmPassword"],
      });
    }
  });
export default function ResetPasswordForm() {
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  const decoded = jwtDecode(params.get("token") || "") as any;
  setCookie("accessToken", params.get("token") || "", 7);

  const { control, handleSubmit, setError } = useForm({
    defaultValues: { email: decoded.email, password: "", confirmPassword: "" },
    resolver: zodResolver(schema),
  });

  return (
    <div className="grid grid-cols-2 gap-4 py-16 px-32">
      <div className="col-span-1">
        <div
          className="aspect-square bg-contain bg-no-repeat w-full"
          style={{
            backgroundImage: "url(/images/bracelets.6c0c2.jpg)",
          }}
        ></div>
      </div>
      <div className="col-span-1 flex justify-center items-start">
        <div className="flex flex-col justify-center">
          <div className="mb-10 pt-10 playfair-display-regular text-3xl font-bold text-center">
            Reset Password
          </div>
          <Form
            layout="vertical"
            autoComplete="off"
            className="w-[440px] flex flex-col gap-1"
            onFinish={handleSubmit(async (data) => {
              console.log(data);

              const authResponse = await POST(
                "/api/Authentication/confirm-password",
                data
              );
              if (authResponse.token) {
                setCookie("accessToken", authResponse.token, 7);
                location.href = "/account";
              } else {
                setError("email", {
                  type: "manual",
                  message: "Email not found!",
                });
              }
            })}
          >
            <FormItem name="email" control={control} required>
              <Input
                className="text-black border text-base border-primary py-2 px-4 without-ring w-[440px] rounded-none"
                suffix={<UserOutlined className="opacity-50" />}
                placeholder="Email"
                disabled
                // value={}
              />
            </FormItem>
            <FormItem name="password" control={control} required>
              <Input.Password
                placeholder="New Password"
                className="border text-base border-primary py-2 px-4 without-ring w-[440px] rounded-none"
              />
            </FormItem>
            <FormItem name="confirmPassword" control={control} required>
              <Input.Password
                placeholder="Confirm Password"
                className="border text-base border-primary py-2 px-4 without-ring w-[440px] rounded-none"
              />
            </FormItem>
            <Form.Item>
              <Button
                className="w-full hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                type="default"
                htmlType="submit"
              >
                RESET PASSWORD
              </Button>
            </Form.Item>
          </Form>
          <div className="flex justify-between">
            <a
              href="/authentication/login"
              className="text-primary items-center flex gap-2 pb-1 font-semibold border-b transition-all duration-200 "
            >
              <CircleArrowLeft size={20} absoluteStrokeWidth />
              <div className="border-b border-b-transparent hover:border-b-primary">
                Login
              </div>
            </a>
            <a
              href="/authentication/register"
              className="flex items-center gap-2 group font-semibold"
            >
              <span className="text-primary border-b border-transparent transition-all group-hover:border-primary">
                Create Account
              </span>
              <CircleArrowRight size={20} absoluteStrokeWidth />
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}
