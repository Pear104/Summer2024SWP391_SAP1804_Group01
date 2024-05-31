import React, { useEffect, useState } from "react";
import { GET, PUT } from "../../utils/request";
import { setCookie } from "../../utils/cookie";
import { FormItem } from "react-hook-form-antd";
import { useForm } from "react-hook-form";
import { Button, DatePicker, Form, Input, Select } from "antd";
import { useAuthStore } from "../../store/authStore";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";
import { ProfileFilled } from "@ant-design/icons";
import moment from "moment";

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
  id: z.number(),
});

export default function EditAccount() {
  const [profile, setProfile] = useState<any>(null);
  const googleProfile = useAuthStore((state) => state.googleProfile);
  const { control, handleSubmit, setError, reset } = useForm({
    resolver: zodResolver(schema),
  });

  useEffect(() => {
    (async () => {
      const data = await GET("/api/Accounts/me");
      if (data) {
        console.log(data); //asdad
        setProfile(data);
        reset({
          email: data.email,
          gender: data.gender,
          name: data.name,
          phoneNumber: data.phoneNumber,
          address: data.address,
          birthday: moment(data.birthday),
          id: data.accountId,
        });
      } else {
        setCookie("accessToken", "", 0);
        location.href = "/authentication/login";
      }
    })();
  }, [reset]);
  return (
    <div className="ml-10">
      <div className="font-semibold mulish-regular text-2xl">
        ACCOUNT DETAIL
      </div>
      <div className="gap-4 pt-6 flex flex-col">
        <div>Email: {profile?.email}</div>

        <Form
          layout="vertical"
          autoComplete="off"
          className="w-[440px] flex flex-col gap-[2px]"
          onFinish={handleSubmit(async (formData) => {
            // setIsLoading(true);
            console.log(formData);
            console.log("Ahihi");
            const data = await PUT("/api/Accounts/" + formData.id, formData);
            console.log("put data: " + data);
            window.location.reload();
          })}
        >
          <Input hidden defaultValue={profile?.id} />

          <FormItem label="Name" name="name" control={control}>
            <Input defaultValue={profile?.name} />
          </FormItem>
          <FormItem label="Phone Number" name="phoneNumber" control={control}>
            <Input defaultValue={profile?.phoneNumber} />
          </FormItem>
          <FormItem label="Address" name="address" control={control}>
            <Input defaultValue={profile?.address} />
          </FormItem>
          <FormItem label="Birthday" name="birthday" control={control}>
            <DatePicker
              defaultValue={profile ? moment(profile.birthday) : null}
            />
          </FormItem>
          <FormItem label="Gender" name="gender" control={control}>
            <Select
              size="large"
              className="text-sm w-[120px] border border-primary h-[38px]"
              options={[
                { value: "Female", label: "Female" },
                { value: "Male", label: "Male" },
                { value: "Other", label: "Other" },
              ]}
              defaultValue={profile?.gender}
            />
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
