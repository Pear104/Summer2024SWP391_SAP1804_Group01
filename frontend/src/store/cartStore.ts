import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

type CartItem = {
  diamondId: number;
  accessoryId?: number;
  size?: number;
};

export const useCartStore = create<{
  currentDiamond?: number | null;
  currentAccessory?: number | null;
  cart: CartItem[];
  setCurrentDiamond: (diamondId: number | null) => void;
  setCurrentAccessory: (accessoryId: number | null) => void;
  setCart: (diamondId: number, accessoryId: number, size: number) => void;
}>()(
  persist(
    (set, get) => ({
      currentDiamond: null,
      currentAccessory: null,
      cart: [],
      setCurrentDiamond: (diamondId: number | null) =>
        set({ currentDiamond: diamondId }),
      setCurrentAccessory: (accessoryId: number | null) =>
        set({ currentAccessory: accessoryId }),
      setCart: (diamondId: number, accessoryId: number, size: number) =>
        set({ cart: [...get().cart, { diamondId, accessoryId, size }] }),
    }),
    {
      name: "cart",
      storage: createJSONStorage(() => localStorage),
    }
  )
);
