import { Button } from "antd";
import React from "react";

export default function ConfirmEmail() {
  return (
    <div className="flex-col w-full h-[400px] flex justify-center items-center font-bold playfair-display-regular text-2xl">
      You need to check your email to verify this account
      <a href="/account" className="mt-2">
        <Button className="py-6 px-8 text-lg flex items-center">Verify</Button>
      </a>
    </div>
  );
}
