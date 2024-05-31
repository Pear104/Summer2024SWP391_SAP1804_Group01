import React, { useEffect, useState } from "react";
import { GET } from "../../utils/request";
import { setCookie } from "../../utils/cookie";
import { FormItem } from "react-hook-form-antd";
import { useForm } from "react-hook-form";
import { Button, Form, Input, Select } from "antd";
import { useAuthStore } from "../../store/authStore";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";
import { ProfileFilled } from "@ant-design/icons";

const phoneRegex = new RegExp(
  /^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$/
);
const schema = z.object({
  name: z
    .string()
    .min(6, { message: "Name should be at least 6 characters" })
    .max(32, { message: "Name should be less than 32 characters" }),
  phoneNumber: z
    .string()
    .regex(phoneRegex, "Invalid phone number!")
    .min(10, "Invalid phone number!")
    .max(16, "Invalid phone number!"),
  address: z.string().min(1, { message: "Required" }),
  birthday: z.coerce.date(),
  gender: z.string().min(1, { message: "Required" }),
});

export default function EditAccount() {
  const [profile, setProfile] = useState<any>(null);
  const googleProfile = useAuthStore((state) => state.googleProfile);
  const { control, handleSubmit, setError } = useForm({
    defaultValues: {
      email: profile && profile.email,
      gender: profile && profile.gender,
      name: profile && profile.name,
      phoneNumber: profile && profile.phoneNumber,
      address: profile && profile.address,
      birthday: profile && profile.birthday,
    },
    resolver: zodResolver(schema),
  });

  useEffect(() => {
    (async () => {
      const data = await GET("/api/Accounts/me");
      if (data) {
        console.log(data);
        setProfile(data);
      } else {
        setCookie("accessToken", "", 0);
        location.href = "/authentication/login";
      }
    })();
  }, []);

  return (
    <div className="ml-10">
      <div className="font-semibold mulish-regular text-2xl">
        ACCOUNT DETAIL
      </div>
      <div>
        <div>Email</div>
        <div>{profile?.email}</div>

        <Form
          layout="vertical"
          autoComplete="off"
          className="w-[440px] flex flex-col gap-[2px]"
        >
          <FormItem label="Name" name="name" control={control}>
            <Input defaultValue={profile?.name}></Input>
          </FormItem>

          <Form.Item className="mb-0">
            <Button
              className="w-full hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
              htmlType="submit"
            >
              Save Change
            </Button>
          </Form.Item>
        </Form>
      </div>
    </div>
  );
}
