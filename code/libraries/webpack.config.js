const webpackMerge = require("webpack-merge");
const singleSpaDefaults = require("webpack-config-single-spa-react");
const CleanWebpackPlugin = require("clean-webpack-plugin").CleanWebpackPlugin;
const path = require("path");

module.exports = {
  mode: process.env.mode,
  entry: {
    rxjs: path.resolve(__dirname, 'src/rxjs.js')
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, 'dist'),
    libraryTarget: 'this'
  },
  plugins: [
      new CleanWebpackPlugin()
  ]
};