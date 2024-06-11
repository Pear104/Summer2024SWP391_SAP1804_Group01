import { create } from "zustand";

const url = new URL(window.location.href);

export const useSearchStore = create<{
  queryUrl: string;
  setQueryUrl: (url: string) => void;
  searchTerm: string;
  setSearchTerm: (term: string) => void;
}>((set) => ({
  queryUrl: url.pathname.includes("diamond")
    ? "/api/Diamonds?" + (url.searchParams.toString() || "")
    : "/api/Accessories?" + (url.searchParams.toString() || ""),
  setQueryUrl: (url: string) => set({ queryUrl: url }),
  searchTerm: "",
  setSearchTerm: (term: string) => set({ searchTerm: term }),
}));
