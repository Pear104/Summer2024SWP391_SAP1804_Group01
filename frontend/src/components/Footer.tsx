import {
  Facebook,
  Instagram,
  Mail,
  Phone,
  Twitter,
  Youtube,
} from "lucide-react";
import Logo from "./logo/Logo";

export default function Footer() {
  return (
    <div className="w-screen border-t pt-10 pb-2 px-4">
      <div className="grid grid-cols-2">
        <div className="flex text-base gap-8">
          <div className="flex flex-col gap-2 mulish-regular text-sm">
            <div className="font-bold">Customer Care</div>
            <div className="flex items-center gap-2">
              <Phone size={20} strokeWidth={1} absoluteStrokeWidth />
              <span>0123.456.789</span>
            </div>
            <div className="flex items-center gap-2">
              <Mail size={20} strokeWidth={1} />
              Email us
            </div>
            <div className="flex items-center gap-2">FAQ</div>
          </div>
          <div className="flex flex-col gap-2 mulish-regular text-sm">
            <div className="font-bold">Why DATJ</div>
            <div className="flex items-center gap-2">Refund are free</div>
            <div className="flex items-center gap-2">
              Matching diamonds price
            </div>
            <div className="flex items-center gap-2">
              Free Lifetime Warranty
            </div>
            <div className="flex items-center gap-2">Free Secure Shipping</div>
            <div className="flex items-center gap-2">Jewelry Insurance</div>
            <div className="flex items-center gap-2">
              Many Promotion Program
            </div>
          </div>
          <div className="flex flex-col gap-2 mulish-regular text-sm">
            <div className="font-bold">About DATJ</div>
            <div className="flex items-center gap-2">Quality & Value</div>
            <div className="flex items-center gap-2">
              Diamond Sustainability
            </div>
            <div className="flex items-center gap-2">DATJ Blog</div>
            <div className="flex items-center gap-2">Locations</div>
            <div className="flex items-center gap-2">Careers</div>
          </div>
          <div className="flex flex-col gap-2 mulish-regular text-sm">
            <div className="font-bold">Diamond Shapes</div>
            <div className="flex items-center gap-2">Round</div>
            <div className="flex items-center gap-2">Radiant</div>
            <div className="flex items-center gap-2">Marquise</div>
            <div className="flex items-center gap-2">Asscher</div>
            <div className="flex items-center gap-2">Emerald</div>
            <div className="flex items-center gap-2">Cushion</div>
            <div className="flex items-center gap-2">Oval</div>
            <div className="flex items-center gap-2">Pear</div>
            <div className="flex items-center gap-2">Princess</div>
            <div className="flex items-center gap-2">Heart</div>
          </div>
        </div>
        <div className="flex flex-col ml-8 font-semibold gap-4 mulish-regular text-[#151542]">
          <div className="flex items-center gap-2">
            <Facebook
              size={20}
              color="#151542"
              strokeWidth={1.25}
              absoluteStrokeWidth
            />
            <a
              className="hover:opacity-40 cursor-pointer"
              target="_blank"
              href="https://www.facebook.com/datj.company/"
            >
              Facebook
            </a>
          </div>
          <div className="flex items-center gap-2">
            <Instagram
              size={20}
              color="#151542"
              strokeWidth={1.25}
              absoluteStrokeWidth
            />
            <a className="hover:opacity-40 cursor-pointer">Instagram</a>
          </div>
          <div className="flex items-center gap-2">
            <Twitter
              size={20}
              color="#151542"
              strokeWidth={1.25}
              absoluteStrokeWidth
            />
            <a className="hover:opacity-40 cursor-pointer">Twitter</a>
          </div>
          <div className="flex items-center gap-2">
            <Youtube
              size={20}
              color="#151542"
              strokeWidth={1.25}
              absoluteStrokeWidth
            />
            <a className="hover:opacity-40 cursor-pointer">Youtube</a>
          </div>
        </div>
      </div>
      <div className="border-t text-[#151542] py-4 mt-8 flex items-center justify-between">
        <div className="flex items-center gap-4">
          <Logo />
          <div className="text-sm tracking-widest">© 2024 DAT J .Inc</div>
        </div>
        <div className="flex gap-4 pr-4">
          <a className="hover:opacity-60" href="#">
            Terms & Conditions
          </a>
          <a className="hover:opacity-60" href="#">
            Privacy Policy
          </a>
          <a className="hover:opacity-60" href="#">
            Accessibility
          </a>
          <a className="hover:opacity-60" href="#">
            Do Not Sell My Personal Information
          </a>
        </div>
      </div>
    </div>
  );
}
