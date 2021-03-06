const Config = require('./config')

/* Promise polyfill for IE10 */
import Promise from 'promise-polyfill'

if (!window.Promise) {
  window.Promise = Promise
}

/* eslint-disable */
if (window.__PUBLIC_PATH__) {
  __webpack_public_path__ = window.__PUBLIC_PATH__
}
/* eslint-enable */

function _findIndex(ar, predicate) {
  for (let index = 0; index < ar.length; index++) {
    if (predicate(ar[index])) {
      return index
    }
  }
  return -1
}
/*
 *	Every index.js found in src/** directory will be required.
 *
 * 	Too exclude components or modules
 * 	@see config.js
 */
function requireAll(requireContext) {
  let keys = []

  requireContext.keys().forEach((filename) => {
    const dirname = filename.replace(/\\/g, '/').replace(/\/[^\/]*$/, '')

    const exclude = -1 !== _findIndex(Config.excludes, function(v) {
      return dirname.match(new RegExp(v)) !== null
    })

    const include = !exclude &&
      (Config.includes.length === 0 ||
        (-1 !== _findIndex(Config.includes, function(v) {
          return dirname.match(new RegExp(v)) !== null
        })))

    if (include) {
      /*console.log('including: %s', dirname)*/
      keys.push(filename)
    } else {
       /*console.log('excluding: %s', dirname)*/
    }
  })
  return keys.map(requireContext)
}

export default requireAll(require.context('./ita-web-toolkit/src', true, /(.*)index\.js$/))
