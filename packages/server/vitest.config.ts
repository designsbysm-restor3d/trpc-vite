/// <reference types="vitest" />

import { fileURLToPath } from "node:url";
import { configDefaults, defineConfig } from "vitest/config";

export default defineConfig({
  test: {
    coverage: {
      provider: "istanbul",
    },
    environment: "node",
    exclude: [...configDefaults.exclude, "e2e/*"],
    globals: true,
    root: fileURLToPath(new URL("./", import.meta.url)),
  },
});
