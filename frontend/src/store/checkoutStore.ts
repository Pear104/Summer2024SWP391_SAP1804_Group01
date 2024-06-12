import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

export const useCheckoutStore = create<{
  email?: string;
  shippingAddress?: string;
  phoneNumber?: string;
  name?: string;
  setShippingAddress: (address: string) => void;
  setPhoneNumber: (phoneNumber: string) => void;
  setEmail: (email: string) => void;
  setName: (name: string) => void;
}>()(
  persist(
    (set) => ({
      totalPrice: 0,
      email: "",
      shippingAddress: "",
      phoneNumber: "",
      name: "",
      setShippingAddress: (address: string) =>
        set({ shippingAddress: address }),
      setPhoneNumber: (phoneNumber: string) =>
        set({ phoneNumber: phoneNumber }),
      setEmail: (email: string) => set({ email: email }),
      setName: (name: string) => set({ name: name }),
    }),

    {
      name: "checkout",
      storage: createJSONStorage(() => sessionStorage),
    }
  )
);
