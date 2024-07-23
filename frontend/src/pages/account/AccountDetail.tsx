import { Button, App, Progress } from "antd";
import { useEffect, useState } from "react";
import { GET } from "../../utils/request";
import { setCookie } from "../../utils/cookie";
import { formatPhoneNumber } from "../../utils/formatter";
import moment from "moment";
import { useNavigate } from "react-router-dom";
import { useQueries } from "@tanstack/react-query";

function AccountDetailHeader({ header }: { header: string }) {
  const headerMap: { [header: string]: string } = {
    name: "Customer Name",
    email: "Email",
    phoneNumber: "Phone Number",
    address: "Address",
    birthday: "Date of birth",
    gender: "Gender",
    createdAt: "Creation Date",
  };
  const displayHeader = headerMap[header] || header;
  return (
    <div className="uppercase text-base font-semibold border-b border-black mb-2">
      {displayHeader}
    </div>
  );
}

export default function AccountDetail() {
  const [userInfo, setUserInfo] = useState<any>();
  const [nextRank, setNextRank] = useState<number>(0);
  const { message } = App.useApp();

  const field = [
    "name",
    "email",
    "phoneNumber",
    "address",
    "birthday",
    "gender",
    "createdAt",
  ];

  const navigate = useNavigate();
  useEffect(() => {
    (async () => {
      const data = await GET(`/api/Accounts/me`);
      if (data) {
        setUserInfo(data);
        if (data?.rank?.rankId != 6) {
          setNextRank(data?.rank?.rankId + 1);
        } else {
          setNextRank(0);
        }
      } else {
        setCookie("accessToken", "", 0);
        navigate("/authentication/login");
        message.error("Your session has timed out, please login again!");
      }
    })();
  }, []);

  const [ranks] = useQueries({
    queries: [
      {
        queryKey: ["ranks"],
        queryFn: () => GET("/api/Ranks/"),
      },
    ],
  });
  return (
    <div className="ml-4 mt-4 mb-8">
      <div className="font-bold mulish-regular text-xl mb-4">
        ACCOUNT DETAIL
      </div>
      <div className="flex gap-10">
        <div className="flex flex-col items-center">
          <div
            className="bg-white aspect-square w-[240px] rounded-full bg-cover bg-center bg-no-repeat border"
            style={{
              backgroundImage: `url(https://robohash.org/${userInfo?.name})`,
            }}
          ></div>
          <div className="mt-4 font-semibold text-xl flex items-center gap-2">
            {userInfo?.name}
            <div
              title={userInfo?.rank?.rankName}
              className="aspect-square w-[50px] rounded-full bg-cover bg-center bg-no-repeat"
              style={{
                backgroundImage: `url("/images/rank/${userInfo?.rank?.rankName?.toLowerCase()}.png")`,
              }}
            ></div>
          </div>
          {userInfo && (
            <div className="w-full">
              <div className="text-center">
                Current reward: sale off {userInfo?.rank?.discount * 100}% all
                order
              </div>
              {userInfo?.rank?.rankId != 6 && (
                <Progress
                  percent={Math.floor(
                    ((userInfo?.rewardPoint - userInfo?.rank?.rewardPoint) /
                      (ranks?.data?.find((r: any) => r.rankId == nextRank)
                        ?.rewardPoint -
                        userInfo?.rank?.rewardPoint)) *
                      100
                  )}
                  size="small"
                />
              )}
              {userInfo?.rank?.rankId != 6 ? (
                <div>
                  You need{" "}
                  {ranks?.data?.find((r: any) => r.rankId == nextRank)
                    ?.rewardPoint - userInfo?.rewardPoint}{" "}
                  point more to reach next rank
                </div>
              ) : (
                <div>You reached the highest rank in the system</div>
              )}
            </div>
          )}
        </div>
        <div>
          <div className="pl-10 grid grid-cols-2 gap-y-4 gap-x-14">
            {userInfo && (
              <>
                {field.map((key) => {
                  return (
                    <div>
                      <AccountDetailHeader header={key} />
                      <div>
                        {key == "birthday" || key == "createdAt"
                          ? moment(userInfo[key]).format("MM/DD/YYYY")
                          : key == "phoneNumber"
                          ? formatPhoneNumber(userInfo[key])
                          : userInfo[key]}
                      </div>
                    </div>
                  );
                  // return <Field key={key} field={key} value={userInfo[key]} />;
                })}
              </>
            )}
          </div>
        </div>
      </div>

      <div className="mt-6 flex gap-4">
        <Button
          className="uppercase px-4 hover:scale-95 font-bold text-white bg-primary py-4 flex items-center justify-center"
          htmlType="submit"
          onClick={() => {
            setCookie("accessToken", "", 0);
            navigate("/authentication/login");
          }}
        >
          Logout
        </Button>
        <Button
          className="px-4 hover:scale-95 font-bold text-white bg-primary py-4 flex items-center justify-center"
          htmlType="submit"
          onClick={() => {
            navigate("/account/edit");
          }}
        >
          EDIT PROFILE
        </Button>
      </div>
    </div>
  );
}
