import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

type CartItem = {
  diamondId: number;
  accessoryId?: number;
  size?: number;
};

export const useCartStore = create<{
  [x: string]: any;
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
      setCart: (diamondId: number, accessoryId: number, size: number) => {
        const existingItem = get().cart.find(item => item.diamondId === diamondId);
        if (existingItem) {
          alert('The diamond is already in the cart');
        } else {
          set({ cart: [...get().cart, { diamondId, accessoryId, size }] });
        }
      },
      // Hàm cập nhật size của một mục trong cart
      updateCartItemSize: (diamondId: number, size: number) => {
        set({
          cart: get().cart.map((item) =>
            item.diamondId === diamondId ? { ...item, size } : item
          ),
        });
      },
      // Hàm xóa một mục khỏi cart
      removeCartItem: (diamondId: number) => {
        set({
          cart: get().cart.filter((item) => item.diamondId !== diamondId),
        });
      },
      // Hàm xóa tất cả các mục trong cart
      clearCart: () => {
        set({ cart: [] });
      },
    }),

    {
      name: "cart",
      storage: createJSONStorage(() => localStorage),
    }
  )
);
