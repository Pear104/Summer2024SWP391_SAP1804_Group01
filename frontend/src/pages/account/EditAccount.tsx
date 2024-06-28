import { useEffect, useState } from "react";
import { GET, PUT } from "../../utils/request";
import { setCookie } from "../../utils/cookie";
import { FormItem } from "react-hook-form-antd";
import { useForm } from "react-hook-form";
import { Button, DatePicker, Form, Input, Select } from "antd";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";
import moment from "moment";
import dayjs from "dayjs";
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
  const { control, handleSubmit, reset } = useForm({
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
    <div className="ml-4 mt-4 mb-8">
      <div className="font-semibold mulish-regular text-2xl">
        ACCOUNT DETAIL
      </div>
      <div className="gap-4 pt-6 flex flex-col">
        <div>Email: {profile?.email}</div>

        <Form
          layout="vertical"
          autoComplete="off"
          className="w-full grid grid-cols-2 gap-x-4"
          onFinish={handleSubmit(async (formData) => {
            // setIsLoading(true);
            await PUT("/api/Accounts/" + formData.id, formData);
            location.href = "/account";
          })}
        >
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
            label={<p className="border-b border-black">Name</p>}
            // label="Name"
            name="name"
            control={control}
          >
            <Input className="h-10" defaultValue={profile?.name} />
          </FormItem>

          <FormItem
            label={<p className="border-b border-black">Phone Number</p>}
            name="phoneNumber"
            control={control}
          >
            <Input className="h-10" defaultValue={profile?.phoneNumber} />
          </FormItem>
          <FormItem
            label={<p className="border-b border-black">Address</p>}
            name="address"
            control={control}
          >
            <Input className="h-10" defaultValue={profile?.address} />
          </FormItem>
          <div className="grid grid-cols-2 gap-x-4">
            <FormItem
              label={<p className="border-b border-black">Birthday</p>}
              name="birthday"
              control={control}
            >
              <DatePicker
                format={{
                  format: "DD-MM-YYYY",
                  type: "mask",
                }}
                maxDate={dayjs(
                  moment().subtract(18, "years").format("DD-MM-YYYY"),
                  "DD-MM-YYYY"
                )}
                minDate={dayjs(
                  moment().subtract(100, "years").format("DD-MM-YYYY"),
                  "DD-MM-YYYY"
                )}
                className="w-full h-10"
                defaultValue={profile ? moment(profile.birthday) : null}
              />
            </FormItem>
            <FormItem
              label={<p className="border-b border-black">Gender</p>}
              name="gender"
              control={control}
            >
              <Select
                size="large"
                className="text-sm w-full border hover:border-blue-400 h-10"
                options={[
                  { value: "Female", label: "Female" },
                  { value: "Male", label: "Male" },
                  { value: "Other", label: "Other" },
                ]}
                defaultValue={profile?.gender}
              />
            </FormItem>
          </div>
          <Form.Item className="mb-0">
            <Button
              className="w-[200px] uppercase hover:scale-95 font-bold text-white bg-primary py-5 flex items-center justify-center"
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
