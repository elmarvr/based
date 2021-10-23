const fs = require("fs");
const path = require("path");

const packagesPath = path.resolve(process.cwd(), "packages");

const packageSlugs = fs
	.readdirSync(packagesPath, { withFileTypes: true })
	.filter((file) => file.isDirectory())
	.map((file) => file.name);

const getPackageJson = (slug) => {
	const packageJsonDir = slug
		? path.resolve(packagesPath, slug)
		: process.cwd();

	const packageJsonPath = path.resolve(packageJsonDir, "package.json");

	return require(packageJsonPath);
};

const rootName = `@${getPackageJson().name}`;

const packageChoices = packageSlugs.map((slug) => {
	const { name } = getPackageJson(slug);

	return { name: slug, value: slug, message: name };
});

module.exports = {
	prompt: async ({ prompter: { prompt } }) => {
		const { dependencies } = await prompt({
			type: "multiselect",

			name: "dependencies",

			message: "Dependencies:",

			choices: packageChoices,

			skip: !packageChoices.length,

			result: (slugs) => {
				return slugs.map((slug) => {
					return {
						slug,
						...getPackageJson(slug),
					};
				});
			},
		});

		return {
			dependencies,
			root: rootName,
		};
	},
};
