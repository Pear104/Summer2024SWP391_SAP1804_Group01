import { useEffect, useState } from "react";
import { GET, PUT } from "../../utils/request";
import { setCookie } from "../../utils/cookie";
import { FormItem } from "react-hook-form-antd";
import { useForm } from "react-hook-form";
import { Button, Form, Input } from "antd";
import { zodResolver } from "@hookform/resolvers/zod";
import jwtDecode from "jwt-decode";
import * as z from "zod";
import moment from "moment";
const schema = z
  .object({
    id: z.number(),
    currentPassword: z.string().min(8, "Current password is required"),
    newPassword: z
      .string()
      .min(8, "New password must be at least 8 characters long"),
    confirmPassword: z
      .string()
      .min(8, "Confirm password must be at least 8 characters long"),
  })
  .refine((data) => data.newPassword === data.confirmPassword, {
    message: "Passwords don't match",
    path: ["confirmPassword"],
  });
export default function ChangePassword() {
  const [profile, setProfile] = useState<any>(null);
  const [curPassword, setCurPassword] = useState<any>(null);
  const { control, handleSubmit, reset } = useForm({
    resolver: zodResolver(schema),
  });

  useEffect(() => {
    (async () => {
      const data = await GET("/api/Accounts/me");
      if (data) {
        console.log(data);
        setProfile(data);
        reset({
          id: data.accountId,
        });
      } else {
        setCookie("accessToken", "", 0);
        location.href = "/authentication/login";
      }
    })();
  }, [reset]);
  console.log("current chema");
  console.log(schema);
  return (
    <div className="ml-4 mt-4 mb-8">
      <div className="font-semibold mulish-regular text-2xl">
        CHANGE PASSWORD
      </div>
      <div className="gap-4 pt-6 flex flex-col">
        <div>Email: {profile?.email}</div>

        <Form
          layout="vertical"
          autoComplete="off"
          className="w-full grid grid-cols-2 gap-x-4"
          onFinish={handleSubmit(async (formData) => {
            // setIsLoading(true);
            if (formData.currentPassword !== profile?.password) {
              console.log("Incorrect current password");
              return; //current password is not correct
            }
            await PUT(
              "/api/Accounts/ChangePassword" + formData.id,
              formData.newPassword
            );
            location.href = "/account";
          })}
        >
          <div className="flex flex-col">
            <FormItem
              className="hidden"
              label="Account Id"
              name="accountId"
              control={control}
            >
              <Input
                className="hidden"
                disabled
                defaultValue={profile?.accountId}
              />
            </FormItem>
            <FormItem
              label={<p className="border-b border-black">Current Password</p>}
              name="currentPassword"
              control={control}
            >
              <Input.Password className="h-10" defaultValue="" />
            </FormItem>
            <FormItem
              label={<p className="border-b border-black">New Password</p>}
              name="newPassword"
              control={control}
            >
              <Input.Password className="h-10" defaultValue="" />
            </FormItem>
            <FormItem
              label={<p className="border-b border-black">Confirm Password</p>}
              name="confirmPassword"
              control={control}
            >
              <Input.Password className="h-10" defaultValue="" />
            </FormItem>
            <Form.Item className="mb-0">
              <Button
                className="w-[200px] uppercase hover:scale-95 font-bold text-white bg-primary py-5 flex items-center justify-center"
                htmlType="submit"
              >
                Save Change
              </Button>
            </Form.Item>
          </div>
        </Form>
      </div>
    </div>
  );
}
