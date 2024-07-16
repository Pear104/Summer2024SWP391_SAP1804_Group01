import { useNavigate } from "react-router-dom";

import {
  Menu,
  MenuButton,
  MenuItem,
  MenuItems,
  Transition,
} from "@headlessui/react";
import { setCookie } from "../../../utils/cookie";
import { Button } from "antd";
import { useEffect, useState } from "react";
import { GET } from "../../../utils/request";

export default function DashboardHeader() {
  const navigate = useNavigate();
  const [accountData, setAccountData] = useState<{ name: string } | null>(null);

  useEffect(() => {
    const fetchAccountData = async () => {
      const response = await GET("/api/Accounts/me");
      setAccountData(response);
    };

    fetchAccountData();
  }, []);

  return (
    <div className="bg-white h-16 px-4 flex items-center border-b border-gray-200 justify-end">
      {/* <div className="relative">
        <HiOutlineSearch
          fontSize={20}s
          className="text-grey-400 absolute top-1/2 -translate-y-1/2 left-3"
        />
        <input
          type="text"
          placeholder="Search...."
          className="text-sm focus:outline-none active:outline-none h-10 w-[24rem] border border-grey-300 rounded-lg px-4 pl-11 pr-4"
        />
      </div> */}
      <div className="flex items-center gap-5 text-center">
        Hello, {accountData?.name}
      </div>
      <div className="flex items-center gap-3 mr-2 ">
        <Menu as="div">
          <div>
            <MenuButton className="ml-2 inline-flex rounded-full focus:outline-none focus:ring-2 focus:ring-neutral-400 ">
              <div
                className="h-10 w-10 rounded-full bg-sky-500 bg-cover bg-no-repeat bg-center"
                style={{
                  backgroundImage:
                    'url("https://cdn-icons-png.flaticon.com/512/149/149071.png")',
                }}
              ></div>
            </MenuButton>
          </div>
          <Transition
            enter="transition ease-out duration-75"
            enterFrom="opacity-100 scale-95"
            enterTo="opacity-100 scale-100"
            leave="transition ease-in duration-100"
            leaveFrom="opacity-100 scale-100"
            leaveTo="opacity-100 scale-95"
          >
            <MenuItems
              anchor="bottom end"
              className="w-52 origin-top-right rounded-xl border border-white/5 bg-black p-1 text-sm/6 text-white [--anchor-gap:var(--spacing-1)] focus:outline-none"
            >
              {/* <MenuItem>
                {({ active }) => (
                  <a
                    href="/profile"
                    className={`${
                      active ? "bg-gray-700 text-white" : "text-white"
                    } group flex rounded-md items-center w-full px-2 py-2 text-sm`}
                  >
                    Your Profile
                  </a>
                )}
              </MenuItem> */}

              <MenuItem>
                <Button
                  className="group flex rounded-md items-center w-full px-2 py-2 text-sm text-white bg-gray-700"
                  htmlType="submit"
                  onClick={() => {
                    setCookie("accessToken", "", 0);
                    navigate("/authentication/login");
                  }}
                >
                  Logout
                </Button>
              </MenuItem>
              {/* <MenuItem>
                {({ active }) => (
                  <div
                    onClick={() => {
                      setCookie("accessToken", "", 0);
                      navigate("/authentication/login");
                    }}
                    className={`${
                      active ? "bg-gray-700 text-white" : "text-white"
                    } group flex rounded-md items-center w-full px-2 py-2 text-sm`}
                  >
                    Logout
                  </div>
                )}
              </MenuItem> */}
            </MenuItems>
          </Transition>
        </Menu>
      </div>
    </div>
  );
}
