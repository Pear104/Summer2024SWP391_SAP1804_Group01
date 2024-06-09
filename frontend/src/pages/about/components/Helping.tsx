import { MessageCircleMore, Mail, Phone } from "lucide-react";

export default function Helping() {
  return (
    <div className="bg-slate-100 p-8 rounded-md border border-gray-300">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
        <div className="text-center md:text-left mb-8 md:mb-0 md:flex-1">
          <h2 className="text-2xl font-bold mb-2">We're here to help.</h2>
          <p className="text-gray-700">
            Our expert gemologists are here to help. We’re available seven days
            a week to guide you on diamonds, gemstones, and jewelry.
          </p>
        </div>
        <div className="flex justify-center items-center space-x-20">
          <div className="flex flex-col items-center">
            <MessageCircleMore className="w-8 h-8 mb-2" />
            <span>Chat</span>
          </div>
          <div className="flex flex-col items-center">
            <Mail className="w-8 h-8 mb-2" />
            <span>Email</span>
          </div>
          <div className="flex flex-col items-center">
            <Phone className="w-8 h-8 mb-2" />
            <span>Call</span>
          </div>
        </div>
      </div>
    </div>
  );
}
