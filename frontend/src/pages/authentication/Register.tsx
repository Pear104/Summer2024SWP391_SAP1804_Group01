import { Button, DatePicker, Divider, Form, Input, Select } from "antd";
import { CircleArrowRight } from "lucide-react";
import * as z from "zod";
import { FormItem } from "react-hook-form-antd";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { POST } from "../../utils/request";
import { useEffect, useState } from "react";
import Loading from "../../components/Loading";
import { useAuthStore } from "../../store/authStore";
import { setCookie } from "../../utils/cookie";
import moment from "moment";
import dayjs from "dayjs";
import customParseFormat from "dayjs/plugin/customParseFormat";

dayjs.extend(customParseFormat);

const phoneRegex = new RegExp(
  /^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$/
);

const schema = z
  .object({
    email: z
      .string()
      .email()
      .min(8, { message: "Invalid email" })
      .max(32, { message: "Email should be less than 32 characters" }),
    password: z
      .string()
      .min(8, { message: "Password must be at least 8 characters" }),
    confirmPassword: z.string().min(8, { message: "Required" }),
    name: z
      .string()
      .min(6, { message: "Name should be at least 6 characters" })
      .max(32, { message: "Name should be less than 32 characters" })
      .refine((value) => value.trim().length > 0, {
        message: "Name cannot be empty",
      }),
    phoneNumber: z
      .string()
      .regex(phoneRegex, "Invalid phone number!")
      .min(10, "Invalid phone number!")
      .max(16, "Invalid phone number!"),
    address: z
      .string()
      .min(12, { message: "Invalid address" })
      .refine((value) => value.trim().length > 0, {
        message: "Address cannot be empty",
      }),
    birthday: z.coerce.date(),
    gender: z.string().min(1, { message: "Required" }),
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

export default function Register() {
  const [isLoading, setIsLoading] = useState(false);
  const [isGoogleLogin, setIsGoogleLogin] = useState(false);
  const [profile, setProfile] = useState<any>(null);
  const googleProfile = useAuthStore((state) => state.googleProfile);
  const setGoogleProfile = useAuthStore((state) => state.setGoogleProfile);
  const { control, handleSubmit, setError } = useForm({
    defaultValues: {
      email: googleProfile.email || "",
      password: "",
      confirmPassword: "",
      gender: "Other",
      name: googleProfile.name || "",
      phoneNumber: "",
      address: "",
      birthday: "",
    },
    resolver: zodResolver(schema),
  });

  useEffect(() => {
    if (googleProfile.email) {
      setIsGoogleLogin(true);
      setProfile(googleProfile);
      setGoogleProfile({
        email: "",
        name: "",
      });
    } else {
      setIsGoogleLogin(false);
    }
  }, []);

  return (
    <div className="grid grid-cols-2 gap-4 py-16 px-32">
      {isLoading && <Loading />}
      <div className="col-span-1">
        <div
          className="rotate-180 bg-cover bg-center bg-no-repeat h-full"
          style={{
            backgroundImage: "url(/images/diamond-desktop2.png)",
          }}
        ></div>
      </div>
      <div className="col-span-1 flex justify-center items-start">
        <div className="flex flex-col justify-center gap-4">
          <div className="pt-10 playfair-display-regular text-3xl font-bold text-center">
            Register
          </div>
          <Divider orientation="left">Account</Divider>

          <Form
            layout="vertical"
            autoComplete="off"
            className="w-[440px] flex flex-col gap-[2px]"
            onFinish={handleSubmit(async (formData) => {
              setIsLoading(true);
              const authResponse = await POST(
                isGoogleLogin
                  ? "/api/Authentication/register-google"
                  : "/api/Authentication/register",
                formData
              );
              if (authResponse) {
                if (authResponse.token) {
                  setCookie("accessToken", authResponse.token, 7);
                  location.href = "/account";
                } else {
                  location.href = "/authentication/email-redirect";
                }
              } else {
                setIsLoading(false);
                setError("email", {
                  type: "manual",
                  message: "Email already be used!",
                });
              }
            })}
          >
            <FormItem label="Email" name="email" control={control} required>
              <Input
                disabled={profile?.email ? true : false}
                placeholder="Your email"
                className="text-black text-sm border border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem>
            <FormItem
              label="Password"
              name="password"
              control={control}
              required
            >
              <Input.Password
                placeholder="Your password"
                className="text-sm border border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem>
            <FormItem
              label="Confirm password"
              name="confirmPassword"
              control={control}
              required
            >
              <Input.Password
                placeholder="Repeat your password"
                className="border text-sm border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem>
            <Divider orientation="left">User info</Divider>
            <FormItem label="Name" name="name" control={control} required>
              <Input
                disabled={profile?.name ? true : false}
                placeholder="Your name"
                className="text-black border text-sm border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem>
            <div className="flex justify-between">
              <FormItem label="Gender" name="gender" control={control} required>
                <Select
                  size="large"
                  className="text-sm w-[120px] border border-primary h-[38px]"
                  options={[
                    { value: "Female", label: "Female" },
                    { value: "Male", label: "Male" },
                    { value: "Other", label: "Other" },
                  ]}
                  defaultValue="Other"
                />
              </FormItem>
              <FormItem
                className="w-[280px]"
                label="Phone number"
                name="phoneNumber"
                control={control}
                required
              >
                <Input
                  placeholder="Your phone number"
                  className="border text-sm border-primary py-2 px-4 without-ring rounded-none"
                />
              </FormItem>
            </div>
            <FormItem
              label="Birthday"
              name="birthday"
              control={control}
              className="w-full"
              required
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
                // minDate={dayjs("2019-08-01", "DD-MM-YYYY")}
                // maxDate={dayjs("2020-10-31", "DD-MM-YYYY")}
                className="border border-primary rounded-none h-[42px] w-full"
              />
            </FormItem>

            <FormItem
              label="Address"
              name="address"
              control={control}
              required
              className=""
            >
              <Input
                placeholder="Your address"
                className="border text-sm border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem>
            <Form.Item className="mb-0">
              <Button
                className="w-full hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                htmlType="submit"
              >
                REGISTER
              </Button>
            </Form.Item>
          </Form>

          <div className="flex justify-between">
            <span className="text-primary font-thin">
              Already Have An Account?
            </span>
            <a
              href="/authentication/login"
              className="flex items-center gap-2 group font-semibold"
            >
              <span className="text-primary border-b border-transparent transition-all group-hover:border-primary">
                Login
              </span>
              <CircleArrowRight />
            </a>
          </div>
        </div>
      </div>
    </div>
  );
}
