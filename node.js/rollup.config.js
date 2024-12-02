import { terser } from "@wwa/rollup-plugin-terser"
import copy from "rollup-plugin-copy-watch"
import nodeResolve from "@rollup/plugin-node-resolve"
import serve from "rollup-plugin-serve"
import livereload from "rollup-plugin-livereload"
import rollupWindowEnv from "@thoughtsunificator/rollup-plugin-window-env"

const isProduction = process.env.BUILD === "production"
const isDevelopment = !isProduction
const dist = isDevelopment ? "dist/app-dev" : "dist/app-prod"

const plugins = [
	isProduction && terser(),
	copy({
		watch: isDevelopment ? "public" : false,
		targets: [{ src: "public/*", dest: dist }],
		flatten: false
	}),
	nodeResolve(),
	isDevelopment && livereload(dist),
	isDevelopment && serve({
		contentBase: dist,
		host: process.env.HOST || "localhost",
		port: process.env.PORT || 3000
	}),
]

export default [
	{
		input: "src/worker/foo.js",
		output: {
			file: `${dist}/worker/foo.js`,
			format: "esm",
			sourcemap: isDevelopment
		},
		plugins
	},
	{
		input: "src/main.js",
		output: {
			file: `${dist}/bundle.js`,
			format: "iife",
			sourcemap: isDevelopment
		},
		plugins: [
			rollupWindowEnv({ envPath : ".env.json", confPath : "data/config.json" }),
			...plugins
		]
	}
]
