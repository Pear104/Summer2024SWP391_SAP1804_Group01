import { useNavigate } from "react-router-dom";
import {
  HiOutlineBell,
  HiOutlineChatAlt,
  HiOutlineSearch,
} from "react-icons/hi";
import { Popover, PopoverButton, PopoverPanel } from "@headlessui/react";
import {
  Menu,
  MenuButton,
  MenuItem,
  MenuItems,
  Transition,
} from "@headlessui/react";
import { setCookie } from "../../../utils/cookie";
import { Button } from "antd";

export default function DashboardHeader() {
  const navigate = useNavigate();
  return (
    <div className="bg-white h-16 px-4 flex items-center justify-between border-b border-gray-200">
      <div className="relative">
        <HiOutlineSearch
          fontSize={20}
          className="text-grey-400 absolute top-1/2 -translate-y-1/2 left-3"
        />
        <input
          type="text"
          placeholder="Search...."
          className="text-sm focus:outline-none active:outline-none h-10 w-[24rem] border border-grey-300 rounded-lg px-4 pl-11 pr-4"
        />
      </div>
      <div className="flex items-center gap-3 mr-2">
        {/* <Popover>
          <PopoverButton className="text-sm/6 font-semibold text-neutral-950/50 focus:outline-none data-[active]:text-black data-[hover]:text-black data-[focus]:outline-1 data-[focus]:outline-black">
            <HiOutlineBell fontSize={24} />
          </PopoverButton>
          <Transition
            enter="transition ease-out duration-200"
            enterFrom="opacity-100 translate-y-1"
            enterTo="opacity-100 translate-y-0"
            leave="transition ease-in duration-150"
            leaveFrom="opacity-100 translate-y-0"
            leaveTo="opacity-100 translate-y-1"
          >
            <PopoverPanel
              anchor="bottom"
              className="divide-y divide-black/5 rounded-xl bg-black text-sm/6 [--anchor-gap:var(--spacing-5)]"
            >
              <div className="p-3">
                <a
                  className="block rounded-lg py-2 px-3 transition hover:bg-slate-700"
                  href="#"
                >
                  <p className="font-semibold text-white">Insights</p>
                </a>
                <a
                  className="block rounded-lg py-2 px-3 transition hover:bg-slate-700"
                  href="#"
                >
                  <p className="font-semibold text-white">Automations</p>
                </a>
                <a
                  className="block rounded-lg py-2 px-3 transition hover:bg-slate-700"
                  href="#"
                >
                  <p className="font-semibold text-white">Reports</p>
                </a>
              </div>
            </PopoverPanel>
          </Transition>
        </Popover>

        <Popover>
          <PopoverButton className="text-sm/6 font-semibold text-neutral-950/50 focus:outline-none data-[active]:text-black data-[hover]:text-black data-[focus]:outline-1 data-[focus]:outline-black">
            <HiOutlineChatAlt fontSize={24} />
          </PopoverButton>
          <Transition
            enter="transition ease-out duration-200"
            enterFrom="opacity-100 translate-y-1"
            enterTo="opacity-100 translate-y-0"
            leave="transition ease-in duration-150"
            leaveFrom="opacity-100 translate-y-0"
            leaveTo="opacity-100 translate-y-1"
          >
            <PopoverPanel
              anchor="bottom"
              className="divide-y divide-black/5 rounded-xl bg-black text-sm/6 [--anchor-gap:var(--spacing-5)]"
            >
              <div className="p-3">
                <a
                  className="block rounded-lg py-2 px-3 transition hover:bg-slate-700"
                  href="#"
                >
                  <p className="font-semibold text-white">Insights</p>
                </a>
                <a
                  className="block rounded-lg py-2 px-3 transition hover:bg-slate-700"
                  href="#"
                >
                  <p className="font-semibold text-white">Automations</p>
                </a>
                <a
                  className="block rounded-lg py-2 px-3 transition hover:bg-slate-700"
                  href="#"
                >
                  <p className="font-semibold text-white">Reports</p>
                </a>
              </div>
              
            </PopoverPanel>
          </Transition>
        </Popover> */}

        <Menu as="div">
          <div>
            <MenuButton className="ml-2 inline-flex rounded-full focus:outline-none focus:ring-2 focus:ring-neutral-400">
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
              <MenuItem>
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
              </MenuItem>
              <MenuItem>
                {({ active }) => (
                  <a
                    href="/profile"
                    className={`${
                      active ? "bg-gray-700 text-white" : "text-white"
                    } group flex rounded-md items-center w-full px-2 py-2 text-sm`}
                  >
                    Settings
                  </a>
                )}
              </MenuItem>
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
