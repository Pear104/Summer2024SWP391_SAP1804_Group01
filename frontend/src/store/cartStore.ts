import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

type CartItem = {
  diamondId: number;
  accessoryId?: number;
};

export const useCartStore = create<{
  currentDiamond?: number;
  currentAccessory?: number;
  cart: CartItem[];
  setCurrentDiamond: (diamondId: number) => void;
  setCurrentAccessory: (accessoryId: number) => void;
  setCart: (diamondId: number, accessoryId: number) => void;
}>()(
  persist(
    (set, get) => ({
      currentDiamond: undefined,
      currentAccessory: undefined,
      cart: [],
      setCurrentDiamond: (diamondId: number) =>
        set({ currentDiamond: diamondId }),
      setCurrentAccessory: (accessoryId: number) =>
        set({ currentAccessory: accessoryId }),
      setCart: (diamondId: number, accessoryId: number) =>
        set({ cart: [...get().cart, { diamondId, accessoryId }] }),
    }),
    {
      name: "cart",
      storage: createJSONStorage(() => localStorage),
    }
  )
);
