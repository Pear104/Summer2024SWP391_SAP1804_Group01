import { UserOutlined } from "@ant-design/icons";
import { zodResolver } from "@hookform/resolvers/zod";
import { Button, Divider, Form, Input } from "antd";
import { CircleArrowRight } from "lucide-react";
import { useForm } from "react-hook-form";
import { FormItem } from "react-hook-form-antd";
import * as z from "zod";
import { GOOGLE_GET_INFO, POST } from "../../utils/request";
import { setCookie } from "../../utils/cookie";
import { useEffect, useState } from "react";
import Loading from "../../components/Loading";
import { useGoogleLogin } from "@react-oauth/google";
import { useAuthStore } from "../../store/authStore";
import { useNavigate } from "react-router-dom";
const GoogleIcon = () => {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      x="0px"
      y="0px"
      className="w-6 h-6"
      viewBox="0 0 48 48"
    >
      <path
        fill="#FFC107"
        d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"
      ></path>
      <path
        fill="#FF3D00"
        d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"
      ></path>
      <path
        fill="#4CAF50"
        d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"
      ></path>
      <path
        fill="#1976D2"
        d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"
      ></path>
    </svg>
  );
};

const schema = z.object({
  email: z
    .string()
    .email()
    .min(8, { message: "Invalid email!" })
    .max(32, { message: "Invalid email!" }),
  password: z
    .string()
    .min(8, { message: "Password must be at least 8 characters" }),
});
export default function Login() {
  const [isLoading, setIsLoading] = useState(false);
  const { control, handleSubmit, setError } = useForm({
    defaultValues: { email: "", password: "" },
    resolver: zodResolver(schema),
  });
  const setGoogleProfile = useAuthStore((state) => state.setGoogleProfile);
  const navigate = useNavigate();
  const login = useGoogleLogin({
    onSuccess: async (codeResponse) => {
      setIsLoading(true);
      const data = await GOOGLE_GET_INFO(
        "https://www.googleapis.com/oauth2/v1/userinfo",
        codeResponse
      );
      if (data?.email) {
        const tokenData = await POST("/api/Authentication/login-google", {
          email: data?.email,
        });
        setIsLoading(false);
        if (!tokenData.token) {
          setGoogleProfile({
            email: data.email,
            name: data.name,
          });
          navigate("/authentication/register");
        } else {
          setCookie("accessToken", tokenData.token, 7);
          navigate("/account");
        }
      }
    },
    onError: (error) => console.log("Login Failed:", error),
  });

  return (
    <div className="grid grid-cols-2 gap-4 py-16 px-32">
      {isLoading && <Loading />}
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
            DATJ DIAMOND .Inc
          </div>
          <Form
            layout="vertical"
            autoComplete="off"
            className="w-[440px] flex flex-col gap-1"
            onFinish={handleSubmit(async (data) => {
              setIsLoading(true);
              const authResponse = await POST(
                "/api/Authentication/login",
                data
              );
              if (authResponse.token) {
                setCookie("accessToken", authResponse.token, 7);
                location.href = "/account";
              } else {
                setIsLoading(false);
                setError("password", {
                  type: "manual",
                  message: "Email not found or password incorrect!",
                });
              }
            })}
          >
            <FormItem name="email" control={control} required>
              <Input
                className="border text-base border-primary py-2 px-4 without-ring w-[440px] rounded-none"
                suffix={<UserOutlined className="opacity-50" />}
                placeholder="Email"
              />
            </FormItem>
            <FormItem
              name="password"
              control={control}
              required
              className="mb-2"
            >
              <Input.Password
                placeholder="Password"
                className="border text-base border-primary py-2 px-4 without-ring w-[440px] rounded-none"
              />
            </FormItem>
            <div className="mb-4">
              <a
                href="/authentication/forget-password"
                className="pb-1 text-primary border-b transition-all duration-200 border-b-transparent hover:border-b-primary"
              >
                Forgot your password?
              </a>
            </div>
            <Form.Item className="mb-0">
              <Button
                className="w-full hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                type="default"
                htmlType="submit"
              >
                LOGIN
              </Button>
            </Form.Item>
          </Form>
          <Divider>or</Divider>
          <Button
            className="mb-4 gap-3 w-full hover:scale-95 mulish-regular text-base font-bold text-black bg-white py-6 flex items-center justify-center"
            type="default"
            onClick={() => login()}
          >
            <GoogleIcon />
            LOGIN WITH GOOGLE
          </Button>
          <div className="flex justify-between text-sm">
            <div>Doesn't have an account?</div>
            <a
              href="/authentication/register"
              className="flex items-center gap-2 group font-semibold"
            >
              <span className="text-primary border-b border-transparent transition-all group-hover:border-primary">
                Create Account
              </span>
              <CircleArrowRight />
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}
