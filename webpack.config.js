var path = require("path");
var webpack = require("webpack");

module.exports = {
  devtool: "inline-source-map",
  entry: [
    "./src/index"
  ],
  output: {
    path: path.resolve(__dirname, "public/assets"),
    publicPath: "/public/assets/",
    filename: "bundle.js"
  },
  plugins: [
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
      {
        enforce: "pre",
        test: /\.js$/,
        exclude: /node_modules/,
        loader: "eslint-loader"
      },
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: "babel-loader",
        query: {
          presets: ["react", "latest"],
          plugins: ["react-hot-loader/babel"]
        }
      }
    ]
  }
}
