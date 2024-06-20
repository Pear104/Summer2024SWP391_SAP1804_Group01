import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

type CartItem = {
  diamondId: number;
  accessoryId?: number;
  size?: number;
};

export const useCartStore = create<{
  currentDiamond?: number | null;
  currentShape?: string | null;
  currentAccessory?: number | null;
  currentSize?: number | null;
  cart: CartItem[];
  setCurrentDiamond: (diamondId: number | null) => boolean;
  setCurrentShape: (shape: string | null) => void;
  setCurrentAccessory: (
    accessoryId: number | null,
    size: number | null
  ) => void;
  setCart: (diamondId: number, accessoryId?: number, size?: number) => void;
  clearCart: () => void;
}>()(
  persist(
    (set, get) => ({
      currentDiamond: null,
      currentAccessory: null,
      currentSize: null,
      currentShape: null,
      cart: [],
      setCurrentDiamond: (diamondId: number | null) => {
        const existingItem = get().cart.find(
          (item) => item.diamondId === diamondId
        );
        if (existingItem) {
          return false;
        } else {
          set({ currentDiamond: diamondId });
          return true;
        }
      },
      setCurrentShape: (shape: string | null) => set({ currentShape: shape }),
      setCurrentAccessory: (accessoryId: number | null, size: number | null) =>
        set({ currentAccessory: accessoryId, currentSize: size }),
      setCart: (diamondId: number, accessoryId?: number, size?: number) => {
        const existingItem = get().cart.find(
          (item) => item.diamondId === diamondId
        );
        if (existingItem) {
          alert("The diamond is already in the cart");
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
