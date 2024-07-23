import { useParams } from "react-router-dom";
import { DELETE, GET, PUT } from "../../../utils/request";
import { useState } from "react";
import { v4 } from "uuid";
import {
  getDownloadURL,
  ref,
  uploadBytes,
  deleteObject,
} from "firebase/storage";
import { App, Button, Form, Input, Select, UploadFile } from "antd";
import { ArrowLeft, Eye, EyeOff, ScrollText } from "lucide-react";
import { Link, useNavigate } from "react-router-dom";
import * as z from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { POST } from "../../../utils/request";
import { FormItem } from "react-hook-form-antd";
import Loading from "../../../components/Loading";
import UploadImage from "./components/UploadImage";
import { storage } from "../../../utils/firebase";
import { useMutation, useQueries, useQueryClient } from "@tanstack/react-query";

const shapeOptions = [
  { value: 1, label: "Round" },
  { value: 2, label: "Emerald" },
  { value: 3, label: "Heart" },
  { value: 4, label: "Pear" },
  { value: 5, label: "Oval" },
  { value: 6, label: "Cushion" },
  { value: 7, label: "Princess" },
  { value: 8, label: "Radiant" },
  { value: 9, label: "Marquise" },
  { value: 10, label: "Asscher" },
];

const schema = z.object({
  name: z
    .string()
    .min(1, { message: "Required" })
    .refine((value) => value.trim().length > 0, {
      message: "Name cannot be empty",
    }),
  karat: z.coerce.number().min(8, { message: "Karat must greater than 8" }),
  quantity: z.coerce
    .number()
    .min(1, { message: "Quantity must greater than 1" }),
  materialWeight: z.coerce
    .number()
    .min(8, { message: "Material Weight must greater than 8" }),
  shape: z.coerce.number().min(1, { message: "Required" }),
  accessoryType: z.string().min(1, { message: "Required" }),
  images: z.string().min(0, { message: "Required" }),
});
export default function AccessoryView() {
  const [isLoading, setIsLoading] = useState(false);
  const [fileList, setFileList] = useState<UploadFile[]>([]);
  const [accessory, setAccessory] = useState<any>();
  const { accessoryId } = useParams();
  const queryClient = useQueryClient();
  const navigate = useNavigate();

  const { control, handleSubmit, reset, setError } = useForm({
    defaultValues: {
      name: "",
      quantity: "",
      karat: "",
      materialWeight: "",
      images: "",
      shape: "",
      accessoryType: "",
    },
    resolver: zodResolver(schema),
  });
  const [_accessory] = useQueries({
    queries: [
      {
        queryKey: ["accessory", accessoryId, reset],
        queryFn: async () => {
          const data = await GET(`/api/Accessories/${accessoryId}`);
          if (accessoryId) {
            setFileList(data?.accessoryImages);
            setAccessory(data);
            reset({
              name: data?.name,
              karat: data?.karat,
              quantity: data?.quantity,
              materialWeight: data?.materialWeight,
              images: "",
              shape: data?.shape?.name,
              accessoryType: data?.accessoryType?.name,
            });
          }
        },
      },
    ],
  });
  const { message } = App.useApp();

  const mutatePost = useMutation({
    mutationFn: (accessory: any) => {
      return POST("/api/Accessories", accessory);
    },
    onSuccess: (data: any) => {
      message.success("Accessory added successfully");
      queryClient.invalidateQueries();
      navigate(`/admin/accessories/detail/${data.accessoryId}`);
    },
  });

  const mutatePut = useMutation({
    mutationFn: (accessory: any) => {
      return PUT(`/api/Accessories/${accessoryId}`, accessory);
    },
    onSuccess: () => {
      message.success("Accessory updated successfully");
      queryClient.invalidateQueries({ queryKey: ["accessory"] });
    },
  });

  const mutateDelete = useMutation({
    mutationFn: () => {
      return DELETE(
        `/api/Accessories/${accessoryId}/${!accessory?.isHidden}`,
        ""
      );
    },
    onSuccess: (data: any) => {
      if (!data) {
        message.error("Your don't have permission");
      } else {
        message.success("Accessory updated successfully");
      }

      queryClient.invalidateQueries({ queryKey: ["accessory"] });
    },
  });
  console.log(accessory);

  return (
    <div>
      {isLoading && <Loading />}
      <div className="flex justify-between">
        <div className="flex self-center items-center gap-2 ">
          <Link
            to="/admin/accessories"
            className="rounded-full inline-block px-4 border bg-blue-500 text-white p-1"
          >
            <ArrowLeft />
          </Link>
          <div className="ml-2 text-2xl">Accessories</div>
        </div>
        <div className="flex self-center items-center gap-2">
          <div
            onClick={async () => {
              mutateDelete.mutate();
            }}
            className="cursor-pointer flex self-center items-center gap-2 rounded-md py-2 px-4 border bg-blue-500 text-white p-1"
          >
            {!accessory?.isHidden ? <EyeOff /> : <Eye />}
            <div className="ml-2 text-lg">
              {!accessory?.isHidden ? "Hide" : "Show"}
            </div>
          </div>
          <a
            href={`/product/accessory/detail/${accessoryId}`}
            target="_blank"
            className="flex self-center items-center gap-2 rounded-md py-2 px-4 border bg-blue-500 text-white p-1"
          >
            <ScrollText />
            <div className="ml-2 text-lg">View</div>
          </a>
        </div>
      </div>
      <div className="bg-white rounded-lg my-4 p-4">
        <Form
          name="search_form"
          className=""
          layout="vertical"
          onFinish={handleSubmit(async (formData) => {
            if (!fileList || fileList?.length == 0) {
              setError("images", {
                type: "manual",
                message: "Please upload at least one image",
              });
              return;
            }
            setIsLoading(true);
            let submitForm: any;
            for (const [key, value] of Object.entries(formData)) {
              if (value) {
                submitForm = { ...submitForm, [key]: value };
              }
            }
            // Delete old images
            accessory?.accessoryImages?.forEach(async (image: any) => {
              if (
                image.url.includes("firebase") &&
                fileList.every((file) => file?.url !== image.url)
              ) {
                const oldImageRef = ref(storage, image.url);
                await deleteObject(oldImageRef);
              }
            });

            // Update new image to firebase
            const urlList: string[] = [];
            const uploadPromises = fileList.map(async (file: UploadFile) => {
              const imgRef = ref(storage, `images/${v4()}`);
              if (file?.url) {
                const blob = await fetch(file?.url).then((r) => r.blob());
                const uploadResult = await uploadBytes(imgRef, blob as Blob);
                const url = await getDownloadURL(uploadResult.ref);
                urlList.push(url);
                if (file?.url.includes("firebase")) {
                  const oldImageRef = ref(storage, file?.url);
                  await deleteObject(oldImageRef);
                }
              } else {
                const uploadResult = await uploadBytes(
                  imgRef,
                  file.originFileObj as Blob
                );
                const url = await getDownloadURL(uploadResult.ref);
                urlList.push(url);
              }
            });
            await Promise.all(uploadPromises);

            // Add firebase's image url to DATJ database
            submitForm["accessoryImages"] = urlList;
            if (accessory?.accessoryId) {
              mutatePut.mutate(submitForm);
            } else {
              mutatePost.mutate(submitForm);
            }
            setIsLoading(false);
          })}
        >
          <FormItem label="Name" name="name" control={control} required>
            <Input
              placeholder="Accessory name"
              className="font-thin border p-2 rounded-md w-full"
            />
          </FormItem>
          <FormItem label="Quantity" name="quantity" control={control} required>
            <Input
              type="number"
              placeholder="Quantity"
              className="font-thin border p-2 rounded-md w-full"
            />
          </FormItem>
          <FormItem label="Karat" name="karat" control={control} required>
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={[
                { value: 18, label: "18K" },
                { value: 24, label: "24K" },
              ]}
            />
          </FormItem>
          <FormItem
            label="Material Weight"
            name="materialWeight"
            control={control}
            required
          >
            <Input
              type="number"
              placeholder="Material weight"
              className="font-thin border p-2 rounded-md w-full"
            />
          </FormItem>
          <FormItem label="Shape" name="shape" control={control} required>
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={shapeOptions}
            />
          </FormItem>
          <FormItem
            label="Type"
            name="accessoryType"
            control={control}
            required
          >
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={[
                { value: "Earrings", label: "Earrings" },
                { value: "Rings", label: "Rings" },
                { value: "Necklaces", label: "Necklaces" },
                { value: "Bracelets", label: "Bracelets" },
              ]}
            />
          </FormItem>
          <FormItem label="Images" name="images" control={control} required>
            <UploadImage fileList={fileList} setFileList={setFileList} />
          </FormItem>
          <Form.Item className="mt-8 mb-0">
            <div className="mt-8">
              <Button
                className="flex items-center px-4 py-5 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75"
                htmlType="submit"
              >
                {accessory?.accessoryId ? "UPDATE" : "CREATE"}
              </Button>
            </div>
          </Form.Item>
        </Form>
      </div>
    </div>
  );
}
