const { readFileSync } = require("fs");
const { join } = require("path");

console.log(
  "Bundle content:",
  readFileSync(join(__dirname, "../dep", "bundle.js"), "utf-8")
);
