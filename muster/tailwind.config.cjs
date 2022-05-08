const config = {
  mode: "jit",
  purge: ["./src/**/*.{html,js,svelte,ts}"],

  theme: {
    extend: {},
    colors: {
      black: '#000000',
      dark: '#333333',
      white: '#FFFFFF',
      primary: '#e5be00', // '#FF00007F'
    }
  },

  plugins: [],
};

module.exports = config;
