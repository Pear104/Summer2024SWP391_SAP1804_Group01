import { Image } from "antd";

export default function ImageList({
  setMainImage,
  diamondImage,
  accessoryImage,
}: {
  setMainImage: any;
  diamondImage: any;
  accessoryImage: any;
}) {
  return (
    <div className="col-span-1 flex flex-col gap-2">
      <div className="image-parent">
        <Image
          className="border"
          style={{ width: "100%" }}
          src={`${diamondImage}`}
          onMouseMove={() => {
            setMainImage(diamondImage);
          }}
        />
      </div>
      {accessoryImage &&
        accessoryImage.map((image: any) => {
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
