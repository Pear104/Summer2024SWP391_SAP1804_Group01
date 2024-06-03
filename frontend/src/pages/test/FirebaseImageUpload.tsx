import { useEffect, useState } from "react";
import { storage } from "../../utils/firebase";
import { Button, Upload } from "antd";
import { Upload as UploadIcon } from "lucide-react";
import { getDownloadURL, listAll, ref, uploadBytes } from "firebase/storage";
import { v4 } from "uuid";
import { UploadOutlined } from "@ant-design/icons";
function FirebaseImageUpload() {
  const [antPics, setAntPics] = useState([]);
  const [loading, setLoading] = useState(false);
  const [urls, setUrls] = useState<any[]>([]);

  const handleUpload = ({ file, fileList }: { file: any; fileList: any }) => {
    if (file.status !== "uploading") {
      console.log(file, fileList);
    }
  };

  return (
    <Upload
      onChange={handleUpload}
      customRequest={() => {
        console.log("ahihi upload ne");
      }}
      //   action={(file) => {
      //     console.log("upload file nay ne: " + file);
      //     return new Promise((resolve, reject) => {
      //       console.log("ahihihi up load roi");
      //       // Implement your file upload logic here
      //       // Resolve with the uploaded file URL once the upload is complete
      //       // Reject with an error message if the upload fails
      //     });
      //   }}
    >
      <Button icon={<UploadOutlined />}>Upload</Button>
    </Upload>
  );
}
export default FirebaseImageUpload;
