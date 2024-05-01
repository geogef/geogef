/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./views/**/*.{html,js,erb}"],
  theme: {
    extend: {
      colors: {
        'fun-blue': {
          '50': '#f3f6fc',
          '100': '#e6edf8',
          '200': '#c7d9f0',
          '300': '#95b8e4',
          '400': '#5c94d4',
          '500': '#3877bf',
          '600': '#285ea4',
          '700': '#214a83',
          '800': '#1f406d',
          '900': '#1f385b',
          '950': '#14243d',
        },
      },
      backgroundImage: theme => ({
        'login-background': "url('src/static/images/bg1.png')",
      }),
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
  ],
}
