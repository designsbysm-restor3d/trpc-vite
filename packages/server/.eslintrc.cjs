/* eslint-env node */
require("@rushstack/eslint-patch/modern-module-resolution");

module.exports = {
  root: true,
  extends: ["eslint:recommended", "plugin:@typescript-eslint/recommended-type-checked"],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
    project: ["./tsconfig.app.json", "./tsconfig.node.json"],
    tsconfigRootDir: __dirname,
  },
};
