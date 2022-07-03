import { join } from 'path'
import { rollup } from 'rollup'
import { nodeResolve } from '@rollup/plugin-node-resolve'
import commonjs from '@rollup/plugin-commonjs'
import sourcemaps from 'rollup-plugin-sourcemaps'
import nodePolyfills from 'rollup-plugin-node-polyfills'
import json from '@rollup/plugin-json'

const outputDir = process.argv[3]!
const entryPoint = process.argv[5]!
const bundleName = process.argv[7]!
const outputFileName = process.argv[9]!

async function build() {
  const bundle = await rollup({
    input: [entryPoint],
    context: 'this',
    plugins: [sourcemaps(), json(), nodePolyfills() as any, nodeResolve({ preferBuiltins: false }), commonjs()],
  })
  await bundle.write({
    file: join(outputDir, `${outputFileName}.js`),
    format: 'iife',
    name: bundleName,
    sourcemap: true,
    exports: 'named',
    intro: 'const global = window;',
  })
  await bundle.close()
}

build()
