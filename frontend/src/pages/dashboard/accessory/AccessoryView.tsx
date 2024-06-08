import { useParams } from "react-router-dom";
import { GET, PUT } from "../../../utils/request";
import { useEffect, useState } from "react";
import { v4 } from "uuid";
import {
  getDownloadURL,
  ref,
  uploadBytes,
  deleteObject,
} from "firebase/storage";
import { Button, Form, Input, notification, Select, UploadFile } from "antd";
import { ArrowLeft, Check, X } from "lucide-react";
import { Link } from "react-router-dom";
import * as z from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { POST } from "../../../utils/request";
import { FormItem } from "react-hook-form-antd";
import Loading from "../../../components/Loading";
import UploadImage from "./components/UploadImage";
import { storage } from "../../../utils/firebase";

const schema = z.object({
  name: z
    .string()
    .min(1, { message: "Required" })
    .refine((value) => value.trim().length > 0, {
      message: "Name cannot be empty",
    }),
  karat: z.coerce.number().min(8, { message: "Required" }),
  materialWeight: z.coerce.number().min(8, { message: "Required" }),
  shape: z.string().min(1, { message: "Required" }),
  accessoryType: z.string().min(1, { message: "Required" }),
  images: z.string().min(0, { message: "Required" }),
});
export default function AccessoryView() {
  const [isLoading, setIsLoading] = useState(false);
  const [fileList, setFileList] = useState<UploadFile[]>([]);
  const [accessory, setAccessory] = useState<any>();
  const { accessoryId } = useParams();
  const openNotification = (isSuccess: boolean) => {
    if (isSuccess) {
      api.open({
        message: "Success",
        description: "Your action have successfully completed",
        icon: <Check color="#1fadea" />,
      });
    } else {
      api.open({
        message: "Error",
        description: "You dont have permission",
        icon: <X color="#ff0000" />,
      });
    }
  };

  const { control, handleSubmit, reset, setError } = useForm({
    defaultValues: {
      name: "",
      karat: "",
      materialWeight: "",
      images: "",
      shape: "",
      accessoryType: "",
    },
    resolver: zodResolver(schema),
  });
  useEffect(() => {
    (async () => {
      const data = await GET(`/api/Accessories/${accessoryId}`);
      setFileList(data?.accessoryImages);
      if (data) {
        setAccessory(data);
        reset({
          name: data?.name,
          karat: data?.karat,
          materialWeight: data?.materialWeight,
          images: "",
          shape: data?.shape.name,
          accessoryType: data?.accessoryType.name,
        });
      }
    })();
  }, [reset]);
  const [api, contextHolder] = notification.useNotification();
  console.log("fileList");
  console.log(fileList);
  return (
    <div>
      {isLoading && <Loading />}
      {contextHolder}
      <div className="flex self-center items-center gap-2">
        <Link
          to="/admin/accessories"
          className="inline-block border border-black p-1 rounded-full"
        >
          <ArrowLeft />
        </Link>
        <div className="ml-2 text-2xl">Accessories</div>
      </div>
      <div className="bg-white rounded-lg my-4 p-4">
        <Form
          name="search_form"
          className=""
          layout="vertical"
          onFinish={handleSubmit(async (formData) => {
            console.log("fileList");
            console.log(fileList);
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
            let response = null;

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
              console.log(file);
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
            console.log("form: ");
            console.log(submitForm);
            if (accessory.accessoryId) {
              console.log("PUT");
              response = await PUT(
                "/api/Accessories/" + accessory.accessoryId,
                submitForm
              );
            } else {
              console.log("POST");
              response = await POST("/api/Accessories/", submitForm);
            }
            console.log(response);

            setIsLoading(false);
            if (response) {
              openNotification(true);
            } else {
              openNotification(false);
            }
            location.href = "/admin/accessories/detail/" + response.accessoryId;
          })}
        >
          <FormItem label="Name" name="name" control={control} required>
            <Input
              placeholder="Accessory name"
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
              options={[
                { value: "Round", label: "Round" },
                { value: "Emerald", label: "Emerald" },
                { value: "Oval", label: "Oval" },
              ]}
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
