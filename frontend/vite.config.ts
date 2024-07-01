import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
// export default defineConfig({
//   plugins: [react()],
//   server: {
//     host: "0.0.0.0",
//     port: 3000,
//   },
// });
export default defineConfig({
  plugins: [react()],
  server: {
    watch: { usePolling: true },
    host: true,
    strictPort: true,
    port: 3000, // Replace with any desired port
  },
});
