---
to: <%= packageFolder = `packages/${name}`%>/tsconfig.json
---
{
  "extends": "../../tsconfig.base.json",
	"include": ["src"],
	"exclude": ["lib"],
	"compilerOptions": {
		"baseUrl": ".",
		"rootDir": "src",
		"outDir": "lib",
		"declaration": true,
		"declarationMap": true,
		<%_ if (dependencies.length) { _%>
		"composite": true
		<%_ } -%>
	},
	"references": [
	<%_ dependencies.map(({ slug }, index ) => { _%>
		{ "path": "../<%= slug %>" }<%- index < dependencies.length - 1 ? "," : "" %>
	<%_ }) _%>
	]
}