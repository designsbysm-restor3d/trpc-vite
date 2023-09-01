import react from "@vitejs/plugin-react";
import { fileURLToPath, URL } from "node:url";
import { defineConfig, loadEnv } from "vite";

// export default defineConfig({
export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd(), "");
  const serverPort: number = parseInt(env.VITE_PORT, 10) || 3000;

  return {
    server: {
      port: serverPort,
    },
    plugins: [react()],
    resolve: {
      alias: {
        "@": fileURLToPath(new URL("./src", import.meta.url)),
        // "@server": fileURLToPath(new URL("../server", import.meta.url)),
      },
    },
  };
});
