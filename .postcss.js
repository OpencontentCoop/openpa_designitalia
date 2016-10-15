module.exports = {
  use: [
    'postcss-devtools',

    'postcss-easy-import',
    'postcss-custom-properties',
    'postcss-custom-media',

    'postcss-each',
    'postcss-nesting',

    'postcss-extend',
    'postcss-color-function',
    'postcss-inline-svg',
    'postcss-assets',
    'postcss-url',
    'postcss-calc',
    'autoprefixer',

    // @FIXME: get rid of the following
    // when dropping support for ie8
    'postcss-pseudoelements',

    'postcss-flexbugs-fixes',
    'postcss-reporter'
  ],
  'autoprefixer': {
    browsers: ['last 10 versions', 'ie 8', 'ie 9']
  },
  'postcss-url': {
    url: 'copy',
    assetsPath: './'
  },
  'postcss-inline-svg': {
    path: 'ita-web-toolkit/src/'
  },
  'postcss-assets': {
    loadPaths: [ 'ita-web-toolkit/src/' ],
    cachebuster: true
  },
  postcss: {
    from: 'index.css',
    to: 'design/designitalia/stylesheets/build.css',
    map: false,
  }
};
