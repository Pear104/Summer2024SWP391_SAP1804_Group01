import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

type GoogleProfile = {
  email: string;
  name: string;
};

export const useAuthStore = create<{
  isLoged: boolean;
  googleProfile: GoogleProfile;
  count: number;
  setGoogleProfile: (profile: GoogleProfile) => void;
  increase: () => void;
}>()(
  persist(
    (set, get) => ({
      isLoged: false,
      googleProfile: { email: "", name: "" },
      count: 1,
      increase: () =>
        set((state) => ({
          count: state.count + 1,
        })),
      setGoogleProfile: (profile: GoogleProfile) =>
        set({ googleProfile: profile }),
    }),
    {
      name: "auth",
      storage: createJSONStorage(() => sessionStorage),
    }
  )
);
