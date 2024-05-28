import { LoadingOutlined } from "@ant-design/icons";
import { Spin } from "antd";
import { useEffect } from "react";
import { GET } from "../../utils/request";
import { setCookie } from "../../utils/cookie";

export default function EmailLoading() {
  const url = new URL(window.location.href);
  const params = new URLSearchParams(url.searchParams);
  useEffect(() => {
    (async () => {
      const data = await GET(
        `/api/Authentication/verify-gmail/${params.get("token")}`
      );
      if (data.token) {
        setCookie("accessToken", data.token, 7);
        location.href = "/account";
      } else {
        location.href = "/";
      }
    })();
  }, []);
  return (
    <div className="w-full py-40 flex flex-col justify-center items-center">
      <Spin
        size="large"
        indicator={<LoadingOutlined style={{ fontSize: 100 }} spin />}
      />
      <div className="mt-10 text-blue-700 font-semibold text-xl">
        We are in processing your account
      </div>
    </div>
  );
}
