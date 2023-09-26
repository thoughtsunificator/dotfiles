import path from "path"
import postcss from "rollup-plugin-postcss"
import postcssImport from "postcss-import"
import { terser } from "@wwa/rollup-plugin-terser"
import copy from "rollup-plugin-copy-watch"
import nodeResolve from "@rollup/plugin-node-resolve"
import webExt from 'web-ext';
import { babel } from '@rollup/plugin-babel'
import globImport from 'rollup-plugin-glob-import'
import livereload from 'rollup-plugin-livereload'

let started = false

const isProduction = process.env.BUILD === "production"
const isDevelopment = !isProduction

let generateBundle

if(isProduction) {
	generateBundle = function() {
		webExt.cmd.build({
			sourceDir: path.resolve("dist/"),
			filename: "addon.zip",
			artifactsDir: "build",
			overwriteDest: true
		}, {}).then((extensionRunner) => {});
	}
} else {
	generateBundle = function() {
		if(!started) {
			started = true
			webExt.cmd.run({
				target: ['chromium'],
				sourceDir: path.resolve("dist/"),
			}, {}).then((extensionRunner) => {});
		};
	}
}

export default {
	input: "./src/main.js",
	output: {
		file: "./dist/bundle.js",
		format: "iife",
		sourcemap: isDevelopment
	},
	plugins: [
		postcss({
			sourceMap: isDevelopment,
			minimize: isProduction,
			extract: true,
			plugins: [postcssImport()]
		}),
		copy({
			watch: isDevelopment ? "public" : false,
			targets: [{ src: "public/*", dest: "dist" }],
			flatten: false
		}),
		isProduction && terser(),
		nodeResolve(),
		globImport(),
		babel({ babelHelpers: 'bundled' }),
		isDevelopment && livereload("dist"),
		{
			name: 'web-ext',
			generateBundle
		},
	]
}
