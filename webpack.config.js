var path = require("path");
var webpack = require('webpack');

module.exports = {
  devServer: {
    inline: true,
    hot: true,
    contentBase: path.resolve(__dirname, "dist")
  },
  devtool: 'inline-source-map',
  entry: './src/index.js',
  output: {
    path: path.resolve(__dirname, "dist"),
    publicPath: "/assets/",
    filename: 'bundle.js'
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    // XXX: https://github.com/MoOx/eslint-loader/issues/113#issuecomment-248214491
    new webpack.LoaderOptionsPlugin({
      options: {
        eslint: {
          configFile: ".eslintrc"
        }
      }
    })
  ],
  module: {
    loaders: [
      { enforce: "pre", test: /\.js$/, exclude: /node_modules/, loader: "eslint-loader" }
    ]
  }
}
