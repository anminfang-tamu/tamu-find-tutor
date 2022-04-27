const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

// environment.plugins.append("Provide", new webpack.ProvidePlugin({
//     $: 'jquery/src/jquery',
//     jQuery: 'jquery/src/jquery',
//     Popper: ['popper.js', 'default']  // Not a typo, we're still using popper.js here
// }))

environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default']
  }))

module.exports = environment
