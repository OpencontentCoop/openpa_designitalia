var webpack = require('webpack')
var path = require('path')
var libraryName = 'IWT'

var UglifyJsPlugin = webpack.optimize.UglifyJsPlugin

var plugins = []
var loaders = []

if ('dev' !== process.env.WEBPACK_ENV) {
  plugins.push(new UglifyJsPlugin({
    minimize: true,
    sourceMap: true
  }))
}

plugins.push(
  new webpack.ContextReplacementPlugin(/moment[\/\\]locale$/, /it/)
)

loaders.push({
  test: /\.png/,
  loader: 'url-loader?limit=100000&minetype=image/png'
})

loaders.push({
  test: /\.css$/,
  use: [
    { loader: 'style-loader' },
    { loader: 'css-loader' },
  ]
})

plugins.push(new webpack.LoaderOptionsPlugin({
  debug: true
}))

var config = {
  entry: {
    IWT: __dirname + '/index.js',
    /*styleguide: __dirname + '/assets/index-styleguide.js'*/
  },
  devtool: 'source-map',
  output: {
    path: __dirname + '/design/designitalia/javascript',
    filename: '[name].min.js',
    library: libraryName,
    libraryTarget: 'umd',
    umdNamedDefine: true,
    publicPath: /*process.env.PUBLIC_PATH || ''*/ '/extension/openpa_designitalia/design/designitalia/javascript/',
    chunkFilename: '[name].chunk.js'
  },
  externals: {
    'jquery': 'jQuery',
    '$': 'jQuery',
  },
  module: {
    rules: [...loaders, {
      test: /(\.jsx|\.js)$/,
      loader: 'babel-loader',
      exclude: /(pikaday)/,
      // exclude: /(node_modules|bower_components)/
    }, {
      test: /(\.jsx|\.js)$/,
      loader: 'eslint-loader',
      exclude: /node_modules/
    }]
  },
  resolve: {
    modules: [
      path.resolve('./ita-web-toolkit/src'),
      path.resolve('./ita-web-toolkit/assets'),
      'node_modules'
    ]
  },
  plugins: plugins,
}

module.exports = config
