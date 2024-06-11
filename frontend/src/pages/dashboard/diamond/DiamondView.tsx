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
import {
  Avatar,
  Button,
  Form,
  Input,
  notification,
  Select,
  Switch,
  UploadFile,
} from "antd";
import { ArrowLeft, Check, Shapes, X } from "lucide-react";
import { Link } from "react-router-dom";
import * as z from "zod";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { POST } from "../../../utils/request";
import { FormItem } from "react-hook-form-antd";
import Loading from "../../../components/Loading";
import { storage } from "../../../utils/firebase";
import UploadDiamondImage from "./componenets/UploadDiamondImage";

const Color = {
  D: "D",
  E: "E",
  F: "F",
  G: "G",
  H: "H",
  I: "I",
  J: "J",
  K: "K",
  L: "L",
  M: "M",
  N: "N",
  O: "O",
  P: "P",
  Q: "Q",
  R: "R",
  S: "S",
  T: "T",
  U: "U",
  V: "V",
};

const Clarity = {
  FL: "FL",
  IF: "IF",
  VVS1: "VVS1",
  VVS2: "VVS2",
  VS1: "VS1",
  VS2: "VS2",
  SI1: "SI1",
  SI2: "SI2",
  I1: "I1",
  I2: "I2",
  I3: "I3",
};
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
  lab: z
    .string()
    .min(1, { message: "Required" })
    .refine((value) => value.trim().length > 0, {
      message: "Lab cannot be empty",
    }),
  certificateNumber: z
    .string()
    .refine((value) => /^\d{9}$/.test(value), {
      message: "Must be a 9-digit number",
    })
    .transform((value) => parseInt(value, 10)),
  certificateUrl: z.string().min(0, { message: "Required" }),
  image: z.string().min(0, { message: "Required" }),

  carat: z.coerce
    .number()
    .min(0.1, { message: "Required" })
    .max(7.99, { message: "Carat must be between 0 and 8" }),

  cut: z.string().min(1, { message: "Required" }),

  color: z.nativeEnum(Color, { message: "Required" }),

  clarity: z.nativeEnum(Clarity, { message: "Required" }),

  polish: z.string().min(1, { message: "Required" }),
  symmetry: z.string().min(1, { message: "Required" }),
  fluorescence: z.string().min(1, { message: "Required" }),
  shapeId: z.coerce.number().min(1, { message: "Required" }),
  availability: z.boolean(),
});
export default function DiamondView() {
  const [isLoading, setIsLoading] = useState(false);
  // const [certificateFile, setCertificateFile] = useState<UploadFile[]>([]);
  const [diamondFile, setDiamondFile] = useState<UploadFile[]>([]);
  const [diamond, setDiamond] = useState<any>();
  const { diamondId } = useParams();

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
      lab: "",
      certificateNumber: "",
      certificateUrl: "",
      image: "",
      carat: "",
      cut: "",
      color: Color.D,
      clarity: Clarity.FL,
      polish: "",
      symmetry: "",
      fluorescence: "",
      shapeId: "",
      availability: false,
    },
    resolver: zodResolver(schema),
  });
  // getdata
  useEffect(() => {
    (async () => {
      const data = await GET(`/api/Diamonds/${diamondId}`);
      if (data) {
        if (data?.imageUrl) {
          setDiamondFile([
            {
              uid: "-1",
              name: "image.png",
              status: "done",
              url: data?.imageUrl,
            },
          ]);
        }

        setDiamond(data);
        reset({
          lab: data?.lab || "",
          certificateNumber: data?.certificateNumber
            ? data.certificateNumber.toString()
            : "",
          certificateUrl: data?.certificateUrl,
          image: data?.imageUrl,
          carat: data?.carat || "",
          cut: data?.cut || "",
          color: data?.color || Color.D,
          clarity: data?.clarity || Clarity.FL,
          polish: data?.polish || "",
          symmetry: data?.symmetry || "",
          fluorescence: data?.fluorescence || "",
          shapeId: data?.shapeId,
          availability: data?.availability,
        });
      }
    })();
  }, [reset]);

  const [api, contextHolder] = notification.useNotification();
  console.log("file");
  console.log(diamondFile);
  return (
    <div>
      {isLoading && <Loading />}
      {contextHolder}
      <div className="flex self-center items-center gap-2">
        <Link
          to="/admin/diamonds"
          className="inline-block border border-black p-1 rounded-full"
        >
          <ArrowLeft />
        </Link>
        <div className="ml-2 text-2xl">Diamonds</div>
      </div>
      <div className="bg-white rounded-lg my-4 p-4">
        <Form
          name="search_form"
          className=""
          layout="vertical"
          //submit form
          onFinish={handleSubmit(async (formData) => {
            console.log("diamondFileList");
            console.log(diamondFile);
            if (!diamondFile || diamondFile?.length === 0) {
              setError("image", {
                type: "manual",
                message: "Please upload an image",
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
            if (
              diamond?.imageUrl &&
              typeof diamond.imageUrl === "string" &&
              !diamondFile[0]?.url?.includes(diamond.imageUrl)
            ) {
              const oldImageRef = ref(storage, diamond.imageUrl);
              await deleteObject(oldImageRef);
            }

            // Update new image to firebase
            const diaFile = diamondFile[0];
            let diamondImageUrl = "";
            const imgRef = ref(storage, `images/${v4()}`);
            if (diaFile?.url) {
              const blob = await fetch(diaFile?.url).then((r) => r.blob());
              const uploadResult = await uploadBytes(imgRef, blob as Blob);
              const url = await getDownloadURL(uploadResult.ref);
              diamondImageUrl = url;
              if (diaFile?.url.includes("firebase")) {
                const oldImageRef = ref(storage, diaFile?.url);
                await deleteObject(oldImageRef);
              }
            } else {
              const uploadResult = await uploadBytes(
                imgRef,
                diaFile.originFileObj as Blob
              );
              const url = await getDownloadURL(uploadResult.ref);
              diamondImageUrl = url;
            }
            // Add firebase's image url to DATJ database
            submitForm["imageUrl"] = diamondImageUrl;

            console.log("form: ");

            console.log(submitForm);
            if (diamond.diamondId) {
              console.log("PUT");
              response = await PUT(
                "/api/Diamonds/" + diamond.diamondId,
                submitForm
              );
            } else {
              console.log("POST");
              response = await POST("/api/Diamonds/", submitForm);
            }
            console.log(response);
            console.log(response?.errors);

            setIsLoading(false);
            if (response) {
              openNotification(true);
            } else {
              openNotification(false);
            }
            location.href = "/admin/diamonds/detail/" + response.diamondId;
          })}
        >
          <FormItem label="Lab" name="lab" control={control} required>
            <Input
              placeholder="Diamond lab"
              className="font-thin border p-2 rounded-md w-full"
            />
          </FormItem>
          <FormItem
            label="Certificate Numnber"
            name="certificateNumber"
            control={control}
            required
          >
            <Input
              placeholder="Diamond lab"
              className="font-thin border p-2 rounded-md w-full"
            />
          </FormItem>
          <FormItem label="Carat" name="carat" control={control} required>
            <Input
              type="number"
              placeholder="Carat"
              className="font-thin border p-2 rounded-md w-full"
            />
          </FormItem>
          <FormItem label="Cut" name="cut" control={control} required>
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={[
                { value: "Good", label: "Good" },
                { value: "Very Good", label: "Very Good" },
                { value: "Excellent", label: "Excellent" },
                { value: "Ideal", label: "Ideal" },
              ]}
            />
          </FormItem>
          <FormItem label="Color" name="color" control={control} required>
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={[
                { value: "D", label: "D" },
                { value: "E", label: "E" },
                { value: "F", label: "F" },
                { value: "G", label: "G" },
                { value: "H", label: "H" },
                { value: "I", label: "I" },
                { value: "J", label: "J" },
                { value: "K", label: "K" },
                { value: "L", label: "L" },
                { value: "M", label: "M" },
                { value: "N", label: "N" },
                { value: "O", label: "O" },
                { value: "P", label: "P" },
                { value: "Q", label: "Q" },
                { value: "R", label: "R" },
                { value: "S", label: "S" },
                { value: "T", label: "T" },
                { value: "U", label: "U" },
                { value: "V", label: "V" },
              ]}
            />
          </FormItem>
          <FormItem label="Clarity" name="clarity" control={control} required>
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={[
                { value: "FL", label: "FL" },
                { value: "IF", label: "IF" },
                { value: "VVS1", label: "VVS1" },
                { value: "VVS2", label: "VVS2" },
                { value: "VS1", label: "VS1" },
                { value: "VS2", label: "VS2" },
                { value: "SI1", label: "SI1" },
                { value: "SI2", label: "SI2" },
                { value: "I1", label: "I1" },
                { value: "I2", label: "I2" },
                { value: "I3", label: "I3" },
              ]}
            />
          </FormItem>
          <FormItem label="Polish" name="polish" control={control} required>
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={[
                { value: "Fair", label: "Fair" },
                { value: "Good", label: "Good" },
                { value: "Very Good", label: "Very Good" },
                { value: "Excellent", label: "Excellent" },
              ]}
            />
          </FormItem>
          <FormItem label="Symmetry" name="symmetry" control={control} required>
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={[
                { value: "Fair", label: "Fair" },
                { value: "Good", label: "Good" },
                { value: "Very Good", label: "Very Good" },
                { value: "Excellent", label: "Excellent" },
              ]}
            />
          </FormItem>
          <FormItem
            label="Fluorescence"
            name="fluorescence"
            control={control}
            required
          >
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={[
                { value: "Strong", label: "Strong" },
                { value: "Medium", label: "Medium" },
                { value: "Faint", label: "Faint" },
                { value: "None", label: "None" },
              ]}
            />
          </FormItem>
          <FormItem label="Shape" name="shapeId" control={control} required>
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={shapeOptions}
            />
          </FormItem>
          <FormItem
            label="Certificate Url"
            name="certificateUrl"
            control={control}
            required
          >
            <Input
              type="text"
              placeholder="Certificate Url"
              className="font-thin border p-2 rounded-md w-full"
              value="none"
            />
          </FormItem>
          <FormItem label="Status" name="availability" control={control}>
            <Select
              size="large"
              className="font-thin border w-full text-sm"
              options={[
                { value: "true", label: "Available" },
                { value: "false", label: "Unavailable" },
              ]}
            />
          </FormItem>
          <FormItem
            label="Diamond Image"
            name="image"
            control={control}
            required
          >
            <UploadDiamondImage
              fileList={diamondFile}
              setFileList={setDiamondFile}
            />
          </FormItem>

          <Form.Item className="mt-8 mb-0">
            <div className="mt-8">
              <Button
                className="flex items-center px-4 py-5 bg-blue-500 text-white font-semibold rounded-lg shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75"
                htmlType="submit"
              >
                {diamond?.diamondId ? "UPDATE" : "CREATE"}
              </Button>
            </div>
          </Form.Item>
        </Form>
      </div>
    </div>
  );
}
