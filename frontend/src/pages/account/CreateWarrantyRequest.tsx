import { Button, DatePicker, Form, Input, Select, message } from "antd";
import * as z from "zod";
import { FormItem } from "react-hook-form-antd";
import { useForm } from "react-hook-form";
import { useEffect, useState } from "react";
import { zodResolver } from "@hookform/resolvers/zod";
import { setCookie } from "../../utils/cookie";
import { GET, POST } from "../../utils/request";
import { useNavigate, useSearchParams } from "react-router-dom";
import { useQueries } from "@tanstack/react-query";
import Loading from "../../components/Loading";
import moment from "moment";
import dayjs from "dayjs";
import WarrantyInfo from "./components/WarrantyInfo";

const phoneRegex = new RegExp(
  /^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$/
);

const reasonOptions = [
  {
    value: "The ring may need to be resized to fit the wearer's finger",
    label: "The ring may need to be resized to fit the wearer's finger",
  },
  {
    value: "The prongs holding the diamond in place are loose or broken",
    label: "The prongs holding the diamond in place are loose or broken",
  },
  {
    value:
      "Requiring cleaning and polishing to restore diamond ring appearance",
    label:
      "Requiring cleaning and polishing to restore diamond ring appearance",
  },
  {
    value: "Upgrade the diamond or redesign the setting for a new look.",
    label: "Upgrade the diamond or redesign the setting for a new look.",
  },
  { value: "Other", label: "Other" },
];

const schema = z.object({
  warrantyCardId: z.coerce.number().min(1, "Please choose your product!"),
  phoneNumber: z
    .string()
    .regex(phoneRegex, "Invalid phone number!")
    .min(10, "Invalid phone number!")
    .max(14, "Invalid phone number!"),
  warrantyReason: z
    .string()
    .min(20, "Please provide a more detailed reason!")
    .max(256, "The reason must be less than 256 characters!"),
  shippingAddress: z
    .string()
    .min(12, { message: "Invalid address" })
    .refine((value) => value.trim().length > 0, {
      message: "Address cannot be empty",
    }),
  receiveTime: z.coerce.date(),
});

type Option = {
  value: string;
  label: string;
  key: number;
  info: any;
};

export default function CreateWarrantyRequest() {
  const [isLoading, setIsLoading] = useState(false);
  const [searchParams] = useSearchParams();
  const [warrantyCardId, setWarrantyCardId] = useState(
    Number(searchParams.get("warrantyCardId")) || 0
  );
  const [reason, setReason] = useState("");
  const navigate = useNavigate();
  const [messageApi, contextHolder] = message.useMessage();
  const [warrantyCards] = useQueries({
    queries: [
      {
        queryKey: ["warrantyCards"],
        queryFn: () => GET("/api/WarrantyCards/me"),
        staleTime: 0,
      },
    ],
  });
  const options: Option[] = warrantyCards?.data?.map((warrantyCard: any) => ({
    key: warrantyCard.warrantyCardId,
    value: warrantyCard.warrantyCardId,
    label: warrantyCard.diamondId
      ? `${warrantyCard?.diamond?.carat} ct ${warrantyCard?.diamond?.shape?.name} Shape Diamond #${warrantyCard?.diamond.certificateNumber}`
      : warrantyCard?.accessory?.name,
  }));

  const { control, handleSubmit, reset, setValue } = useForm({
    defaultValues: {
      warrantyCardId: "",
      warrantyReason: "",
      phoneNumber: "",
      shippingAddress: "",
      receiveTime: "",
    },
    resolver: zodResolver(schema),
  });
  useEffect(() => {
    (async () => {
      const data = await GET("/api/Accounts/me");
      if (data) {
        reset({
          warrantyCardId: String(
            Number(searchParams.get("warrantyCardId")) || "Choose a product"
          ),
          warrantyReason: "",
          phoneNumber: data.phoneNumber,
          shippingAddress: data.address,
          receiveTime: "",
        });
      } else {
        setCookie("accessToken", "", 0);
        messageApi.error("Please login first!");
        navigate("/authentication/login");
      }
    })();
  }, [reset]);
  return (
    <>
      {contextHolder}
      <div className="px-3 pt-4 pb-8">
        {isLoading && <Loading />}
        <div>
          <div className="uppercase font-semibold text-xl">
            Request a warranty service
          </div>
          <div>
            <Form
              layout="vertical"
              autoComplete="off"
              className="grid grid-cols-2 gap-x-4"
              onFinish={handleSubmit(async (formData) => {
                console.log(formData);
                setIsLoading(true);
                const response = await POST("/api/WarrantyRequests", formData);
                setIsLoading(false);
                console.log("response: ");
                console.log(response);
                if (response?.warrantyRequestId) {
                  navigate("/account/warranty");
                } else {
                  messageApi.error("This product is being warranted.");
                }
              })}
            >
              <FormItem
                label="Product"
                name="warrantyCardId"
                className="mt-6 col-span-2"
                control={control}
                required
              >
                <Select
                  loading={warrantyCards?.isFetching}
                  showSearch
                  className="text-sm border h-9"
                  placeholder="Choose a product"
                  optionFilterProp="children"
                  filterOption={(input, option) =>
                    (option?.label ?? "").includes(input)
                  }
                  filterSort={(optionA, optionB) =>
                    (optionA?.label ?? "")
                      .toLowerCase()
                      .localeCompare((optionB?.label ?? "").toLowerCase())
                  }
                  options={options}
                  onChange={(value) => {
                    setWarrantyCardId(value);
                  }}
                />
              </FormItem>
              <WarrantyInfo id={warrantyCardId} />

              <FormItem
                className=""
                label="Phone number"
                name="phoneNumber"
                control={control}
                required
              >
                <Input
                  placeholder="Your phone number"
                  className="h-10 border text-sm py-2 px-2 without-ring rounded-none"
                />
              </FormItem>
              <FormItem
                label="Receive date (The day delivery staff can come to get your item)"
                name="receiveTime"
                control={control}
                className="w-full"
                required
              >
                <DatePicker
                  minDate={dayjs(moment().format("DD-MM-YYYY"), "DD-MM-YYYY")}
                  className="border rounded-none h-10 w-full"
                />
              </FormItem>

              <FormItem
                label="Address"
                name="shippingAddress"
                control={control}
                required
                className=""
              >
                <Input
                  placeholder="Your address"
                  className="border text-sm py-2 px-2 without-ring w-full rounded-none"
                />
              </FormItem>

              <div className="col-span-2 mb-4">
                <div className="flex items-center gap-2">
                  <span className="text-red-500 text-xl">*</span> Warranty
                  reason
                </div>
                <Select
                  size="large"
                  className="font-thin border w-full text-sm"
                  options={reasonOptions}
                  onChange={(e: any) => {
                    setReason(e);
                    if (e != "Other") {
                      setValue("warrantyReason", e);
                    } else {
                      setValue("warrantyReason", "");
                    }
                  }}
                />
              </div>
              {reason == "Other" && (
                <FormItem
                  className="mt-4 col-span-2"
                  name="warrantyReason"
                  control={control}
                  required
                >
                  <Input.TextArea
                    rows={4}
                    placeholder="Describe the problem happen with your product (What need to be fixed)"
                    className="text-black text-sm border py-2 px-2 without-ring w-full rounded-none"
                  />
                </FormItem>
              )}
              <div className="w-[100px]">
                <Form.Item className="mb-0">
                  <Button
                    className="w-full hover:scale-95 font-bold text-white bg-primary py-5 flex items-center justify-center"
                    htmlType="submit"
                  >
                    SEND
                  </Button>
                </Form.Item>
              </div>
            </Form>
          </div>
          <div></div>
        </div>
      </div>
    </>
  );
}
