import globals from "globals"

/** Please prefer using error instead of warn. */
const rules = {
	"comma-style": ["error", "last"],
	/** @todo */ // complexity: ["error", 3],
	"consistent-return": "error",
	curly: "error",
	"default-param-last": "error",
	"dot-notation": "error",
	"eol-last": ["error", "always"],
	eqeqeq: ["error", "allow-null"],
	"for-direction": "error",
	"func-call-spacing": "error",
	"func-names": ["error", "never"],
	"func-style": ["error", "declaration"],
	indent: ["error", "tab"],
	"linebreak-style": ["error", "unix"],
	"max-len": ["error", { "code": 200 }],
	"no-class-assign": "error",
	"no-cond-assign": ["error", "always"],
	"no-const-assign": "error",
	"no-constant-condition": "error",
	"no-constructor-return": "error",
	"no-debugger": "error",
	"no-delete-var": "error",
	"no-dupe-args": "error",
	"no-dupe-class-members": "error",
	"no-dupe-else-if": "error",
	"no-dupe-keys": "error",
	"no-empty-static-block": "error",
	"no-empty": "error",
	"no-eq-null": "error",
	"no-extra-boolean-cast": "error",
	"no-func-assign": "error",
	"no-global-assign": "error",
	"no-implicit-coercion": "error",
	"no-implied-eval": "error",
	"no-inner-declarations": "error",
	"no-invalid-this": "error",
	"no-irregular-whitespace": "error",
	"no-labels": "error",
	"no-multi-assign": "error",
	"no-negated-condition": "error",
	"no-new": "error",
	"no-octal": "error",
	"no-param-reassign": "error",
	"no-redeclare": "error",
	"no-return-assign": ["error", "always"],
	"no-script-url": "error",
	"no-sequences": "error",
	"no-shadow": ["error", {
		builtinGlobals: false,
		hoist: "functions",
		allow: [],
		ignoreOnInitialization: true,
	}],
	"no-this-before-super": "error",
	"no-throw-literal": "error",
	"no-undef": "error",
	"no-underscore-dangle": ["error", { "allowAfterThis": true }],
	"no-unreachable": "error",
	"no-unused-expressions": "error",
	"no-unused-vars": "error",
	"no-useless-catch": "error",
	"no-useless-concat": "error",
	"no-useless-rename": "error",
	"no-var": "error",
	"no-void": "error",
	"no-with": "error",
	"object-curly-spacing": ["error", "always"],
	"one-var": ["error", "never"],
	"prefer-const": "error",
	"prefer-object-has-own": "error",
	"prefer-object-spread": "error",
	quotes: ["error", "double", {
		allowTemplateLiterals: true,
		avoidEscape: true,
	}],
	"require-await": "error",
	"require-yield": "error",
	"semi-style": ["error", "first"],
	semi: ["error", "never"],
}

export default [
	{
		ignores: ["dist/*"],
	},
	{
		files: ["src/**/*.test.js", "test/**/*.js", ".rollup.js"],
		languageOptions: {
			ecmaVersion: 2022,
			sourceType: "module",
			globals: {
				...globals.node
			}
		},
		rules
	},
	{
		files: ["src/**/*.js"],
		languageOptions: {
			ecmaVersion: 2022,
			sourceType: "module",
			globals: {
				...globals.browser
			}
		},
		rules
	}
]
