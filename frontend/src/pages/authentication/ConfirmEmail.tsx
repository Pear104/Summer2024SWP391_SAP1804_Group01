import { setCookie } from "../../utils/cookie";

export default function ConfirmEmail() {
  setCookie("accessToken", "", 0);
  return (
    <div className="flex-col w-full -translate-y-16 h-[600px] flex justify-center items-center font-bold mulish-regular text-2xl">
      Go to your email to get the verification link.
    </div>
  );
}
