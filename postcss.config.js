module.exports = {
  plugins: [
    require('postcss-import'),
    // require('tailwindcss'),
    // require('autoprefixer'),
    require('tailwindcss'),
    require('autoprefixer'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      // tailwindcss: {},
      stage: 3
    })
  ]
}
