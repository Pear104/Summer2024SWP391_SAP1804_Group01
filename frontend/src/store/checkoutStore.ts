import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

export const useCheckoutStore = create<{
  email?: string;
  shippingAddress?: string;
  phoneNumber?: string;
  // totalPrice?: number;
  setShippingAddress: (address: string) => void;
  setPhoneNumber: (phoneNumber: string) => void;
  setEmail: (email: string) => void;
  // setTotalPrice: (price: number) => void;
}>()(
  persist(
    (set, get) => ({
      totalPrice: 0,
      email: "",
      shippingAddress: "",
      phoneNumber: "",
      setShippingAddress: (address: string) =>
        set({ shippingAddress: address }),
      setPhoneNumber: (phoneNumber: string) =>
        set({ phoneNumber: phoneNumber }),
      setEmail: (email: string) => set({ email: email }),
      // setTotalPrice: (price: number) =>
      //   set({ totalPrice: (get().totalPrice || 0) + price }),
    }),

    {
      name: "checkout",
      storage: createJSONStorage(() => sessionStorage),
    }
  )
);
