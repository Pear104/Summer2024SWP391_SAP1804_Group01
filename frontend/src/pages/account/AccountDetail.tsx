import { Button } from "antd";
import React from "react";

const Field = ({ field, value }: { field: string; value: string }) => {
  return (
    <div className="flex items-center gap-4">
      <div className="font-semibold playfair-display-regular text-lg">
        {field}:
      </div>
      <div>{value}</div>
    </div>
  );
};

export default function AccountDetail() {
  return (
    <div>
      <div className="font-semibold playfair-display-regular text-2xl">
        ACCOUNT DETAIL
      </div>
      <div className="pt-6 flex flex-col gap-3">
        <Field field="Email" value="abcd@gmail.com" />
        <Field field="Phone number" value="0123.456.789" />
        <Field field="Address" value="123/456 District 8, Ho Chi Minh City" />
        <Field field="Birthday" value="01/01/2000" />
      </div>
      <div className="mt-6">
        <Button className="">EDIT</Button>
      </div>
    </div>
  );
}
