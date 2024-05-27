import React from "react";
import {
  HiOutlineBell,
  HiOutlineChatAlt,
  HiOutlineSearch,
} from "react-icons/hi";
import {
  Popover,
  PopoverButton,
  PopoverPanel,
  Transition,
} from "@headlessui/react";

export default function DashboardHeader() {
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
        <Popover>
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
              <div className="p-3">
                <a
                  className="block rounded-lg py-2 px-3 transition hover:bg-slate-700"
                  href="#"
                >
                  <p className="font-semibold text-white">Documentation</p>
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
              <div className="p-3">
                <a
                  className="block rounded-lg py-2 px-3 transition hover:bg-slate-700"
                  href="#"
                >
                  <p className="font-semibold text-white">Documentation</p>
                </a>
              </div>
            </PopoverPanel>
          </Transition>
        </Popover>
      </div>
    </div>
  );
}
