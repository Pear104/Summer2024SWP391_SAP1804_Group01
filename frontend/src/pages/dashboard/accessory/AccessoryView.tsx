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
  name: z.string().min(1, { message: "Required" }),
  karat: z.coerce.number().min(8, { message: "Required" }),
  materialWeight: z.coerce.number().min(8, { message: "Required" }),
  shape: z.string().min(1, { message: "Required" }),
  accessoryType: z.string().min(1, { message: "Required" }),
  // images: z.string().min(1, { message: "Required" }),
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
        description: "You have successfully updated accessory",
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

  const { control, handleSubmit, reset } = useForm({
    defaultValues: {
      name: "",
      karat: "",
      materialWeight: "",
      // images: "",
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
          // images: data.accessoryImages,
          shape: data?.shape.name,
          accessoryType: data?.accessoryType.name,
        });
      }
    })();
  }, [reset]);
  const [api, contextHolder] = notification.useNotification();
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
            setIsLoading(true);
            let submitForm: any;
            for (const [key, value] of Object.entries(formData)) {
              if (value) {
                submitForm = { ...submitForm, [key]: value };
              }
            }
            let response = null;

            const urlList: string[] = [];
            // Delete old images
            accessory?.accessoryImages?.forEach(async (image: any) => {
              if (fileList.every((file) => file?.url !== image.url)) {
                const oldImageRef = ref(storage, image.url);
                await deleteObject(oldImageRef);
              }
            });

            // Update new image
            const uploadPromises = fileList.map(async (file: UploadFile) => {
              const imgRef = ref(storage, `images/${v4()}`);
              console.log(file);
              if (file?.url) {
                const blob = await fetch(file?.url).then((r) => r.blob());
                const uploadResult = await uploadBytes(imgRef, blob as Blob);
                const url = await getDownloadURL(uploadResult.ref);
                urlList.push(url);
                const oldImageRef = ref(storage, file?.url);
                await deleteObject(oldImageRef);
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

            submitForm["accessoryImages"] = urlList;
            console.log("form: ");
            console.log(submitForm);
            if (accessory.accessoryId) {
              console.log("PUT");
              response = await PUT(
                "/api/Accessories/" + accessory.accessoryId,
                submitForm
              );
              console.log(response);
            } else {
              response = await POST("/api/Accessories/", submitForm);
            }

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
          <UploadImage fileList={fileList} setFileList={setFileList} />
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
