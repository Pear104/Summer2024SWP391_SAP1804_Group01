import { Image } from "antd";

export default function ImageList({
  setMainImage,
  images,
}: {
  setMainImage: any;
  images: any;
}) {
  return (
    <div className="col-span-1 flex flex-col gap-2">
      {images &&
        images.map((image: any) => {
          return (
            <Image
              key={image.url}
              className="border"
              style={{ width: "100%" }}
              src={`${image.url.replace("400x", "800x")}`}
              onMouseMove={() => {
                setMainImage(image.url.replace("400x", "800x"));
              }}
            />
          );
        })}
    </div>
  );
}
