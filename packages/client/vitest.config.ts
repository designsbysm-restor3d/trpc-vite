/// <reference types="vitest" />

import { fileURLToPath } from "node:url";
import { mergeConfig } from "vite";
import { configDefaults, defineConfig, UserConfig } from "vitest/config";

import viteConfig from "./vite.config";

export default mergeConfig(
  viteConfig,
  defineConfig({
    test: {
      coverage: {
        provider: "istanbul",
      },
      environment: "jsdom",
      exclude: [...configDefaults.exclude, "e2e/*"],
      globals: true,
      root: fileURLToPath(new URL("./", import.meta.url)),
      setupFiles: "./tests/setup.ts",
      transformMode: {
        web: [/\.[jt]sx$/],
      },
    },
  }) as UserConfig
);
