---
to: <%= packageFolder = `packages/${name}`%>/package.json 
sh: cd <%= `${cwd}/${packageFolder}` %> && yarn install
---
{
  "name": "<%= root %>/<%= name %>",
  "version": "0.0.0",
  "description": "> TODO: description",
  "author": "<%= author %>",
  "homepage": "",
  "license": "<%= license %>",
  "main": "lib/index.js",
	"types": "lib/index.d.ts",
  "directories": {
    "lib": "lib"
  },
  "files": [
    "lib"
  ],
	"dependencies": {
		<%_ dependencies.map((dep, index ) => { _%>
		"<%= dep.name %>": "<%= dep.version %>"<%- index < dependencies.length - 1 ? "," : "" -%> 
		<%_ }) -%>
	}
}
