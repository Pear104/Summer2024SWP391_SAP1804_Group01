import { UserOutlined } from "@ant-design/icons";
import { Button, Form, Input } from "antd";
import { CircleArrowRight, User } from "lucide-react";
import * as z from "zod";
import { FormItem } from "react-hook-form-antd";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";

const schema = z.object({
  email: z
    .string()
    .min(1, { message: "Required" })
    .max(15, { message: "Email should be less than 15 characters" }),
  password: z.string().min(1, { message: "Required" }),
  name: z.string().min(1, { message: "Required" }),
  phoneNumber: z.string().min(1, { message: "Required" }),
  address: z.string().min(1, { message: "Required" }),
  birthday: z.string().min(1, { message: "Required" }),
  gender: z.string().min(1, { message: "Required" }),
});

export default function Register() {
  const { control, handleSubmit } = useForm({
    defaultValues: { email: "", password: "" },
    resolver: zodResolver(schema),
  });
  return (
    <div className="grid grid-cols-2 gap-4 py-16 px-32">
      <div className="col-span-1">
        <div
          className="aspect-[3/4] rotate-180 bg-cover bg-center bg-no-repeat w-full"
          style={{
            // backgroundImage: "url(/images/bracelets.6c0c2.jpg)",
            backgroundImage: "url(/images/diamond-desktop2.png)",
          }}
        ></div>
      </div>
      <div className="col-span-1 flex justify-center items-start">
        <div className="flex flex-col justify-center gap-4">
          <div className="pt-10 playfair-display-regular text-3xl font-bold text-center">
            Register
          </div>
          <Form
            layout="vertical"
            autoComplete="off"
            className="w-[440px] flex flex-col gap-4"
            onFinish={handleSubmit((data) => {
              console.log(data);
            })}
          >
            <FormItem label="Email" name="email" control={control} required>
              <Input className="border text-base border-primary py-2 px-4 without-ring w-full rounded-none" />
            </FormItem>
            <FormItem label="Email" name="password" control={control} required>
              <Input.Password
                placeholder="Password"
                className="border text-base border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem>
            {/* <FormItem label="Email" name="email" control={control} required>
              <Input.Password
                placeholder="Confirm Password"
                className="border text-base border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem> */}
            {/* <FormItem label="Email" name="email" control={control} required>
              <Input
                placeholder="Name"
                className="border text-base border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem>
            <FormItem label="Email" name="email" control={control} required>
              <Input
                placeholder="Birthday"
                className="border text-base border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem>
            <FormItem label="Email" name="email" control={control} required>
              <Input
                placeholder="Gender"
                className="border text-base border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem>
            <FormItem label="Email" name="email" control={control} required>
              <Input
                placeholder="Address"
                className="border text-base border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem>
            <FormItem label="Email" name="email" control={control} required>
              <Input
                placeholder="Phone number"
                className="border text-base border-primary py-2 px-4 without-ring w-full rounded-none"
              />
            </FormItem> */}
            <Form.Item>
              <Button
                className="w-full hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
                htmlType="submit"
              >
                REGISTER
              </Button>
            </Form.Item>
          </Form>

          <div className="flex justify-between">
            <span className="text-primary">Already Have An Account?</span>
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
