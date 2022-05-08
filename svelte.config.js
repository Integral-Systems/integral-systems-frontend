import preprocess from 'svelte-preprocess';
import adapter from '@sveltejs/adapter-node';

const config = {
	kit: {
		// hydrate the <div id="svelte"> element in src/app.html
		target: '#svelte',

		adapter: adapter({
			// default options are shown
			out: 'build',
			precompress: false,

			// defaults to 0.0.0.0:3000
			//env: {
			//	host: 'HOST',
			//	port: 'PORT'
			//}
		}),

		vite: {
            // INFO: Added this to prevent build error.
            ssr: {
                noExternal: ['@fortawesome/free-solid-svg-icons']
            },
			css: {
				preprocessorOptions: {
					scss: {
						additionalData: '@use "src/variables.scss" as *;',
					},
				},
			},
		},
	},

	preprocess: [
		preprocess({
			postcss: true,

			scss: {
				prependData: '@use "src/variables.scss" as *;',
			},
		}),
	],
};

export default config;
