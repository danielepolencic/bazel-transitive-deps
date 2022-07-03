import { rollup } from "rollup";
import { writeFileSync } from "fs";
import { join } from "path";

const outputDir = process.argv[3]!;
const bundleName = process.argv[5]!;
const outputFileName = process.argv[7]!;

async function build() {
  writeFileSync(join(outputDir, `${outputFileName}.js`), "test");
}

build();
