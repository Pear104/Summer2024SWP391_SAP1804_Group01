import { Button } from "antd";
import { useEffect, useState } from "react";
import { GET } from "../../utils/request";
import { setCookie } from "../../utils/cookie";

const Field = ({ field, value }: { field: string; value: string }) => {
  return (
    <div className="flex items-center gap-4">
      <div className="font-bold mulish-regular text-lg">{field}:</div>
      <div>{value}</div>
    </div>
  );
};

export default function AccountDetail() {
  const [userInfo, setUserInfo] = useState<any>();
  const field = [
    "name",
    "email",
    "phoneNumber",
    "address",
    "birthday",
    "gender",
    "rewardPoint",
    "createdAt",
  ];
  useEffect(() => {
    (async () => {
      const data = await GET(`/api/Accounts/me`);
      if (data) {
        setUserInfo(data);
      } else {
        setCookie("accessToken", "", 0);
        location.href = "/authentication/login";
      }
    })();
  }, []);

  return (
    <div className="ml-10">
      <div className="font-semibold mulish-regular text-2xl">
        ACCOUNT DETAIL
      </div>
      <div className="pt-6 flex flex-col gap-3">
        {userInfo && (
          <>
            {field.map((key) => {
              return <Field key={key} field={key} value={userInfo[key]} />;
            })}
          </>
        )}
      </div>
      <div className="mt-6">
        <Button className="">EDIT</Button>
      </div>
    </div>
  );
}
