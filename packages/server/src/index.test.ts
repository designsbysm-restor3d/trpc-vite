import { describe, it, expect } from "vitest";

describe("App", () => {
  it("Math.sqrt()", () => {
    expect(Math.sqrt(4)).toBe(2);
    expect(Math.sqrt(2)).toBe(Math.SQRT2);
  });
});
