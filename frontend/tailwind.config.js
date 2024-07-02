/** @type {import('tailwindcss').Config} */
export default {
  content: ["./src/**/*.{html,js,jsx,ts,tsx}"],
  theme: {
    extend: {
      colors: {
        primary: "#151542",
      },
      screens: {
        xl: { max: "1379px" },
        lg: { max: "1023px" },
        md: { max: "967px" },
        sm: { max: "639px" },
      },
    },
  },
  plugins: [],
  important: true,
};
