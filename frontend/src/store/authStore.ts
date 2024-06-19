import { create } from "zustand";
import { createJSONStorage, persist } from "zustand/middleware";

type GoogleProfile = {
  email: string;
  name: string;
};

export const useAuthStore = create<{
  isLoged: boolean;
  googleProfile: GoogleProfile;
  setGoogleProfile: (profile: GoogleProfile) => void;
}>()(
  persist(
    (set, _get) => ({
      isLoged: false,
      googleProfile: { email: "", name: "" },
      setGoogleProfile: (profile: GoogleProfile) =>
        set({ googleProfile: profile }),
    }),
    {
      name: "auth",
      storage: createJSONStorage(() => sessionStorage),
    }
  )
);
