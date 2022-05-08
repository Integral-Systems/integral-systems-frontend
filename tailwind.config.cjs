module.exports = {
    mode: 'jit', // ⚠ Make sure to have this
    content: ["./src/**/*.svelte"],
    darkMode: 'class',
    theme: {
        extend: {
            colors: {
                'cust-teal': '#15697A',
                'cust-turqoise': '#26B0BF',
                'cust-indigo-dark': '#1A1351',
                'cust-indigo': '#4F47E5',
                'cust-indigo-light': '#3B1A77',
                'cust-indigo-lighter': '#8C7EBF',
            },
        },
        ripple: theme => ({
            colors: theme('colors')
        }),
    },
    plugins: [
        require('tailwindcss-ripple'),
        require('tailwind-scrollbar'),
        require("daisyui")
    ],
    daisyui: {
        styled: true,
        themes: true,
        base: true,
        utils: true,
        logs: true,
        rtl: false,
        prefix: "",
        darkTheme: "light",
    },
}