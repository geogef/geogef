/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./views/**/*.{html,js,erb}", "./public/js/**/*.js"],
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
        animation: {
            'enter-info': 'enter-info 1s ease-in-out forwards',
            'enter-title': 'enter-title 1s ease-in-out forwards'
        },
        keyframes: {
        'enter-title': {
          '0%': { opacity: 0, transform: 'translateY(20px)' },
          '100%': { opacity: 1, transform: 'translateY(0)' },
        },
        'enter-info': {
          '0%': { opacity: 0, transform: 'scale(0.9)' },
          '100%': { opacity: 1, transform: 'scale(1)' },
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
