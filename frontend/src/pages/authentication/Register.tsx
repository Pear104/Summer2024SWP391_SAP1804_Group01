import { UserOutlined } from "@ant-design/icons";
import { Button, Input } from "antd";
import { CircleArrowRight, Eye, User } from "lucide-react";
import React from "react";

const Password = () => {
  return (
    <div>
      <input className="border text-base border-primary py-2 px-4 without-ring w-[440px] rounded-none" />
      <Eye />
    </div>
  );
};

export default function Register() {
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
        <div className="flex flex-col justify-center gap-4">
          <div className="pt-10 playfair-display-regular text-3xl font-bold text-center">
            Register
          </div>
          <Input
            className="border text-base border-primary py-2 px-4 without-ring w-[440px] rounded-none"
            placeholder="Email"
          />
          <Input.Password
            placeholder="Password"
            className="border text-base border-primary py-2 px-4 without-ring w-[440px] rounded-none"
          />
          <Input.Password
            placeholder="Confirm Password"
            className="border text-base border-primary py-2 px-4 without-ring w-[440px] rounded-none"
          />

          <a href="/authentication/confirm-email" className="block">
            <Button
              className="w-full hover:scale-95 font-bold text-white bg-primary py-6 flex items-center justify-center"
              type="default"
            >
              REGISTER
            </Button>
          </a>
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
