import { sveltekit } from '@sveltejs/kit/vite';
import houdini from 'houdini/vite';
import type { UserConfig } from "vite";

const config: UserConfig = {
	plugins: [houdini(), sveltekit()],
	resolve: {
		alias: {
			y18n: 'y18n/build/lib/index.js',
		},
	},
	build: {
		commonjsOptions: {
			// Enable better interop for CJS packages expecting default exports
			requireReturnsDefault: 'auto',
			transformMixedEsModules: true,
		},
	},
};

export default config;
