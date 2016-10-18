(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory(require("jQuery"));
	else if(typeof define === 'function' && define.amd)
		define("IWT", ["jQuery"], factory);
	else if(typeof exports === 'object')
		exports["IWT"] = factory(require("jQuery"));
	else
		root["IWT"] = factory(root["jQuery"]);
})(this, function(__WEBPACK_EXTERNAL_MODULE_4__) {
return /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
		value: true
	});
	
	var _scripts = __webpack_require__(1);
	
	var _scripts2 = _interopRequireDefault(_scripts);
	
	var _form = __webpack_require__(5);
	
	var _form2 = _interopRequireDefault(_form);
	
	var _table = __webpack_require__(6);
	
	var _table2 = _interopRequireDefault(_table);
	
	var _accordion = __webpack_require__(8);
	
	var _accordion2 = _interopRequireDefault(_accordion);
	
	var _cookiebar = __webpack_require__(14);
	
	var _cookiebar2 = _interopRequireDefault(_cookiebar);
	
	var _dialog = __webpack_require__(17);
	
	var _dialog2 = _interopRequireDefault(_dialog);
	
	var _masonry = __webpack_require__(21);
	
	var _masonry2 = _interopRequireDefault(_masonry);
	
	var _skiplinks = __webpack_require__(23);
	
	var _skiplinks2 = _interopRequireDefault(_skiplinks);
	
	var _treeview = __webpack_require__(27);
	
	var _treeview2 = _interopRequireDefault(_treeview);
	
	var _offcanvas = __webpack_require__(28);
	
	var _offcanvas2 = _interopRequireDefault(_offcanvas);
	
	var _header = __webpack_require__(32);
	
	var _header2 = _interopRequireDefault(_header);
	
	var _megamenu = __webpack_require__(34);
	
	var _megamenu2 = _interopRequireDefault(_megamenu);
	
	var _share = __webpack_require__(36);
	
	var _share2 = _interopRequireDefault(_share);
	
	var _scrolltop = __webpack_require__(37);
	
	var _scrolltop2 = _interopRequireDefault(_scrolltop);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	/*import IwtTooltip from './ita-web-toolkit/src/modules/tooltip'*/
	
	/*import IwtCarousel from './ita-web-toolkit/src/modules/carousel'*/
	var __exports = {
		IwtTable: _table2['default'],
		IwtAccordion: _accordion2['default'],
		/*	IwtCarousel,*/
		IwtCookiebar: _cookiebar2['default'],
		IwtDialog: _dialog2['default'],
		IwtMasonry: _masonry2['default'],
		IwtTreeview: _treeview2['default'],
		IwtSkiplinks: _skiplinks2['default'],
		IwtOffcanvas: _offcanvas2['default'],
		IwtHeadroom: _header2['default'],
		IwtMegamenu: _megamenu2['default'],
		/*IwtTooltip,*/
		IwtScripts: _scripts2['default'],
		IwtScrolltop: _scrolltop2['default'],
		IwtShare: _share2['default'],
		IwtForm: _form2['default']
	};
	
	exports['default'] = __exports;
	module.exports = exports['default'];

/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	__webpack_require__(2);
	__webpack_require__(3);

/***/ },
/* 2 */
/***/ function(module, exports) {

	'use strict';
	
	// Avoid `console` errors in browsers that lack a console.
	(function () {
	  var method;
	  var noop = function noop() {};
	  var methods = ['assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error', 'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log', 'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd', 'timeStamp', 'trace', 'warn'];
	  var length = methods.length;
	  var console = window.console = window.console || {};
	
	  while (length--) {
	    method = methods[length];
	
	    // Only stub undefined methods.
	    if (!console[method]) {
	      console[method] = noop;
	    }
	  }
	})();

/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	var _jquery = __webpack_require__(4);
	
	var _jquery2 = _interopRequireDefault(_jquery);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	(0, _jquery2['default'])(document).ready(function () {
	  var $header = (0, _jquery2['default'])('header');
	  (0, _jquery2['default'])('.js-scrollTo').on('click', function (event) {
	    var offset = (0, _jquery2['default'])(_jquery2['default'].attr(this, 'href')).offset();
	    (0, _jquery2['default'])('html, body').animate({
	      scrollTop: (offset ? offset.top : 0) - ($header.length ? $header.height() : 0)
	    }, 250);
	    event.preventDefault();
	  });
	});

/***/ },
/* 4 */
/***/ function(module, exports) {

	module.exports = __WEBPACK_EXTERNAL_MODULE_4__;

/***/ },
/* 5 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	var _jquery = __webpack_require__(4);
	
	var _jquery2 = _interopRequireDefault(_jquery);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	(0, _jquery2['default'])(document).ready(function () {
	  (0, _jquery2['default'])(':radio, :checkbox').on('change', function () {
	    if ((0, _jquery2['default'])(this).is(':radio')) {
	      (0, _jquery2['default'])(this).closest('.Form-field').find('.Form-label.is-checked').removeClass('is-checked');
	    }
	    if ((0, _jquery2['default'])(this).is(':checked')) {
	      (0, _jquery2['default'])(this).closest('.Form-label').addClass('is-checked');
	    } else {
	      (0, _jquery2['default'])(this).closest('.Form-label').removeClass('is-checked');
	    }
	  });
	});

/***/ },
/* 6 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	
	var _jquery = __webpack_require__(4);
	
	var _jquery2 = _interopRequireDefault(_jquery);
	
	var _throttle = __webpack_require__(7);
	
	var _throttle2 = _interopRequireDefault(_throttle);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	var defaultOpts = {
	  responsiveTableSelector: '.js-tableFlip',
	  responsiveTableClass: 'Table--flip',
	  responsiveTableBreakpoint: 768
	};
	
	var initResponsiveTables = function initResponsiveTables(opts) {
	  (0, _jquery2['default'])(document).ready(function () {
	    if ((0, _jquery2['default'])(opts.responsiveTableSelector).length > 0) {
	      (0, _jquery2['default'])(window).resize((0, _throttle2['default'])(250, function () {
	        if ((0, _jquery2['default'])(window).width() < opts.responsiveTableBreakpoint) {
	          (0, _jquery2['default'])(opts.responsiveTableSelector).addClass(opts.responsiveTableClass);
	        } else {
	          (0, _jquery2['default'])(opts.responsiveTableSelector).removeClass(opts.responsiveTableClass);
	        }
	      }));
	    }
	  });
	};
	
	initResponsiveTables(defaultOpts);
	
	exports['default'] = { defaultOpts: defaultOpts, initResponsiveTables: initResponsiveTables };
	module.exports = exports['default'];

/***/ },
/* 7 */
/***/ function(module, exports) {

	'use strict';
	
	/* eslint-disable no-undefined,no-param-reassign,no-shadow */
	
	/**
	 * Throttle execution of a function. Especially useful for rate limiting
	 * execution of handlers on events like resize and scroll.
	 *
	 * @param  {Number}    delay          A zero-or-greater delay in milliseconds. For event callbacks, values around 100 or 250 (or even higher) are most useful.
	 * @param  {Boolean}   noTrailing     Optional, defaults to false. If noTrailing is true, callback will only execute every `delay` milliseconds while the
	 *                                    throttled-function is being called. If noTrailing is false or unspecified, callback will be executed one final time
	 *                                    after the last throttled-function call. (After the throttled-function has not been called for `delay` milliseconds,
	 *                                    the internal counter is reset)
	 * @param  {Function}  callback       A function to be executed after delay milliseconds. The `this` context and all arguments are passed through, as-is,
	 *                                    to `callback` when the throttled-function is executed.
	 * @param  {Boolean}   debounceMode   If `debounceMode` is true (at begin), schedule `clear` to execute after `delay` ms. If `debounceMode` is false (at end),
	 *                                    schedule `callback` to execute after `delay` ms.
	 *
	 * @return {Function}  A new, throttled, function.
	 */
	module.exports = function (delay, noTrailing, callback, debounceMode) {
	
		// After wrapper has stopped being called, this timeout ensures that
		// `callback` is executed at the proper times in `throttle` and `end`
		// debounce modes.
		var timeoutID;
	
		// Keep track of the last time `callback` was executed.
		var lastExec = 0;
	
		// `noTrailing` defaults to falsy.
		if (typeof noTrailing !== 'boolean') {
			debounceMode = callback;
			callback = noTrailing;
			noTrailing = undefined;
		}
	
		// The `wrapper` function encapsulates all of the throttling / debouncing
		// functionality and when executed will limit the rate at which `callback`
		// is executed.
		function wrapper() {
	
			var self = this;
			var elapsed = Number(new Date()) - lastExec;
			var args = arguments;
	
			// Execute `callback` and update the `lastExec` timestamp.
			function exec() {
				lastExec = Number(new Date());
				callback.apply(self, args);
			}
	
			// If `debounceMode` is true (at begin) this is used to clear the flag
			// to allow future `callback` executions.
			function clear() {
				timeoutID = undefined;
			}
	
			if (debounceMode && !timeoutID) {
				// Since `wrapper` is being called for the first time and
				// `debounceMode` is true (at begin), execute `callback`.
				exec();
			}
	
			// Clear any existing timeout.
			if (timeoutID) {
				clearTimeout(timeoutID);
			}
	
			if (debounceMode === undefined && elapsed > delay) {
				// In throttle mode, if `delay` time has been exceeded, execute
				// `callback`.
				exec();
			} else if (noTrailing !== true) {
				// In trailing throttle mode, since `delay` time has not been
				// exceeded, schedule `callback` to execute `delay` ms after most
				// recent execution.
				//
				// If `debounceMode` is true (at begin), schedule `clear` to execute
				// after `delay` ms.
				//
				// If `debounceMode` is false (at end), schedule `callback` to
				// execute after `delay` ms.
				timeoutID = setTimeout(debounceMode ? clear : exec, debounceMode === undefined ? delay - elapsed : delay);
			}
		}
	
		// Return the wrapper function.
		return wrapper;
	};

/***/ },
/* 8 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
		value: true
	});
	
	var _frAccordion = __webpack_require__(9);
	
	var _frAccordion2 = _interopRequireDefault(_frAccordion);
	
	var _accordion = __webpack_require__(10);
	
	var _accordion2 = _interopRequireDefault(_accordion);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	/* eslint-enable */
	
	var accordion = (0, _frAccordion2['default'])({
		// String - Use header id on element to tie each accordion panel to its header - see panelIdPrefix
		headerIdPrefix: 'accordion-header',
		// String - Use panel id on element to tie each accordion header to its panel - see headerIdPrefix
		panelIdPrefix: 'accordion-panel',
		// Boolean - If set to false, all accordion panels will be closed on init()
		firstPanelsOpenByDefault: false,
		// Boolean - If set to false, each accordion instance will only allow a single panel to be open at a time
		multiselectable: false,
		// String - Class name that will be added to the selector when the component has been initialised
		readyClass: 'fr-accordion--is-ready'
	});
	
	/* eslint-disable no-unused-vars */
	
	exports['default'] = { accordion: accordion, Fraccordion: _frAccordion2['default'] };
	module.exports = exports['default'];

/***/ },
/* 9 */
/***/ function(module, exports) {

	'use strict';
	
	/**
	 * @param {object} options Object containing configuration overrides
	 */
	
	Object.defineProperty(exports, "__esModule", {
		value: true
	});
	var Fraccordion = function Fraccordion() {
		var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
	
		var _ref$selector = _ref.selector;
		var selector = _ref$selector === undefined ? '.js-fr-accordion' : _ref$selector;
		var _ref$headerSelector = _ref.headerSelector;
		var headerSelector = _ref$headerSelector === undefined ? '.js-fr-accordion__header' : _ref$headerSelector;
		var _ref$headerIdPrefix = _ref.headerIdPrefix;
		var headerIdPrefix = _ref$headerIdPrefix === undefined ? 'accordion-header' : _ref$headerIdPrefix;
		var _ref$panelSelector = _ref.panelSelector;
		var panelSelector = _ref$panelSelector === undefined ? '.js-fr-accordion__panel' : _ref$panelSelector;
		var _ref$panelIdPrefix = _ref.panelIdPrefix;
		var panelIdPrefix = _ref$panelIdPrefix === undefined ? 'accordion-panel' : _ref$panelIdPrefix;
		var _ref$firstPanelsOpenB = _ref.firstPanelsOpenByDefault;
		var firstPanelsOpenByDefault = _ref$firstPanelsOpenB === undefined ? true : _ref$firstPanelsOpenB;
		var _ref$multiselectable = _ref.multiselectable;
		var multiselectable = _ref$multiselectable === undefined ? true : _ref$multiselectable;
		var _ref$readyClass = _ref.readyClass;
		var readyClass = _ref$readyClass === undefined ? 'fr-accordion--is-ready' : _ref$readyClass;
		var _ref$transitionLength = _ref.transitionLength;
		var transitionLength = _ref$transitionLength === undefined ? 250 : _ref$transitionLength;
	
	
		// CONSTANTS
		var doc = document;
		var docEl = doc.documentElement;
		var _q = function _q(el) {
			var ctx = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : doc;
			return [].slice.call(ctx.querySelectorAll(el));
		};
	
		// SUPPORTS
		if (!('querySelector' in doc) || !('addEventListener' in window) || !docEl.classList) return;
	
		// SETUP
		// set accordion element NodeLists
		var accordionContainers = _q(selector);
	
		// A11Y
		function _addA11y(accordionContainer) {
			// get accordion elements
			var accordionHeaders = _q(headerSelector, accordionContainer);
			var accordionPanels = _q(panelSelector, accordionContainer);
	
			// add relevant roles and properties
			accordionContainer.setAttribute('role', 'tablist');
			accordionContainer.setAttribute('aria-multiselectable', multiselectable);
	
			accordionHeaders.forEach(function (accordionHeader) {
				accordionHeader.setAttribute('role', 'tab');
				accordionHeader.setAttribute('aria-controls', accordionHeader.id.replace(headerIdPrefix, panelIdPrefix));
				// make headers focusable, this is preferred over wrapping contents in native button element
				accordionHeader.setAttribute('tabindex', 0);
			});
	
			accordionPanels.forEach(function (accordionPanel) {
				accordionPanel.setAttribute('role', 'tabpanel');
				accordionPanel.setAttribute('aria-labelledby', accordionPanel.id.replace(panelIdPrefix, headerIdPrefix));
				// make tabpanel focusable
				accordionPanel.setAttribute('tabindex', 0);
			});
		}
		function _removeA11y(accordionContainer) {
			// get accordion elements
			var accordionHeaders = _q(headerSelector, accordionContainer);
			var accordionPanels = _q(panelSelector, accordionContainer);
	
			// remove roles and properties
			accordionContainer.removeAttribute('role');
			accordionContainer.removeAttribute('aria-multiselectable');
	
			accordionHeaders.forEach(function (accordionHeader) {
				accordionHeader.removeAttribute('role');
				accordionHeader.removeAttribute('aria-controls');
				accordionHeader.removeAttribute('aria-selected');
				accordionHeader.removeAttribute('aria-expanded');
				// remove headers focusablility
				accordionHeader.removeAttribute('tabindex');
			});
	
			accordionPanels.forEach(function (accordionPanel) {
				accordionPanel.removeAttribute('role');
				accordionPanel.removeAttribute('aria-labelledby');
				accordionPanel.removeAttribute('aria-hidden');
				// remove tabpanel focusablibility
				accordionPanel.removeAttribute('tabindex');
			});
		}
	
		//	UTILS
		function _getPanelHeight(panel) {
			//	set auto height and read offsetHeight
			panel.style.height = 'auto';
			var height = panel.offsetHeight;
			//	remove style
			panel.style.height = '';
			return height;
		}
		function _setPanelHeight(panel) {
			//	get panel height
			var panelHeight = _getPanelHeight(panel);
			//	recalc style and layout
			panel.getBoundingClientRect();
			//	set height on panel, reset to 'auto' on transition complete
			panel.style.height = panelHeight + 'px';
			setTimeout(function () {
				panel.style.transition = 'none';
				panel.style.height = 'auto';
				//	recalc style and layout
				panel.getBoundingClientRect();
				panel.style.transition = '';
			}, transitionLength);
		}
		function _unsetPanelHeight(panel) {
			//	get panel height
			var panelHeight = _getPanelHeight(panel);
			//	set panel height from 'auto' to px
			panel.style.height = panelHeight + 'px';
			//	recalc style and layout
			panel.getBoundingClientRect();
			//	reset height
			panel.style.height = 0;
		}
	
		// ACTIONS
		function _hideAllPanels(accordionContainer) {
			// get accordion elements
			var siblingHeaders = _q(headerSelector, accordionContainer);
			var siblingPanels = _q(panelSelector, accordionContainer);
	
			// set inactives
			siblingHeaders.forEach(function (header) {
				header.setAttribute('tabindex', -1);
				header.setAttribute('aria-selected', 'false');
				header.setAttribute('aria-expanded', 'false');
			});
			siblingPanels.forEach(function (panel) {
				if (panel.getAttribute('aria-hidden') === 'false') _unsetPanelHeight(panel);
				//	toggle aria-hidden
				panel.setAttribute('aria-hidden', 'true');
			});
		}
		function _hidePanel(target) {
			//	get panel
			var activePanel = doc.getElementById(target.getAttribute('aria-controls'));
			target.setAttribute('aria-selected', 'false');
			target.setAttribute('aria-expanded', 'false');
			//	toggle aria-hidden
			_unsetPanelHeight(activePanel);
			activePanel.setAttribute('aria-hidden', 'true');
		}
		function _showPanel(target) {
			//	get panel
			var activePanel = doc.getElementById(target.getAttribute('aria-controls'));
			//	set attributes on header
			target.setAttribute('tabindex', 0);
			target.setAttribute('aria-selected', 'true');
			target.setAttribute('aria-expanded', 'true');
			//	toggle aria-hidden and set height on panel
			_setPanelHeight(activePanel);
			activePanel.setAttribute('aria-hidden', 'false');
			setTimeout(function () {
				return _bindAccordionEvents(target.parentNode);
			}, transitionLength);
		}
		function _togglePanel(target) {
			// get context of accordion container and its children
			var thisContainer = target.parentNode;
			// close target panel if already active
			if (target.getAttribute('aria-selected') === 'true') {
				_hidePanel(target);
				return;
			}
			// if not multiselectable hide all, then show target
			if (!multiselectable) _hideAllPanels(thisContainer);
	
			_showPanel(target);
			if (transitionLength > 0) _unbindAccordionEvents(thisContainer);
		}
		function _giveHeaderFocus(headerSet, i) {
			// remove focusability from inactives
			headerSet.forEach(function (header) {
				header.setAttribute('tabindex', -1);
			});
			// set active focus
			headerSet[i].setAttribute('tabindex', 0);
			headerSet[i].focus();
		}
	
		//	EVENTS
		function _eventHeaderClick(e) {
			_togglePanel(e.currentTarget);
		}
		function _eventHeaderKeydown(e) {
			// collect header targets, and their prev/next
			var currentHeader = e.currentTarget;
			var isModifierKey = e.metaKey || e.altKey;
			// get context of accordion container and its children
			var thisContainer = currentHeader.parentNode;
			var theseHeaders = _q(headerSelector, thisContainer);
			var currentHeaderIndex = [].indexOf.call(theseHeaders, currentHeader);
	
			// don't catch key events when ⌘ or Alt modifier is present
			if (isModifierKey) return;
	
			// catch enter/space, left/right and up/down arrow key events
			// if new panel show it, if next/prev move focus
			switch (e.keyCode) {
				case 13:
				case 32:
					_togglePanel(currentHeader);
					e.preventDefault();
					break;
				case 37:
				case 38:
					{
						var previousHeaderIndex = currentHeaderIndex === 0 ? theseHeaders.length - 1 : currentHeaderIndex - 1;
						_giveHeaderFocus(theseHeaders, previousHeaderIndex);
						e.preventDefault();
						break;
					}
				case 39:
				case 40:
					{
						var nextHeaderIndex = currentHeaderIndex < theseHeaders.length - 1 ? currentHeaderIndex + 1 : 0;
						_giveHeaderFocus(theseHeaders, nextHeaderIndex);
						e.preventDefault();
						break;
					}
				default:
					break;
			}
		}
	
		//	BIND EVENTS
		function _bindAccordionEvents(accordionContainer) {
			var accordionHeaders = _q(headerSelector, accordionContainer);
			// bind all accordion header click and keydown events
			accordionHeaders.forEach(function (accordionHeader) {
				accordionHeader.addEventListener('click', _eventHeaderClick);
				accordionHeader.addEventListener('keydown', _eventHeaderKeydown);
			});
		}
	
		//	UNBIND EVENTS
		function _unbindAccordionEvents(accordionContainer) {
			var accordionHeaders = _q(headerSelector, accordionContainer);
			// unbind all accordion header click and keydown events
			accordionHeaders.forEach(function (accordionHeader) {
				accordionHeader.removeEventListener('click', _eventHeaderClick);
				accordionHeader.removeEventListener('keydown', _eventHeaderKeydown);
			});
		}
	
		// DESTROY
		function destroy() {
			accordionContainers.forEach(function (accordionContainer) {
				_removeA11y(accordionContainer);
				_unbindAccordionEvents(accordionContainer);
				accordionContainer.classList.remove(readyClass);
			});
		}
	
		// INIT
		function init() {
			if (accordionContainers.length) {
				accordionContainers.forEach(function (accordionContainer) {
					_addA11y(accordionContainer);
					_bindAccordionEvents(accordionContainer);
					_hideAllPanels(accordionContainer);
					// set all first accordion panels active on init if required (default behaviour)
					// otherwise make sure first accordion header for each is focusable
					if (firstPanelsOpenByDefault) {
						_togglePanel(accordionContainer.querySelector(headerSelector));
					} else {
						accordionContainer.querySelector(headerSelector).setAttribute('tabindex', 0);
					}
					// set ready style hook
					accordionContainer.classList.add(readyClass);
				});
			}
		}
		init();
	
		// REVEAL API
		return {
			init: init,
			destroy: destroy
		};
	};
	
	// module exports
	exports['default'] = Fraccordion;
	module.exports = exports['default'];

/***/ },
/* 10 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin

/***/ },
/* 11 */,
/* 12 */,
/* 13 */,
/* 14 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	
	var _jquery = __webpack_require__(4);
	
	var _jquery2 = _interopRequireDefault(_jquery);
	
	var _jquery3 = __webpack_require__(15);
	
	var _jquery4 = _interopRequireDefault(_jquery3);
	
	var _cookiebar = __webpack_require__(16);
	
	var _cookiebar2 = _interopRequireDefault(_cookiebar);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	/* eslint-enable no-unused-vars */
	
	/* eslint-disable no-unused-vars */
	
	var opts = {
	  'acceptButton': '.js-cookieBarAccept',
	  'secure': false,
	  'path': '/',
	  'domain': ''
	};
	
	(0, _jquery2['default'])(document).ready(function () {
	  (0, _jquery2['default'])('.js-CookieBar').cookieBar(opts);
	});
	
	exports['default'] = {
	  opts: opts
	};
	module.exports = exports['default'];

/***/ },
/* 15 */
/***/ function(module, exports, __webpack_require__) {

	var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_ARRAY__, __WEBPACK_AMD_DEFINE_RESULT__;'use strict';
	
	var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };
	
	/*!
	 * jQuery Cookie Plugin v1.4.1
	 * https://github.com/carhartl/jquery-cookie
	 *
	 * Copyright 2013 Klaus Hartl
	 * Released under the MIT license
	 */
	(function (factory) {
		if (true) {
			// AMD
			!(__WEBPACK_AMD_DEFINE_ARRAY__ = [__webpack_require__(4)], __WEBPACK_AMD_DEFINE_FACTORY__ = (factory), __WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ? (__WEBPACK_AMD_DEFINE_FACTORY__.apply(exports, __WEBPACK_AMD_DEFINE_ARRAY__)) : __WEBPACK_AMD_DEFINE_FACTORY__), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
		} else if ((typeof exports === 'undefined' ? 'undefined' : _typeof(exports)) === 'object') {
			// CommonJS
			factory(require('jquery'));
		} else {
			// Browser globals
			factory(jQuery);
		}
	})(function ($) {
	
		var pluses = /\+/g;
	
		function encode(s) {
			return config.raw ? s : encodeURIComponent(s);
		}
	
		function decode(s) {
			return config.raw ? s : decodeURIComponent(s);
		}
	
		function stringifyCookieValue(value) {
			return encode(config.json ? JSON.stringify(value) : String(value));
		}
	
		function parseCookieValue(s) {
			if (s.indexOf('"') === 0) {
				// This is a quoted cookie as according to RFC2068, unescape...
				s = s.slice(1, -1).replace(/\\"/g, '"').replace(/\\\\/g, '\\');
			}
	
			try {
				// Replace server-side written pluses with spaces.
				// If we can't decode the cookie, ignore it, it's unusable.
				// If we can't parse the cookie, ignore it, it's unusable.
				s = decodeURIComponent(s.replace(pluses, ' '));
				return config.json ? JSON.parse(s) : s;
			} catch (e) {}
		}
	
		function read(s, converter) {
			var value = config.raw ? s : parseCookieValue(s);
			return $.isFunction(converter) ? converter(value) : value;
		}
	
		var config = $.cookie = function (key, value, options) {
	
			// Write
	
			if (value !== undefined && !$.isFunction(value)) {
				options = $.extend({}, config.defaults, options);
	
				if (typeof options.expires === 'number') {
					var days = options.expires,
					    t = options.expires = new Date();
					t.setTime(+t + days * 864e+5);
				}
	
				return document.cookie = [encode(key), '=', stringifyCookieValue(value), options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
				options.path ? '; path=' + options.path : '', options.domain ? '; domain=' + options.domain : '', options.secure ? '; secure' : ''].join('');
			}
	
			// Read
	
			var result = key ? undefined : {};
	
			// To prevent the for loop in the first place assign an empty array
			// in case there are no cookies at all. Also prevents odd result when
			// calling $.cookie().
			var cookies = document.cookie ? document.cookie.split('; ') : [];
	
			for (var i = 0, l = cookies.length; i < l; i++) {
				var parts = cookies[i].split('=');
				var name = decode(parts.shift());
				var cookie = parts.join('=');
	
				if (key && key === name) {
					// If second argument (value) is a function it's a converter...
					result = read(cookie, value);
					break;
				}
	
				// Prevent storing a cookie that we couldn't decode.
				if (!key && (cookie = read(cookie)) !== undefined) {
					result[name] = cookie;
				}
			}
	
			return result;
		};
	
		config.defaults = {};
	
		$.removeCookie = function (key, options) {
			if ($.cookie(key) === undefined) {
				return false;
			}
	
			// Must not alter options, thus extending a fresh object...
			$.cookie(key, '', $.extend({}, options, { expires: -1 }));
			return !$.cookie(key);
		};
	});

/***/ },
/* 16 */
/***/ function(module, exports, __webpack_require__) {

	var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_ARRAY__, __WEBPACK_AMD_DEFINE_RESULT__;'use strict';
	
	var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };
	
	/* global jQuery, define */
	
	/*
	 *	Fork of
	 *
	 *	https://github.com/carlwoodhouse/jquery.cookieBar
	 *	The MIT License (MIT)
	 *	Copyright (c) 2016 Carl Woodhouse
	 *
	 *
	 */
	(function (factory) {
	  if (true) {
	    // AMD
	    !(__WEBPACK_AMD_DEFINE_ARRAY__ = [__webpack_require__(4)], __WEBPACK_AMD_DEFINE_FACTORY__ = (factory), __WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ? (__WEBPACK_AMD_DEFINE_FACTORY__.apply(exports, __WEBPACK_AMD_DEFINE_ARRAY__)) : __WEBPACK_AMD_DEFINE_FACTORY__), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
	  } else if ((typeof exports === 'undefined' ? 'undefined' : _typeof(exports)) === 'object') {
	    // CommonJS
	    factory(require('jquery'));
	  } else {
	    // Browser globals
	    factory(jQuery);
	  }
	})(function ($) {
	
	  $.fn.cookieBar = function (options) {
	    var settings = $.extend({
	      'acceptButton': '.js-cookieBarAccept',
	      'secure': false,
	      'path': '/',
	      'domain': '',
	      'threshold': 500
	    }, options);
	
	    var _accept = function _accept() {
	      $.cookie('cookiebar', 'hide', {
	        path: settings.path,
	        secure: settings.secure,
	        domain: settings.domain,
	        expires: 30
	      });
	      $(document).trigger('accept.cookiebar');
	    };
	
	    $.cookieBar = $.cookieBar || {};
	
	    $.cookieBar.isAccepted = function () {
	      return $.cookie('cookiebar') === 'hide';
	    };
	
	    return this.each(function () {
	      var $cookiebar = $(this);
	
	      if (!$.cookieBar.isAccepted()) {
	        if (settings.threshold > 0) {
	          $(window).on('scroll.cookiebar', function () {
	            if ($(window).scrollTop() > settings.threshold) {
	              $(window).unbind('scroll.cookiebar');
	              _accept();
	              $cookiebar.hide();
	            }
	          });
	        }
	        $cookiebar.show();
	      }
	
	      $cookiebar.find(settings.acceptButton).click(function () {
	        $cookiebar.hide();
	        _accept();
	        return false;
	      });
	    });
	  };
	});

/***/ },
/* 17 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	
	var _frDialogmodal = __webpack_require__(18);
	
	var _frDialogmodal2 = _interopRequireDefault(_frDialogmodal);
	
	var _dialogmodal = __webpack_require__(19);
	
	var _dialogmodal2 = _interopRequireDefault(_dialogmodal);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	/* eslint-enable */
	
	var dialog = (0, _frDialogmodal2['default'])({
	  // String - Outer container selector, hook for JS init() method
	  selector: '.js-fr-dialogmodal',
	
	  // String - Modal selector, the element that represents the modal
	  modalSelector: '.js-fr-dialogmodal-modal',
	
	  // String - Selector for the open button
	  openSelector: '.js-fr-dialogmodal-open',
	
	  // String - Selector for the close button
	  closeSelector: '.js-fr-dialogmodal-close',
	
	  // Boolean - Switches the dialog role to alertdialog, only use this when representing an alert, error or warning
	  isAlert: false,
	
	  // String - Class name that will be added to the selector when the component has been initialised
	  readyClass: 'fr-dialogmodal--is-ready',
	
	  // String - Class name that will be added to the selector when the component is active
	  activeClass: 'fr-dialogmodal--is-active'
	});
	
	/* eslint-disable no-unused-vars */
	
	exports['default'] = { dialog: dialog, Frdialogmodal: _frDialogmodal2['default'] };
	module.exports = exports['default'];

/***/ },
/* 18 */
/***/ function(module, exports) {

	'use strict';
	
	/**
	 * @param {object} options Object containing configuration overrides
	 */
	
	Object.defineProperty(exports, "__esModule", {
		value: true
	});
	var Frdialogmodal = function Frdialogmodal() {
		var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
	
		var _ref$selector = _ref.selector;
		var selector = _ref$selector === undefined ? '.js-fr-dialogmodal' : _ref$selector;
		var _ref$modalSelector = _ref.modalSelector;
		var modalSelector = _ref$modalSelector === undefined ? '.js-fr-dialogmodal-modal' : _ref$modalSelector;
		var _ref$openSelector = _ref.openSelector;
		var openSelector = _ref$openSelector === undefined ? '.js-fr-dialogmodal-open' : _ref$openSelector;
		var _ref$closeSelector = _ref.closeSelector;
		var closeSelector = _ref$closeSelector === undefined ? '.js-fr-dialogmodal-close' : _ref$closeSelector;
		var _ref$isAlert = _ref.isAlert;
		var isAlert = _ref$isAlert === undefined ? false : _ref$isAlert;
		var _ref$readyClass = _ref.readyClass;
		var readyClass = _ref$readyClass === undefined ? 'fr-dialogmodal--is-ready' : _ref$readyClass;
		var _ref$activeClass = _ref.activeClass;
		var activeClass = _ref$activeClass === undefined ? 'fr-dialogmodal--is-active' : _ref$activeClass;
	
	
		// CONSTANTS
		var doc = document;
		var docEl = doc.documentElement;
		var _q = function _q(el) {
			var ctx = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : doc;
			return [].slice.call(ctx.querySelectorAll(el));
		};
	
		// SUPPORTS
		if (!('querySelector' in doc) || !('addEventListener' in window) || !docEl.classList) return;
	
		// SETUP
		// set accordion element NodeLists
		var containers = _q(selector);
		var focusableSelectors = ['a[href]', 'area[href]', 'input:not([disabled])', 'select:not([disabled])', 'textarea:not([disabled])', 'button:not([disabled])', 'iframe', 'object', 'embed', '[contenteditable]', '[tabindex]:not([tabindex^="-"])'];
		//	TEMP
		var currButtonOpen = null;
		var currModal = null;
		//	elements within tab
		var focusableElements = null;
	
		//	UTILS
		function _defer(fn) {
			//	wrapped in setTimeout to delay binding until previous rendering has completed
			if (typeof fn === 'function') setTimeout(fn, 0);
		}
	
		//	A11Y
		function _addA11y(container) {
			var modal = _q(modalSelector, container)[0];
			var role = isAlert ? 'alertdialog' : 'dialog';
			//	add relevant roles and properties
			container.setAttribute('aria-hidden', true);
			modal.setAttribute('role', role);
		}
		function _removeA11y(container) {
			var modal = _q(modalSelector, container)[0];
			//	add relevant roles and properties
			container.removeAttribute('aria-hidden');
			modal.removeAttribute('role');
		}
	
		//	ACTIONS
		function _showModal(container, modal) {
			//	show container and focus the modal
			container.setAttribute('aria-hidden', false);
			modal.setAttribute('tabindex', -1);
			//	set first/last focusable elements
			focusableElements = _q(focusableSelectors.join(), modal);
			//	focus first element if exists, otherwise focus modal element
			if (focusableElements.length) focusableElements[0].focus();else modal.focus();
			//	update bound events
			_defer(_bindDocKey);
			_defer(_bindClosePointer);
			//	if contents are not interactive, bind click off
			if (!isAlert) _defer(_bindContainerPointer);
			//	reset scroll
			modal.scrollTop = 0;
			//	update style hook
			container.classList.add(activeClass);
		}
		function _hideModal(modal) {
			var returnfocus = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : true;
	
			//	get container element
			var container = modal.parentElement;
			//	show container and focus the modal
			container.setAttribute('aria-hidden', true);
			modal.removeAttribute('tabindex');
			//	update bound events
			_unbindDocKey();
			_unbindClosePointer();
			//	if contents are not interactive, unbind click off
			if (!isAlert) _unbindContainerPointer();
			//	update style hook
			container.classList.remove(activeClass);
			//	return focus to button that opened the modal and reset the reference
			if (returnfocus) {
				currButtonOpen.focus();
				currButtonOpen = null;
			}
		}
		function _handleTabEvent(e) {
			//	get the index of the current active element within the modal
			var focusedIndex = focusableElements.indexOf(doc.activeElement);
			//	handle TAB event if need to skip
			//	if first element is focused and shiftkey is in use
			if (e.shiftKey && (focusedIndex === 0 || focusedIndex === -1)) {
				//	focus last item within modal
				focusableElements[focusableElements.length - 1].focus();
				e.preventDefault();
				//	if last element is focused and shiftkey is not in use
			} else if (!e.shiftKey && focusedIndex === focusableElements.length - 1) {
				//	focus first item within modal
				focusableElements[0].focus();
				e.preventDefault();
			}
		}
	
		//	EVENTS
		function _eventOpenPointer(e) {
			//	get related elements
			var button = e.target;
			var container = doc.getElementById(button.getAttribute('aria-controls'));
			var modal = _q(modalSelector, container)[0];
			//	save element references
			currButtonOpen = button;
			currModal = modal;
			//	show modal
			_showModal(container, modal);
		}
		function _eventClosePointer() {
			_hideModal(currModal);
		}
		function _eventContainerPointer(e) {
			var container = currModal.parentElement;
			//	check if target is modal container (but not modal)
			if (e.target === container) _hideModal(currModal);
		}
		function _eventDocKey(e) {
			//	ESC key
			if (e.keyCode === 27) _hideModal(currModal);
			//	TAB key
			if (e.keyCode === 9) _handleTabEvent(e);
		}
	
		//	BIND EVENTS
		function _bindOpenPointers(container) {
			var id = container.getAttribute('id');
			var buttons = _q(openSelector + '[aria-controls="' + id + '"]');
			buttons.forEach(function (button) {
				return button.addEventListener('click', _eventOpenPointer);
			});
		}
		function _bindClosePointer() {
			var modal = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : currModal;
	
			var button = _q(closeSelector, modal)[0];
			button.addEventListener('click', _eventClosePointer);
		}
		function _bindContainerPointer() {
			var modal = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : currModal;
	
			var container = modal.parentElement;
			container.addEventListener('click', _eventContainerPointer);
		}
		function _bindDocKey() {
			doc.addEventListener('keydown', _eventDocKey);
		}
	
		//	UNBIND EVENTS
		function _unbindOpenPointers(container) {
			var id = container.getAttribute('id');
			var buttons = doc.querySelectorAll(openSelector + '[aria-controls="' + id + '"]');
			buttons.forEach(function (button) {
				return button.removeEventListener('click', _eventOpenPointer);
			});
		}
		function _unbindClosePointer() {
			var modal = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : currModal;
	
			var button = _q(closeSelector, modal)[0];
			button.removeEventListener('click', _eventClosePointer);
		}
		function _unbindContainerPointer() {
			var container = currModal.parentElement;
			container.removeEventListener('click', _eventContainerPointer);
		}
		function _unbindDocKey() {
			doc.removeEventListener('keydown', _eventDocKey);
		}
	
		//	DESTROY
		function destroy() {
			//	loop through available modals
			containers.forEach(function (container) {
				var modal = _q(modalSelector, container)[0];
				modal.removeAttribute('tabindex');
				_removeA11y(container);
				_unbindOpenPointers(container);
				_unbindClosePointer(modal);
				_unbindContainerPointer(modal);
				//	remove ready, active style hooks
				container.classList.remove(readyClass, activeClass);
			});
			_unbindDocKey();
		}
	
		//	INIT
		function init() {
			//	cancel if no modals found
			if (!containers.length) return;
			//	loop through available modals
			containers.forEach(function (container) {
				_addA11y(container);
				_bindOpenPointers(container);
				// set ready style hook
				container.classList.add(readyClass);
			});
		}
		init();
	
		// REVEAL API
		return {
			init: init,
			destroy: destroy
		};
	};
	
	// module exports
	exports['default'] = Frdialogmodal;
	module.exports = exports['default'];

/***/ },
/* 19 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin

/***/ },
/* 20 */,
/* 21 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	var Masonry = null;
	
	try {
	  Masonry = __webpack_require__(22);
	} catch (e) {
	  /* HEY, I'm IE8 */
	}
	
	exports['default'] = {
	  Masonry: Masonry
	};
	module.exports = exports['default'];

/***/ },
/* 22 */
/***/ function(module, exports, __webpack_require__) {

	var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_ARRAY__, __WEBPACK_AMD_DEFINE_RESULT__;'use strict';
	
	var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };
	
	/*!
	 * Salvattore 1.0.9 by @rnmp and @ppold
	 * https://github.com/rnmp/salvattore
	 */
	(function (root, factory) {
	  if (true) {
	    !(__WEBPACK_AMD_DEFINE_ARRAY__ = [], __WEBPACK_AMD_DEFINE_FACTORY__ = (factory), __WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ? (__WEBPACK_AMD_DEFINE_FACTORY__.apply(exports, __WEBPACK_AMD_DEFINE_ARRAY__)) : __WEBPACK_AMD_DEFINE_FACTORY__), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
	  } else if ((typeof exports === 'undefined' ? 'undefined' : _typeof(exports)) === 'object') {
	    module.exports = factory();
	  } else {
	    root.salvattore = factory();
	  }
	})(undefined, function () {
	  /*! matchMedia() polyfill - Test a CSS media type/query in JS. Authors & copyright (c) 2012: Scott Jehl, Paul Irish, Nicholas Zakas, David Knight. Dual MIT/BSD license */
	
	  if (!window.matchMedia) {
	    window.matchMedia = function () {
	      "use strict";
	
	      // For browsers that support matchMedium api such as IE 9 and webkit
	
	      var styleMedia = window.styleMedia || window.media;
	
	      // For those that don't support matchMedium
	      if (!styleMedia) {
	        var style = document.createElement('style'),
	            script = document.getElementsByTagName('script')[0],
	            info = null;
	
	        style.type = 'text/css';
	        style.id = 'matchmediajs-test';
	
	        script.parentNode.insertBefore(style, script);
	
	        // 'style.currentStyle' is used by IE <= 8 and 'window.getComputedStyle' for all other browsers
	        info = 'getComputedStyle' in window && window.getComputedStyle(style, null) || style.currentStyle;
	
	        styleMedia = {
	          matchMedium: function matchMedium(media) {
	            var text = '@media ' + media + '{ #matchmediajs-test { width: 1px; } }';
	
	            // 'style.styleSheet' is used by IE <= 8 and 'style.textContent' for all other browsers
	            if (style.styleSheet) {
	              style.styleSheet.cssText = text;
	            } else {
	              style.textContent = text;
	            }
	
	            // Test if media query is true or false
	            return info.width === '1px';
	          }
	        };
	      }
	
	      return function (media) {
	        return {
	          matches: styleMedia.matchMedium(media || 'all'),
	          media: media || 'all'
	        };
	      };
	    }();
	  }
	
	  /*! matchMedia() polyfill addListener/removeListener extension. Author & copyright (c) 2012: Scott Jehl. Dual MIT/BSD license */
	  (function () {
	    "use strict";
	
	    // Bail out for browsers that have addListener support
	
	    if (window.matchMedia && window.matchMedia('all').addListener) {
	      return false;
	    }
	
	    var localMatchMedia = window.matchMedia,
	        hasMediaQueries = localMatchMedia('only all').matches,
	        isListening = false,
	        timeoutID = 0,
	        // setTimeout for debouncing 'handleChange'
	    queries = [],
	        // Contains each 'mql' and associated 'listeners' if 'addListener' is used
	    handleChange = function handleChange(evt) {
	      // Debounce
	      clearTimeout(timeoutID);
	
	      timeoutID = setTimeout(function () {
	        for (var i = 0, il = queries.length; i < il; i++) {
	          var mql = queries[i].mql,
	              listeners = queries[i].listeners || [],
	              matches = localMatchMedia(mql.media).matches;
	
	          // Update mql.matches value and call listeners
	          // Fire listeners only if transitioning to or from matched state
	          if (matches !== mql.matches) {
	            mql.matches = matches;
	
	            for (var j = 0, jl = listeners.length; j < jl; j++) {
	              listeners[j].call(window, mql);
	            }
	          }
	        }
	      }, 30);
	    };
	
	    window.matchMedia = function (media) {
	      var mql = localMatchMedia(media),
	          listeners = [],
	          index = 0;
	
	      mql.addListener = function (listener) {
	        // Changes would not occur to css media type so return now (Affects IE <= 8)
	        if (!hasMediaQueries) {
	          return;
	        }
	
	        // Set up 'resize' listener for browsers that support CSS3 media queries (Not for IE <= 8)
	        // There should only ever be 1 resize listener running for performance
	        if (!isListening) {
	          isListening = true;
	          window.addEventListener('resize', handleChange, true);
	        }
	
	        // Push object only if it has not been pushed already
	        if (index === 0) {
	          index = queries.push({
	            mql: mql,
	            listeners: listeners
	          });
	        }
	
	        listeners.push(listener);
	      };
	
	      mql.removeListener = function (listener) {
	        for (var i = 0, il = listeners.length; i < il; i++) {
	          if (listeners[i] === listener) {
	            listeners.splice(i, 1);
	          }
	        }
	      };
	
	      return mql;
	    };
	  })();
	
	  // http://paulirish.com/2011/requestanimationframe-for-smart-animating/
	  // http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating
	
	  // requestAnimationFrame polyfill by Erik Möller. fixes from Paul Irish and Tino Zijdel
	
	  // MIT license
	
	  (function () {
	    "use strict";
	
	    var lastTime = 0;
	    var vendors = ['ms', 'moz', 'webkit', 'o'];
	    for (var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
	      window.requestAnimationFrame = window[vendors[x] + 'RequestAnimationFrame'];
	      window.cancelAnimationFrame = window[vendors[x] + 'CancelAnimationFrame'] || window[vendors[x] + 'CancelRequestAnimationFrame'];
	    }
	
	    if (!window.requestAnimationFrame) window.requestAnimationFrame = function (callback, element) {
	      var currTime = new Date().getTime();
	      var timeToCall = Math.max(0, 16 - (currTime - lastTime));
	      var id = window.setTimeout(function () {
	        callback(currTime + timeToCall);
	      }, timeToCall);
	      lastTime = currTime + timeToCall;
	      return id;
	    };
	
	    if (!window.cancelAnimationFrame) window.cancelAnimationFrame = function (id) {
	      clearTimeout(id);
	    };
	  })();
	
	  // https://developer.mozilla.org/en-US/docs/Web/API/CustomEvent
	
	  if (typeof window.CustomEvent !== "function") {
	    (function () {
	      "use strict";
	
	      function CustomEvent(event, params) {
	        params = params || { bubbles: false, cancelable: false, detail: undefined };
	        var evt = document.createEvent('CustomEvent');
	        evt.initCustomEvent(event, params.bubbles, params.cancelable, params.detail);
	        return evt;
	      }
	
	      CustomEvent.prototype = window.Event.prototype;
	
	      window.CustomEvent = CustomEvent;
	    })();
	  }
	
	  /* jshint laxcomma: true */
	  var salvattore = function (global, document, undefined) {
	    "use strict";
	
	    var self = {},
	        grids = [],
	        mediaRules = [],
	        mediaQueries = [],
	        add_to_dataset = function add_to_dataset(element, key, value) {
	      // uses dataset function or a fallback for <ie10
	      if (element.dataset) {
	        element.dataset[key] = value;
	      } else {
	        element.setAttribute("data-" + key, value);
	      }
	      return;
	    };
	
	    self.obtainGridSettings = function obtainGridSettings(element) {
	      // returns the number of columns and the classes a column should have,
	      // from computing the style of the ::before pseudo-element of the grid.
	
	      var computedStyle = global.getComputedStyle(element, ":before"),
	          content = computedStyle.getPropertyValue("content").slice(1, -1),
	          matchResult = content.match(/^\s*(\d+)(?:\s?\.(.+))?\s*$/),
	          numberOfColumns = 1,
	          columnClasses = [];
	
	      if (matchResult) {
	        numberOfColumns = matchResult[1];
	        columnClasses = matchResult[2];
	        columnClasses = columnClasses ? columnClasses.split(".") : ["column"];
	      } else {
	        matchResult = content.match(/^\s*\.(.+)\s+(\d+)\s*$/);
	        if (matchResult) {
	          columnClasses = matchResult[1];
	          numberOfColumns = matchResult[2];
	          if (numberOfColumns) {
	            numberOfColumns = numberOfColumns.split(".");
	          }
	        }
	      }
	
	      return {
	        numberOfColumns: numberOfColumns,
	        columnClasses: columnClasses
	      };
	    };
	
	    self.addColumns = function addColumns(grid, items) {
	      // from the settings obtained, it creates columns with
	      // the configured classes and adds to them a list of items.
	
	      var settings = self.obtainGridSettings(grid),
	          numberOfColumns = settings.numberOfColumns,
	          columnClasses = settings.columnClasses,
	          columnsItems = new Array(+numberOfColumns),
	          columnsFragment = document.createDocumentFragment(),
	          i = numberOfColumns,
	          selector;
	
	      while (i-- !== 0) {
	        selector = "[data-columns] > *:nth-child(" + numberOfColumns + "n-" + i + ")";
	        columnsItems.push(items.querySelectorAll(selector));
	      }
	
	      columnsItems.forEach(function append_to_grid_fragment(rows) {
	        var column = document.createElement("div"),
	            rowsFragment = document.createDocumentFragment();
	
	        column.className = columnClasses.join(" ");
	
	        Array.prototype.forEach.call(rows, function append_to_column(row) {
	          rowsFragment.appendChild(row);
	        });
	        column.appendChild(rowsFragment);
	        columnsFragment.appendChild(column);
	      });
	
	      grid.appendChild(columnsFragment);
	      add_to_dataset(grid, 'columns', numberOfColumns);
	    };
	
	    self.removeColumns = function removeColumns(grid) {
	      // removes all the columns from a grid, and returns a list
	      // of items sorted by the ordering of columns.
	
	      var range = document.createRange();
	      range.selectNodeContents(grid);
	
	      var columns = Array.prototype.filter.call(range.extractContents().childNodes, function filter_elements(node) {
	        return node instanceof global.HTMLElement;
	      });
	
	      var numberOfColumns = columns.length,
	          numberOfRowsInFirstColumn = columns[0].childNodes.length,
	          sortedRows = new Array(numberOfRowsInFirstColumn * numberOfColumns);
	
	      Array.prototype.forEach.call(columns, function iterate_columns(column, columnIndex) {
	        Array.prototype.forEach.call(column.children, function iterate_rows(row, rowIndex) {
	          sortedRows[rowIndex * numberOfColumns + columnIndex] = row;
	        });
	      });
	
	      var container = document.createElement("div");
	      add_to_dataset(container, 'columns', 0);
	
	      sortedRows.filter(function filter_non_null(child) {
	        return !!child;
	      }).forEach(function append_row(child) {
	        container.appendChild(child);
	      });
	
	      return container;
	    };
	
	    self.recreateColumns = function recreateColumns(grid) {
	      // removes all the columns from the grid, and adds them again,
	      // it is used when the number of columns change.
	
	      global.requestAnimationFrame(function render_after_css_mediaQueryChange() {
	        self.addColumns(grid, self.removeColumns(grid));
	        var columnsChange = new CustomEvent("columnsChange");
	        grid.dispatchEvent(columnsChange);
	      });
	    };
	
	    self.mediaQueryChange = function mediaQueryChange(mql) {
	      // recreates the columns when a media query matches the current state
	      // of the browser.
	
	      if (mql.matches) {
	        Array.prototype.forEach.call(grids, self.recreateColumns);
	      }
	    };
	
	    self.getCSSRules = function getCSSRules(stylesheet) {
	      // returns a list of css rules from a stylesheet
	
	      var cssRules;
	      try {
	        cssRules = stylesheet.sheet.cssRules || stylesheet.sheet.rules;
	      } catch (e) {
	        return [];
	      }
	
	      return cssRules || [];
	    };
	
	    self.getStylesheets = function getStylesheets() {
	      // returns a list of all the styles in the document (that are accessible).
	
	      var inlineStyleBlocks = Array.prototype.slice.call(document.querySelectorAll("style"));
	      inlineStyleBlocks.forEach(function (stylesheet, idx) {
	        if (stylesheet.type !== 'text/css' && stylesheet.type !== '') {
	          inlineStyleBlocks.splice(idx, 1);
	        }
	      });
	
	      return Array.prototype.concat.call(inlineStyleBlocks, Array.prototype.slice.call(document.querySelectorAll("link[rel='stylesheet']")));
	    };
	
	    self.mediaRuleHasColumnsSelector = function mediaRuleHasColumnsSelector(rules) {
	      // checks if a media query css rule has in its contents a selector that
	      // styles the grid.
	
	      var i, rule;
	
	      try {
	        i = rules.length;
	      } catch (e) {
	        i = 0;
	      }
	
	      while (i--) {
	        rule = rules[i];
	        if (rule.selectorText && rule.selectorText.match(/\[data-columns\](.*)::?before$/)) {
	          return true;
	        }
	      }
	
	      return false;
	    };
	
	    self.scanMediaQueries = function scanMediaQueries() {
	      // scans all the stylesheets for selectors that style grids,
	      // if the matchMedia API is supported.
	
	      var newMediaRules = [];
	
	      if (!global.matchMedia) {
	        return;
	      }
	
	      self.getStylesheets().forEach(function extract_rules(stylesheet) {
	        Array.prototype.forEach.call(self.getCSSRules(stylesheet), function filter_by_column_selector(rule) {
	          // rule.media throws an 'not implemented error' in ie9 for import rules occasionally
	          try {
	            if (rule.media && rule.cssRules && self.mediaRuleHasColumnsSelector(rule.cssRules)) {
	              newMediaRules.push(rule);
	            }
	          } catch (e) {}
	        });
	      });
	
	      // remove matchMedia listeners from the old rules
	      var oldRules = mediaRules.filter(function (el) {
	        return newMediaRules.indexOf(el) === -1;
	      });
	      mediaQueries.filter(function (el) {
	        return oldRules.indexOf(el.rule) !== -1;
	      }).forEach(function (el) {
	        el.mql.removeListener(self.mediaQueryChange);
	      });
	      mediaQueries = mediaQueries.filter(function (el) {
	        return oldRules.indexOf(el.rule) === -1;
	      });
	
	      // add matchMedia listeners to the new rules
	      newMediaRules.filter(function (el) {
	        return mediaRules.indexOf(el) == -1;
	      }).forEach(function (rule) {
	        var mql = global.matchMedia(rule.media.mediaText);
	        mql.addListener(self.mediaQueryChange);
	        mediaQueries.push({ rule: rule, mql: mql });
	      });
	
	      // swap mediaRules with the new set
	      mediaRules.length = 0;
	      mediaRules = newMediaRules;
	    };
	
	    self.rescanMediaQueries = function rescanMediaQueries() {
	      self.scanMediaQueries();
	      Array.prototype.forEach.call(grids, self.recreateColumns);
	    };
	
	    self.nextElementColumnIndex = function nextElementColumnIndex(grid, fragments) {
	      // returns the index of the column where the given element must be added.
	
	      var children = grid.children,
	          m = children.length,
	          lowestRowCount = 0,
	          child,
	          currentRowCount,
	          i,
	          index = 0;
	      for (i = 0; i < m; i++) {
	        child = children[i];
	        currentRowCount = child.children.length + (fragments[i].children || fragments[i].childNodes).length;
	        if (lowestRowCount === 0) {
	          lowestRowCount = currentRowCount;
	        }
	        if (currentRowCount < lowestRowCount) {
	          index = i;
	          lowestRowCount = currentRowCount;
	        }
	      }
	
	      return index;
	    };
	
	    self.createFragmentsList = function createFragmentsList(quantity) {
	      // returns a list of fragments
	
	      var fragments = new Array(quantity),
	          i = 0;
	
	      while (i !== quantity) {
	        fragments[i] = document.createDocumentFragment();
	        i++;
	      }
	
	      return fragments;
	    };
	
	    self.appendElements = function appendElements(grid, elements) {
	      // adds a list of elements to the end of a grid
	
	      var columns = grid.children,
	          numberOfColumns = columns.length,
	          fragments = self.createFragmentsList(numberOfColumns);
	
	      Array.prototype.forEach.call(elements, function append_to_next_fragment(element) {
	        var columnIndex = self.nextElementColumnIndex(grid, fragments);
	        fragments[columnIndex].appendChild(element);
	      });
	
	      Array.prototype.forEach.call(columns, function insert_column(column, index) {
	        column.appendChild(fragments[index]);
	      });
	    };
	
	    self.prependElements = function prependElements(grid, elements) {
	      // adds a list of elements to the start of a grid
	
	      var columns = grid.children,
	          numberOfColumns = columns.length,
	          fragments = self.createFragmentsList(numberOfColumns),
	          columnIndex = numberOfColumns - 1;
	
	      elements.forEach(function append_to_next_fragment(element) {
	        var fragment = fragments[columnIndex];
	        fragment.insertBefore(element, fragment.firstChild);
	        if (columnIndex === 0) {
	          columnIndex = numberOfColumns - 1;
	        } else {
	          columnIndex--;
	        }
	      });
	
	      Array.prototype.forEach.call(columns, function insert_column(column, index) {
	        column.insertBefore(fragments[index], column.firstChild);
	      });
	
	      // populates a fragment with n columns till the right
	      var fragment = document.createDocumentFragment(),
	          numberOfColumnsToExtract = elements.length % numberOfColumns;
	
	      while (numberOfColumnsToExtract-- !== 0) {
	        fragment.appendChild(grid.lastChild);
	      }
	
	      // adds the fragment to the left
	      grid.insertBefore(fragment, grid.firstChild);
	    };
	
	    self.registerGrid = function registerGrid(grid) {
	      if (global.getComputedStyle(grid).display === "none") {
	        return;
	      }
	
	      // retrieve the list of items from the grid itself
	      var range = document.createRange();
	      range.selectNodeContents(grid);
	
	      var items = document.createElement("div");
	      items.appendChild(range.extractContents());
	
	      add_to_dataset(items, 'columns', 0);
	      self.addColumns(grid, items);
	      grids.push(grid);
	    };
	
	    self.init = function init() {
	      // adds required CSS rule to hide 'content' based
	      // configuration.
	
	      var css = document.createElement("style");
	      css.innerHTML = "[data-columns]::before{display:block;visibility:hidden;position:absolute;font-size:1px;}";
	      document.head.appendChild(css);
	
	      // scans all the grids in the document and generates
	      // columns from their configuration.
	
	      var gridElements = document.querySelectorAll("[data-columns]");
	      Array.prototype.forEach.call(gridElements, self.registerGrid);
	      self.scanMediaQueries();
	    };
	
	    self.init();
	
	    return {
	      appendElements: self.appendElements,
	      prependElements: self.prependElements,
	      registerGrid: self.registerGrid,
	      recreateColumns: self.recreateColumns,
	      rescanMediaQueries: self.rescanMediaQueries,
	      init: self.init,
	
	      // maintains backwards compatibility with underscore style method names
	      append_elements: self.appendElements,
	      prepend_elements: self.prependElements,
	      register_grid: self.registerGrid,
	      recreate_columns: self.recreateColumns,
	      rescan_media_queries: self.rescanMediaQueries
	    };
	  }(window, window.document);
	
	  return salvattore;
	});

/***/ },
/* 23 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	
	var _frBypasslinks = __webpack_require__(24);
	
	var _frBypasslinks2 = _interopRequireDefault(_frBypasslinks);
	
	var _bypasslinks = __webpack_require__(25);
	
	var _bypasslinks2 = _interopRequireDefault(_bypasslinks);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	/* eslint-enable */
	
	var bypassLinks = (0, _frBypasslinks2['default'])({
	  selector: '.js-fr-bypasslinks'
	});
	
	/* eslint-disable no-unused-vars */
	
	exports['default'] = { bypassLinks: bypassLinks, Frbypasslinks: _frBypasslinks2['default'] };
	module.exports = exports['default'];

/***/ },
/* 24 */
/***/ function(module, exports) {

	'use strict';
	
	/**
	 * @param {object} options Object containing configuration overrides
	 */
	
	Object.defineProperty(exports, "__esModule", {
		value: true
	});
	var Frbypasslinks = function Frbypasslinks() {
		var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
	
		var _ref$selector = _ref.selector;
		var selector = _ref$selector === undefined ? '.js-fr-bypasslinks' : _ref$selector;
	
	
		//	CONSTANTS
		var doc = document;
		var _q = function _q(el) {
			var ctx = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : doc;
			return [].slice.call(ctx.querySelectorAll(el));
		};
	
		//	SUPPORTS
		if (!('querySelector' in doc) || !('addEventListener' in window)) return;
	
		//	SETUP
		// get bypass links NodeList
		var container = _q(selector)[0];
	
		//	TEMP
		var currTarget = null;
	
		//	ACTIONS
		function _addFocusability(link) {
			//	get target element
			var id = link.getAttribute('href').slice(1);
			var target = doc.getElementById(id);
			//	set tabindex to allow focus
			if (target) target.setAttribute('tabindex', -1);
		}
		function _removeFocusability(link) {
			//	get target element
			var id = link.getAttribute('href').slice(1);
			var target = doc.getElementById(id);
			//	remove ability to focus (stops user highlighting element on click)
			if (target) target.removeAttribute('tabindex');
		}
		function destroy() {
			//	loop through each bypass link and remove event bindings
			_q('a', container).forEach(function (link) {
				_unbindPointerClick(link);
				_addFocusability(link);
			});
			if (currTarget) _unbindTargetBlur(currTarget);
		}
	
		//	EVENTS
		function _eventPointerClick(e) {
			//	get target element
			var id = e.target.getAttribute('href').slice(1);
			var target = doc.getElementById(id);
	
			// don't try to apply relevant atts/focus if target isn't present
			if (!target) return;
			//	set tabindex to allow focus
			target.setAttribute('tabindex', -1);
			target.focus();
			//	save target reference
			currTarget = target;
			//	bind blur event on target
			_bindTargetBlur(target);
		}
		function _eventTargetBlur(e) {
			//	remove ability to focus (stops user highlighting element on click)
			e.target.removeAttribute('tabindex');
			//	remove target reference
			currTarget = null;
			//	unbind blur event
			_unbindTargetBlur(e.target);
		}
	
		//	BIND EVENTS
		function _bindPointerClick(link) {
			//	bind interaction event
			link.addEventListener('click', _eventPointerClick);
		}
		function _bindTargetBlur(target) {
			//	bind blur event on target element
			target.addEventListener('blur', _eventTargetBlur);
		}
	
		//	UNBIND EVENTS
		function _unbindPointerClick(link) {
			//	unbind interaction event
			link.removeEventListener('click', _eventPointerClick);
		}
		function _unbindTargetBlur(target) {
			//	unbind blur event on target element
			target.removeEventListener('blur', _eventTargetBlur);
		}
	
		//	INIT
		function init() {
			//	detect if bypass links exist in the document
			if (!container) return;
			//	loop through each bypass link
			_q('a', container).forEach(function (link) {
				_bindPointerClick(link);
				_removeFocusability(link);
			});
		}
		init();
	
		// REVEAL API
		return {
			init: init,
			destroy: destroy
		};
	};
	
	// module exports
	exports['default'] = Frbypasslinks;
	module.exports = exports['default'];

/***/ },
/* 25 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin

/***/ },
/* 26 */,
/* 27 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	
	var _jquery = __webpack_require__(4);
	
	var _jquery2 = _interopRequireDefault(_jquery);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	/*
	 *	TODO:
	 *		- arrow up
	 *		- repack as a frend _component and CSS
	 *		- refactor without jQuery
	 */
	
	/*
	 * Porting of http://www.oaa-accessibility.org/examplep/treeview1/
	 */
	var Frtreeview = function Frtreeview() {
	  var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
	
	  var _ref$selector = _ref.selector;
	  var selector = _ref$selector === undefined ? '.js-fr-treeview' : _ref$selector;
	  var _ref$openOnClick = _ref.openOnClick;
	  var openOnClick = _ref$openOnClick === undefined ? true : _ref$openOnClick;
	  var _ref$classFocused = _ref.classFocused;
	  var classFocused = _ref$classFocused === undefined ? 'fr-tree-focus' : _ref$classFocused;
	  var _ref$classParent = _ref.classParent;
	  var classParent = _ref$classParent === undefined ? 'fr-tree-parent' : _ref$classParent;
	  var _ref$multiselectable = _ref.multiselectable;
	  var multiselectable = _ref$multiselectable === undefined ? false : _ref$multiselectable;
	
	
	  var keys = {
	    tab: 9,
	    enter: 13,
	    space: 32,
	    pageup: 33,
	    pagedown: 34,
	    end: 35,
	    home: 36,
	    left: 37,
	    up: 38,
	    right: 39,
	    down: 40,
	    asterisk: 106
	  };
	
	  function _collapseAll(treeview) {
	    treeview.$parents.each(function () {
	      if ((0, _jquery2['default'])(this).attr('aria-expanded') == 'false') {
	        (0, _jquery2['default'])(this).children('ul').attr('aria-hidden', 'true');
	      }
	    });
	    treeview.$visibleItems = treeview.$el.find('li:visible');
	  }
	
	  function _expandGroup(treeview, $item) {
	    var $group = $item.children('ul');
	    $group.slideDown(250, function () {
	      $group.attr('aria-hidden', 'false');
	      $item.attr('aria-expanded', 'true');
	      treeview.$visibleItems = treeview.$el.find('li:visible');
	    });
	  }
	
	  function _collapseGroup(treeview, $item) {
	    var $group = $item.children('ul');
	    $group.slideUp(250, function () {
	      $group.attr('aria-hidden', 'true');
	      $item.attr('aria-expanded', 'false');
	      treeview.$visibleItems = treeview.$el.find('li:visible');
	    });
	  }
	
	  function _collapseSiblings(treeview, $item) {
	    $item.closest('ul').find('> .' + classParent).not($item).each(function (i, el) {
	      _collapseGroup(treeview, (0, _jquery2['default'])(el));
	    });
	  }
	
	  function _toggleGroup(treeview, $item) {
	    if (!multiselectable) {
	      _collapseSiblings(treeview, $item);
	    }
	    if ($item.attr('aria-expanded') == 'true') {
	      _collapseGroup(treeview, $item);
	    } else {
	      _expandGroup(treeview, $item);
	    }
	  }
	
	  function _updateStyling(treeview, $item) {
	    treeview.$items.removeClass(classFocused).attr('tabindex', '-1');
	    $item.addClass(classFocused).attr('tabindex', '0');
	  }
	
	  function _handleKeyDown(treeview, $item, e) {
	    var curNdx = treeview.$visibleItems.index($item);
	
	    if (e.altKey || e.ctrlKey || e.shiftKey && e.keyCode != keys.tab) {
	      return true;
	    }
	
	    if (!(0, _jquery2['default'])(e.target).is('[role=treeitem]')) {
	      return true;
	    }
	
	    switch (e.keyCode) {
	      case keys.tab:
	        {
	          treeview.$activeItem = null;
	          $item.removeClass(classFocused);
	          return true;
	        }
	
	      case keys.home:
	        {
	          treeview.$activeItem = treeview.$parents.first();
	          treeview.$activeItem.focus();
	          e.stopPropagation();
	          return false;
	        }
	
	      case keys.end:
	        {
	          treeview.$activeItem = treeview.$visibleItems.last();
	          treeview.$activeItem.focus();
	          e.stopPropagation();
	          return false;
	        }
	
	      case keys.enter:
	      case keys.space:
	        {
	          if (!$item.is('.' + classParent)) {
	            // do nothing
	          } else {
	            _toggleGroup(treeview, $item);
	          }
	          e.stopPropagation();
	          return false;
	        }
	
	      case keys.left:
	        {
	          if ($item.is('.' + classParent) && $item.attr('aria-expanded') == 'true') {
	            _collapseGroup(treeview, $item);
	          } else {
	            var $itemUL = $item.parent();
	            var $itemParent = $itemUL.parent();
	            treeview.$activeItem = $itemParent;
	            treeview.$activeItem.focus();
	          }
	          e.stopPropagation();
	          return false;
	        }
	
	      case keys.right:
	        {
	          if (!$item.is('.' + classParent)) {
	            // do nothing
	          } else if ($item.attr('aria-expanded') == 'false') {
	            _expandGroup(treeview, $item);
	          } else {
	            treeview.$activeItem = $item.children('ul').children('li').first();
	            treeview.$activeItem.focus();
	          }
	          e.stopPropagation();
	          return false;
	        }
	
	      case keys.up:
	        {
	          if (curNdx > 0) {
	            var $prev = treeview.$visibleItems.eq(curNdx - 1);
	            treeview.$activeItem = $prev;
	            $prev.focus();
	          }
	          e.stopPropagation();
	          return false;
	        }
	
	      case keys.down:
	        {
	          if (curNdx < treeview.$visibleItems.length - 1) {
	            var $next = treeview.$visibleItems.eq(curNdx + 1);
	            treeview.$activeItem = $next;
	            $next.focus();
	          }
	          e.stopPropagation();
	          return false;
	        }
	
	      case keys.asterisk:
	        {
	          treeview.$parents.each(function () {
	            _expandGroup(treeview, (0, _jquery2['default'])(this));
	          });
	          e.stopPropagation();
	          return false;
	        }
	
	    }
	    return true;
	  }
	
	  function _handleKeyPress(treeview, $item, e) {
	    if (e.altKey || e.ctrlKey || e.shiftKey) {
	      // do nothing
	      return true;
	    }
	
	    switch (e.keyCode) {
	      case keys.tab:
	        {
	          return true;
	        }
	      case keys.enter:
	      case keys.home:
	      case keys.end:
	      case keys.left:
	      case keys.right:
	      case keys.up:
	      case keys.down:
	        {
	          e.stopPropagation();
	          return false;
	        }
	      default:
	        {
	          var chr = String.fromCharCode(e.which);
	          var bMatch = false;
	          var itemNdx = treeview.$visibleItems.index($item);
	          var itemCnt = treeview.$visibleItems.length;
	          var curNdx = itemNdx + 1;
	
	          // check if the active item was the last one on the list
	          if (curNdx == itemCnt) {
	            curNdx = 0;
	          }
	
	          // Iterate through the menu items (starting from the current item and wrapping) until a match is found
	          // or the loop returns to the current menu item
	          while (curNdx != itemNdx) {
	
	            var $curItem = treeview.$visibleItems.eq(curNdx);
	            var titleChr = $curItem.text().charAt(0);
	
	            if ($curItem.is('.' + classParent)) {
	              titleChr = $curItem.find('span').text().charAt(0);
	            }
	
	            if (titleChr.toLowerCase() == chr) {
	              bMatch = true;
	              break;
	            }
	
	            curNdx = curNdx + 1;
	
	            if (curNdx == itemCnt) {
	              // reached the end of the list, start again at the beginning
	              curNdx = 0;
	            }
	          }
	
	          if (bMatch == true) {
	            treeview.$activeItem = treeview.$visibleItems.eq(curNdx);
	            treeview.$activeItem.focus();
	          }
	
	          e.stopPropagation();
	          return false;
	        }
	    }
	
	    return true;
	  }
	
	  function _handleDblClick(treeview, $item, e) {
	    if (e.altKey || e.ctrlKey || e.shiftKey) {
	      // do nothing
	      return true;
	    }
	
	    if (!(0, _jquery2['default'])(e.target).parent().is('[aria-expanded]')) {
	      return true;
	    }
	
	    treeview.$activeItem = $item;
	    _updateStyling(treeview, $item);
	    _toggleGroup(treeview, $item);
	    e.stopPropagation();
	    return false;
	  }
	
	  function _handleClick(treeview, $item, e) {
	    if (e.altKey || e.ctrlKey || e.shiftKey) {
	      // do nothing
	      return true;
	    }
	
	    if (!(0, _jquery2['default'])(e.target).parent().is('[aria-expanded]')) {
	      return true;
	    }
	
	    treeview.$activeItem = treeview.$el;
	    _updateStyling(treeview, $item);
	    e.stopPropagation();
	    return false;
	  }
	
	  function _bindEvents(treeview) {
	    if (openOnClick) {
	      treeview.$parents.click(function (e) {
	        return _handleDblClick(treeview, (0, _jquery2['default'])(this), e);
	      });
	    } else {
	      treeview.$parents.click(function (e) {
	        return _handleDblClick(treeview, (0, _jquery2['default'])(this), e);
	      });
	      treeview.$items.click(function (e) {
	        return _handleClick(treeview, (0, _jquery2['default'])(this), e);
	      });
	    }
	
	    treeview.$items.keydown(function (e) {
	      return _handleKeyDown(treeview, (0, _jquery2['default'])(this), e);
	    });
	
	    treeview.$items.keypress(function (e) {
	      return _handleKeyPress(treeview, (0, _jquery2['default'])(this), e);
	    });
	
	    (0, _jquery2['default'])(document).click(function () {
	      if (treeview.$activeItem != null) {
	        treeview.$activeItem.removeClass(classFocused);
	        treeview.$activeItem = null;
	      }
	      return true;
	    });
	  }
	
	  function destroy() {
	    /* TODO */
	  }
	
	  function _addA11y($el) {
	    $el.attr('role', 'tree');
	
	    // Put role="treeitem" on every LI
	    // Put aria-expanded="false" on every LI (if it has no aria-expanded attr)
	    // Put tabindex="-1" on every LI (if it's not the first one)
	    // Put class=<classParent> on every LI that contains an UL
	    $el.find('li').each(function (i, li) {
	      var $li = (0, _jquery2['default'])(li);
	      $li.attr('role', 'treeitem').attr('tabindex', 0 === i ? '0' : '-1');
	      //  .find('a[href]').not('[href^=#]').attr('tabindex', 0)
	      //  .parent().attr('aria-label', function() { return $(this).text() })
	      if ($li.find('ul').length !== 0) {
	        if (!li.hasAttribute('aria-expanded')) {
	          $li.attr('aria-expanded', 'false');
	        }
	        $li.addClass(classParent);
	      }
	    });
	    // Put role="group" on every contained UL
	    $el.find('ul').attr('role', 'group');
	  }
	
	  function init() {
	    (0, _jquery2['default'])(selector).each(function (_, treeviewContainer) {
	      var $el = (0, _jquery2['default'])(treeviewContainer);
	      _addA11y($el);
	      var treeview = {
	        $el: $el,
	        $items: $el.find('li'),
	        $parents: $el.find('.' + classParent),
	        $visibleItems: null,
	        $activeItem: null
	      };
	      _collapseAll(treeview);
	      _bindEvents(treeview);
	    });
	  }
	
	  init();
	
	  // REVEAL API
	  return {
	    init: init,
	    destroy: destroy
	  };
	};
	
	new Frtreeview();
	
	exports['default'] = {
	  Frtreeview: Frtreeview
	};
	module.exports = exports['default'];

/***/ },
/* 28 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	
	var _jquery = __webpack_require__(4);
	
	var _jquery2 = _interopRequireDefault(_jquery);
	
	var _offcanvas = __webpack_require__(29);
	
	var _offcanvas2 = _interopRequireDefault(_offcanvas);
	
	var _offcanvas3 = __webpack_require__(30);
	
	var _offcanvas4 = _interopRequireDefault(_offcanvas3);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	/* eslint-enable */
	
	var opts = {
	  // String - panel
	  panelSelector: '.Offcanvas',
	
	  // String - content
	  contentSelector: '.Offcanvas-content',
	
	  // String - content
	  modalSelector: '.Offcanvas--modal',
	
	  // String - trigger
	  jsSelector: '.js-fr-offcanvas-open',
	
	  // String - Selector for the open button(s)
	  openSelector: '.js-fr-offcanvas-open',
	
	  // String - Selector for the close button
	  closeSelector: '.js-fr-offcanvas-close',
	
	  // String - Class name that will be added to the selector when the component has been initialised
	  readyClass: 'is-ready',
	
	  // String - Class name that will be added to the selector when the panel is visible
	  activeClass: 'is-active'
	};
	
	/*
	 *  Prevent scroll on body when offcanvas is visible
	 *  (the touchmove handler targets iOS devices)
	 */
	
	
	/* eslint-disable no-unused-vars */
	
	var _handleModalScroll = function _handleModalScroll() {
	  (0, _jquery2['default'])(opts.contentSelector).on('transitionend', function () {
	    if (!(0, _jquery2['default'])(opts.panelSelector).hasClass(opts.activeClass)) {
	      (0, _jquery2['default'])(window).off('scroll.offcanvas');
	      (0, _jquery2['default'])(document).off('touchmove.offcanvas');
	    } else {
	      (function () {
	        var _scrollTop = (0, _jquery2['default'])(window).scrollTop();
	        (0, _jquery2['default'])(window).on('scroll.offcanvas', function () {
	          return (0, _jquery2['default'])(window).scrollTop(_scrollTop);
	        });
	        (0, _jquery2['default'])(document).on('touchmove.offcanvas', function () {
	          return (0, _jquery2['default'])(window).scrollTop(_scrollTop);
	        });
	      })();
	    }
	  });
	};
	
	/*
	 *	FIXME: hack to show / hide the background panel
	 */
	var _handleModal = function _handleModal(e) {
	  if (e && (0, _jquery2['default'])(opts.panelSelector).hasClass(opts.activeClass) && !(0, _jquery2['default'])(e.target).is(opts.contentSelector)) {
	    // for some odd reason plain jquery click() does not work here
	    // // so we add that get(0) call
	    (0, _jquery2['default'])(opts.closeSelector).get(0).click();
	  }
	  // we're using "one" here instead of "bind" because
	  // otherwise $(opts.closeSelector).click() would trigger
	  // a click on modal again looping forever
	  (0, _jquery2['default'])(opts.modalSelector).one('click', _handleModal);
	};
	
	var _exports = {
	  Froffcanvas: _offcanvas2['default'],
	  opts: opts
	};
	
	(0, _jquery2['default'])(document).ready(function () {
	  var _scrollTop = (0, _jquery2['default'])(window).scrollTop();
	
	  (0, _jquery2['default'])(opts.openSelector).add((0, _jquery2['default'])(opts.closeSelector)).click(function (e) {
	    _scrollTop = (0, _jquery2['default'])(window).scrollTop();
	    e.preventDefault();
	  });
	
	  (0, _jquery2['default'])(opts.panelSelector).on('focus', function () {
	    (0, _jquery2['default'])(window).scrollTop(_scrollTop);
	  });
	
	  _handleModal();
	  _handleModalScroll();
	
	  _exports.offcanvas = (0, _offcanvas2['default'])(opts);
	});
	
	exports['default'] = _exports;
	module.exports = exports['default'];

/***/ },
/* 29 */
/***/ function(module, exports) {

	'use strict';
	
	// Polyfill matches as per https://github.com/jonathantneal/closest
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	Element.prototype.matches = Element.prototype.matches || Element.prototype.mozMatchesSelector || Element.prototype.msMatchesSelector || Element.prototype.oMatchesSelector || Element.prototype.webkitMatchesSelector;
	
	/**
	 * @param {object} options Object containing configuration overrides
	 */
	var Froffcanvas = function Froffcanvas() {
	  var _ref = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
	
	  var _ref$selector = _ref.selector;
	  var selector = _ref$selector === undefined ? '.js-fr-offcanvas' : _ref$selector;
	  var _ref$openSelector = _ref.openSelector;
	  var openSelector = _ref$openSelector === undefined ? '.js-fr-offcanvas-open' : _ref$openSelector;
	  var _ref$closeSelector = _ref.closeSelector;
	  var closeSelector = _ref$closeSelector === undefined ? '.js-fr-offcanvas-close' : _ref$closeSelector;
	  var _ref$readyClass = _ref.readyClass;
	  var readyClass = _ref$readyClass === undefined ? 'fr-offcanvas--is-ready' : _ref$readyClass;
	  var _ref$activeClass = _ref.activeClass;
	  var activeClass = _ref$activeClass === undefined ? 'fr-offcanvas--is-active' : _ref$activeClass;
	
	
	  //  CONSTANTS
	  var doc = document;
	  var docEl = doc.documentElement;
	  var _q = function _q(el) {
	    var ctx = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : doc;
	    return [].slice.call(ctx.querySelectorAll(el));
	  };
	
	  //  SUPPORTS
	  if (!('querySelector' in doc) || !('addEventListener' in window) || !docEl.classList) return;
	
	  //  SETUP
	  // set offcanvas element NodeLists
	  var panels = _q(selector);
	
	  //  TEMP
	  var currButtonOpen = null;
	  var currPanel = null;
	
	  //  UTILS
	  function _defer(fn) {
	    //  wrapped in setTimeout to delay binding until previous rendering has completed
	    if (typeof fn === 'function') setTimeout(fn, 0);
	  }
	  function _closest(el, selector) {
	    while (el) {
	      if (el.matches(selector)) break;
	      el = el.parentElement;
	    }
	    return el;
	  }
	  function _getPanelId(panel) {
	    return panel.getAttribute('id');
	  }
	
	  //  A11Y
	  function _addA11y(panel) {
	    //  add aria-hidden attribute
	    panel.setAttribute('aria-hidden', true);
	  }
	  function _removeA11y(panel) {
	    //  remove aria-hidden attribute
	    panel.removeAttribute('aria-hidden');
	  }
	
	  //  ACTIONS
	  function _showPanel(panel) {
	    //  set visibility to override any previous set style
	    panel.style.visibility = 'visible';
	    //  remove aria-hidden, add focus
	    panel.setAttribute('aria-hidden', false);
	    panel.setAttribute('tabindex', -1);
	    panel.focus();
	    //  sort out events
	    _defer(_unbindOpenPointer);
	    _defer(_bindDocKey);
	    _defer(_bindDocClick);
	    _defer(_bindClosePointer);
	    //  reset scroll position
	    panel.scrollTop = 0;
	    //  add active class
	    panel.classList.add(activeClass);
	  }
	  function _hidePanel() {
	    var panel = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : currPanel;
	    var returnfocus = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : true;
	
	    //  add aria-hidden, remove focus
	    panel.setAttribute('aria-hidden', true);
	    panel.removeAttribute('tabindex');
	    panel.blur();
	    //  set visibility to override any previous set style
	    panel.style.visibility = 'hidden';
	    //  sort out events
	    _unbindClosePointer(panel);
	    _unbindDocKey();
	    _unbindDocClick();
	    _bindOpenPointer(panel);
	    //  remove active class
	    panel.classList.remove(activeClass);
	    //  return focus to button that opened the panel and reset the reference
	    if (returnfocus) {
	      currButtonOpen.focus();
	      currButtonOpen = null;
	    }
	  }
	  function destroy() {
	    panels.forEach(function (panel) {
	      //  remove attributes
	      _removeA11y(panel);
	      //  unbind local events
	      _unbindOpenPointer(panel);
	      _unbindClosePointer(panel);
	      //  remove class
	      panel.classList.remove(readyClass);
	      panel.classList.remove(activeClass);
	      panel.style.visibility = '';
	    });
	    //  unbind global events
	    _unbindDocClick();
	    _unbindDocKey();
	    //  reset temp references
	    currButtonOpen = null;
	    currPanel = null;
	  }
	
	  //  EVENTS
	  function _eventOpenPointer(e) {
	    //  get panel
	    var panelId = e.currentTarget.getAttribute('aria-controls');
	    var panel = doc.getElementById(panelId);
	    //  hide any open panels
	    if (currPanel) _hidePanel(currPanel, false);
	    //  save temp panel/button
	    currButtonOpen = e.currentTarget;
	    currPanel = panel;
	    //  show
	    _showPanel(panel);
	  }
	  function _eventClosePointer() {
	    _hidePanel();
	  }
	  function _eventDocClick(e) {
	    //  check if target is panel or child of
	    var isPanel = e.target === currPanel;
	    var isPanelChild = _closest(e.target, selector);
	    if (!isPanel && !isPanelChild) _hidePanel();
	  }
	  function _eventDocKey(e) {
	    //  esc key
	    if (e.keyCode === 27) _hidePanel();
	  }
	
	  //  BIND EVENTS
	  function _bindOpenPointer(panel) {
	    var openButtons = _q(openSelector + '[aria-controls="' + _getPanelId(panel) + '"]'); // is this selector totally crazy?
	    openButtons.forEach(function (button) {
	      return button.addEventListener('click', _eventOpenPointer);
	    });
	  }
	  function _bindClosePointer() {
	    var panel = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : currPanel;
	
	    var closeButton = _q(closeSelector, panel)[0];
	    closeButton.addEventListener('click', _eventClosePointer);
	  }
	  function _bindDocClick() {
	    doc.addEventListener('click', _eventDocClick);
	  }
	  function _bindDocKey() {
	    doc.addEventListener('keydown', _eventDocKey);
	  }
	
	  //  UNBIND EVENTS
	  function _unbindOpenPointer() {
	    var panel = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : currPanel;
	
	    var openButtons = _q(openSelector + '[aria-controls="' + _getPanelId(panel) + '"]'); // yep its totally crazy
	    openButtons.forEach(function (button) {
	      return button.removeEventListener('click', _eventOpenPointer);
	    });
	  }
	  function _unbindClosePointer() {
	    var panel = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : currPanel;
	
	    var closeButton = _q(closeSelector, panel)[0];
	    closeButton.removeEventListener('click', _eventClosePointer);
	  }
	  function _unbindDocClick() {
	    doc.removeEventListener('click', _eventDocClick);
	  }
	  function _unbindDocKey() {
	    doc.removeEventListener('keydown', _eventDocKey);
	  }
	
	  //  INIT
	  function init() {
	    if (!panels) return;
	    //  loop through each offcanvas element
	    panels.forEach(function (panel) {
	      _addA11y(panel);
	      _bindOpenPointer(panel);
	      panel.classList.add(readyClass);
	    });
	  }
	  init();
	
	  // REVEAL API
	  return {
	    init: init,
	    destroy: destroy
	  };
	};
	
	// module exports
	exports['default'] = Froffcanvas;
	module.exports = exports['default'];

/***/ },
/* 30 */
/***/ function(module, exports) {

	// removed by extract-text-webpack-plugin

/***/ },
/* 31 */,
/* 32 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	
	var _jquery = __webpack_require__(4);
	
	var _jquery2 = _interopRequireDefault(_jquery);
	
	var _headroom = __webpack_require__(33);
	
	var _headroom2 = _interopRequireDefault(_headroom);
	
	var _throttle = __webpack_require__(7);
	
	var _throttle2 = _interopRequireDefault(_throttle);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	// Headroom for fixed sticky header
	
	var myElement = document.querySelector('header');
	
	var opts = {
	  // vertical offset in px before element is first unpinned
	  offset: 0,
	  // you can specify tolerance individually for up/down scroll
	  tolerance: {
	    up: 20,
	    down: 10
	  },
	  // css classes to apply
	  classes: {
	    // when element is initialised
	    initial: 'Headroom',
	    // when scrolling up
	    pinned: 'Headroom--pinned',
	    // when scrolling down
	    unpinned: 'Headroom--unpinned',
	    // when above offset
	    top: 'Headroom--top',
	    // when below offset
	    notTop: 'Headroom--not-top',
	    // when at bottom of scoll area
	    bottom: 'Headroom--bottom',
	    // when not at bottom of scroll area
	    notBottom: 'Headroom--not-bottom'
	  },
	  // element to listen to scroll events on, defaults to `window`
	  scroller: window,
	  // callback when pinned, `this` is headroom object
	  onPin: function onPin() {},
	  // callback when unpinned, `this` is headroom object
	  onUnpin: function onUnpin() {},
	  // callback when above offset, `this` is headroom object
	  onTop: function onTop() {},
	  // callback when below offset, `this` is headroom object
	  onNotTop: function onNotTop() {},
	  // callback when at bottom of page, `this` is headroom object
	  onBottom: function onBottom() {},
	  // callback when moving away from bottom of page, `this` is headroom object
	  onNotBottom: function onNotBottom() {}
	};
	
	var headroom = null;
	
	if (myElement) {
	  headroom = new _headroom2['default'](myElement, opts);
	  headroom.init();
	}
	
	/*
	 *	Make space when using fixed header.
	 *
	 *		The no-js alternative is to set up body padding inside CSS
	 *	 	assuming you know the exact header height in pixel
	 *	 	(expanded and minimized for all viewport width)
	 */
	var headroomFixed = '.Headroom--fixed';
	
	if ((0, _jquery2['default'])('.' + opts.classes.initial).is(headroomFixed)) {
	  (function () {
	    var INTERVAL = 250;
	
	    var windowWidth = (0, _jquery2['default'])(window).width();
	
	    // Needs to be here due to CSS transition (see on Safari)
	    var headerHeight = (0, _jquery2['default'])(headroomFixed).height();
	
	    var _adjustPadding = function _adjustPadding() {
	      var paddingTop = headerHeight;
	
	      (0, _jquery2['default'])('body').css({
	        paddingTop: paddingTop + 'px'
	      });
	    };
	
	    // Set up padding on page load
	    (0, _jquery2['default'])(document).ready(function () {
	      (0, _jquery2['default'])(headroomFixed).css({
	        position: 'fixed',
	        top: 0
	      });
	      _adjustPadding();
	    });
	
	    // Make padding respond to window resize
	    (0, _jquery2['default'])(window).resize((0, _throttle2['default'])(INTERVAL, function () {
	      var newWindowWidth = (0, _jquery2['default'])(window).width();
	      var height = (0, _jquery2['default'])(headroomFixed).height();
	      // Android browser triggers a resize event on scroll to top
	      // so we check for changes in window width
	      if (newWindowWidth !== windowWidth) {
	        windowWidth = newWindowWidth;
	        headerHeight = height;
	        setTimeout(_adjustPadding, INTERVAL);
	      }
	    }));
	
	    (0, _jquery2['default'])(headroomFixed).on('transitionend', (0, _throttle2['default'])(INTERVAL, function () {
	      var height = (0, _jquery2['default'])(this).height();
	      if (headerHeight < height) {
	        // This happens *only* after a resize
	        // _and_ when scrolling to top
	        headerHeight = height;
	        _adjustPadding();
	      }
	    }));
	  })();
	}
	
	/*
	 *  Toggle search-form visibility for mobile
	 */
	(0, _jquery2['default'])('.js-Header-search-trigger').click(function (e) {
	  (0, _jquery2['default'])('.js-Header-search-trigger').each(function (i, el) {
	    var $el = (0, _jquery2['default'])(el);
	    if ('true' === $el.attr('aria-hidden')) {
	      $el.attr('aria-hidden', 'false');
	      $el.removeClass('u-hiddenVisually');
	    } else {
	      $el.attr('aria-hidden', 'true');
	      $el.addClass('u-hiddenVisually');
	    }
	  });
	  (0, _jquery2['default'])((0, _jquery2['default'])(e.target).attr('aria-controls')).toggleClass('is-active');
	});
	
	exports['default'] = {
	  Headroom: _headroom2['default'],
	  headroom: headroom
	};
	module.exports = exports['default'];

/***/ },
/* 33 */
/***/ function(module, exports, __webpack_require__) {

	var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_ARRAY__, __WEBPACK_AMD_DEFINE_RESULT__;'use strict';
	
	var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };
	
	/*!
	 * headroom.js v0.9.3 - Give your page some headroom. Hide your header until you need it
	 * Copyright (c) 2016 Nick Williams - http://wicky.nillia.ms/headroom.js
	 * License: MIT
	 */
	
	(function (root, factory) {
	  'use strict';
	
	  if (true) {
	    // AMD. Register as an anonymous module.
	    !(__WEBPACK_AMD_DEFINE_ARRAY__ = [], __WEBPACK_AMD_DEFINE_FACTORY__ = (factory), __WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ? (__WEBPACK_AMD_DEFINE_FACTORY__.apply(exports, __WEBPACK_AMD_DEFINE_ARRAY__)) : __WEBPACK_AMD_DEFINE_FACTORY__), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
	  } else if ((typeof exports === 'undefined' ? 'undefined' : _typeof(exports)) === 'object') {
	    // COMMONJS
	    module.exports = factory();
	  } else {
	    // BROWSER
	    root.Headroom = factory();
	  }
	})(undefined, function () {
	  'use strict';
	
	  /* exported features */
	
	  var features = {
	    bind: !!function () {}.bind,
	    classList: 'classList' in document.documentElement,
	    rAF: !!(window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame)
	  };
	  window.requestAnimationFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame;
	
	  /**
	   * Handles debouncing of events via requestAnimationFrame
	   * @see http://www.html5rocks.com/en/tutorials/speed/animations/
	   * @param {Function} callback The callback to handle whichever event
	   */
	  function Debouncer(callback) {
	    this.callback = callback;
	    this.ticking = false;
	  }
	  Debouncer.prototype = {
	    constructor: Debouncer,
	
	    /**
	     * dispatches the event to the supplied callback
	     * @private
	     */
	    update: function update() {
	      this.callback && this.callback();
	      this.ticking = false;
	    },
	
	    /**
	     * ensures events don't get stacked
	     * @private
	     */
	    requestTick: function requestTick() {
	      if (!this.ticking) {
	        requestAnimationFrame(this.rafCallback || (this.rafCallback = this.update.bind(this)));
	        this.ticking = true;
	      }
	    },
	
	    /**
	     * Attach this as the event listeners
	     */
	    handleEvent: function handleEvent() {
	      this.requestTick();
	    }
	  };
	  /**
	   * Check if object is part of the DOM
	   * @constructor
	   * @param {Object} obj element to check
	   */
	  function isDOMElement(obj) {
	    return obj && typeof window !== 'undefined' && (obj === window || obj.nodeType);
	  }
	
	  /**
	   * Helper function for extending objects
	   */
	  function extend(object /*, objectN ... */) {
	    if (arguments.length <= 0) {
	      throw new Error('Missing arguments in extend function');
	    }
	
	    var result = object || {},
	        key,
	        i;
	
	    for (i = 1; i < arguments.length; i++) {
	      var replacement = arguments[i] || {};
	
	      for (key in replacement) {
	        // Recurse into object except if the object is a DOM element
	        if (_typeof(result[key]) === 'object' && !isDOMElement(result[key])) {
	          result[key] = extend(result[key], replacement[key]);
	        } else {
	          result[key] = result[key] || replacement[key];
	        }
	      }
	    }
	
	    return result;
	  }
	
	  /**
	   * Helper function for normalizing tolerance option to object format
	   */
	  function normalizeTolerance(t) {
	    return t === Object(t) ? t : { down: t, up: t };
	  }
	
	  /**
	   * UI enhancement for fixed headers.
	   * Hides header when scrolling down
	   * Shows header when scrolling up
	   * @constructor
	   * @param {DOMElement} elem the header element
	   * @param {Object} options options for the widget
	   */
	  function Headroom(elem, options) {
	    options = extend(options, Headroom.options);
	
	    this.lastKnownScrollY = 0;
	    this.elem = elem;
	    this.tolerance = normalizeTolerance(options.tolerance);
	    this.classes = options.classes;
	    this.offset = options.offset;
	    this.scroller = options.scroller;
	    this.initialised = false;
	    this.onPin = options.onPin;
	    this.onUnpin = options.onUnpin;
	    this.onTop = options.onTop;
	    this.onNotTop = options.onNotTop;
	    this.onBottom = options.onBottom;
	    this.onNotBottom = options.onNotBottom;
	  }
	  Headroom.prototype = {
	    constructor: Headroom,
	
	    /**
	     * Initialises the widget
	     */
	    init: function init() {
	      if (!Headroom.cutsTheMustard) {
	        return;
	      }
	
	      this.debouncer = new Debouncer(this.update.bind(this));
	      this.elem.classList.add(this.classes.initial);
	
	      // defer event registration to handle browser 
	      // potentially restoring previous scroll position
	      setTimeout(this.attachEvent.bind(this), 100);
	
	      return this;
	    },
	
	    /**
	     * Unattaches events and removes any classes that were added
	     */
	    destroy: function destroy() {
	      var classes = this.classes;
	
	      this.initialised = false;
	      this.elem.classList.remove(classes.unpinned, classes.pinned, classes.top, classes.notTop, classes.initial);
	      this.scroller.removeEventListener('scroll', this.debouncer, false);
	    },
	
	    /**
	     * Attaches the scroll event
	     * @private
	     */
	    attachEvent: function attachEvent() {
	      if (!this.initialised) {
	        this.lastKnownScrollY = this.getScrollY();
	        this.initialised = true;
	        this.scroller.addEventListener('scroll', this.debouncer, false);
	
	        this.debouncer.handleEvent();
	      }
	    },
	
	    /**
	     * Unpins the header if it's currently pinned
	     */
	    unpin: function unpin() {
	      var classList = this.elem.classList,
	          classes = this.classes;
	
	      if (classList.contains(classes.pinned) || !classList.contains(classes.unpinned)) {
	        classList.add(classes.unpinned);
	        classList.remove(classes.pinned);
	        this.onUnpin && this.onUnpin.call(this);
	      }
	    },
	
	    /**
	     * Pins the header if it's currently unpinned
	     */
	    pin: function pin() {
	      var classList = this.elem.classList,
	          classes = this.classes;
	
	      if (classList.contains(classes.unpinned)) {
	        classList.remove(classes.unpinned);
	        classList.add(classes.pinned);
	        this.onPin && this.onPin.call(this);
	      }
	    },
	
	    /**
	     * Handles the top states
	     */
	    top: function top() {
	      var classList = this.elem.classList,
	          classes = this.classes;
	
	      if (!classList.contains(classes.top)) {
	        classList.add(classes.top);
	        classList.remove(classes.notTop);
	        this.onTop && this.onTop.call(this);
	      }
	    },
	
	    /**
	     * Handles the not top state
	     */
	    notTop: function notTop() {
	      var classList = this.elem.classList,
	          classes = this.classes;
	
	      if (!classList.contains(classes.notTop)) {
	        classList.add(classes.notTop);
	        classList.remove(classes.top);
	        this.onNotTop && this.onNotTop.call(this);
	      }
	    },
	
	    bottom: function bottom() {
	      var classList = this.elem.classList,
	          classes = this.classes;
	
	      if (!classList.contains(classes.bottom)) {
	        classList.add(classes.bottom);
	        classList.remove(classes.notBottom);
	        this.onBottom && this.onBottom.call(this);
	      }
	    },
	
	    /**
	     * Handles the not top state
	     */
	    notBottom: function notBottom() {
	      var classList = this.elem.classList,
	          classes = this.classes;
	
	      if (!classList.contains(classes.notBottom)) {
	        classList.add(classes.notBottom);
	        classList.remove(classes.bottom);
	        this.onNotBottom && this.onNotBottom.call(this);
	      }
	    },
	
	    /**
	     * Gets the Y scroll position
	     * @see https://developer.mozilla.org/en-US/docs/Web/API/Window.scrollY
	     * @return {Number} pixels the page has scrolled along the Y-axis
	     */
	    getScrollY: function getScrollY() {
	      return this.scroller.pageYOffset !== undefined ? this.scroller.pageYOffset : this.scroller.scrollTop !== undefined ? this.scroller.scrollTop : (document.documentElement || document.body.parentNode || document.body).scrollTop;
	    },
	
	    /**
	     * Gets the height of the viewport
	     * @see http://andylangton.co.uk/blog/development/get-viewport-size-width-and-height-javascript
	     * @return {int} the height of the viewport in pixels
	     */
	    getViewportHeight: function getViewportHeight() {
	      return window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
	    },
	
	    /**
	     * Gets the physical height of the DOM element
	     * @param  {Object}  elm the element to calculate the physical height of which
	     * @return {int}     the physical height of the element in pixels
	     */
	    getElementPhysicalHeight: function getElementPhysicalHeight(elm) {
	      return Math.max(elm.offsetHeight, elm.clientHeight);
	    },
	
	    /**
	     * Gets the physical height of the scroller element
	     * @return {int} the physical height of the scroller element in pixels
	     */
	    getScrollerPhysicalHeight: function getScrollerPhysicalHeight() {
	      return this.scroller === window || this.scroller === document.body ? this.getViewportHeight() : this.getElementPhysicalHeight(this.scroller);
	    },
	
	    /**
	     * Gets the height of the document
	     * @see http://james.padolsey.com/javascript/get-document-height-cross-browser/
	     * @return {int} the height of the document in pixels
	     */
	    getDocumentHeight: function getDocumentHeight() {
	      var body = document.body,
	          documentElement = document.documentElement;
	
	      return Math.max(body.scrollHeight, documentElement.scrollHeight, body.offsetHeight, documentElement.offsetHeight, body.clientHeight, documentElement.clientHeight);
	    },
	
	    /**
	     * Gets the height of the DOM element
	     * @param  {Object}  elm the element to calculate the height of which
	     * @return {int}     the height of the element in pixels
	     */
	    getElementHeight: function getElementHeight(elm) {
	      return Math.max(elm.scrollHeight, elm.offsetHeight, elm.clientHeight);
	    },
	
	    /**
	     * Gets the height of the scroller element
	     * @return {int} the height of the scroller element in pixels
	     */
	    getScrollerHeight: function getScrollerHeight() {
	      return this.scroller === window || this.scroller === document.body ? this.getDocumentHeight() : this.getElementHeight(this.scroller);
	    },
	
	    /**
	     * determines if the scroll position is outside of document boundaries
	     * @param  {int}  currentScrollY the current y scroll position
	     * @return {bool} true if out of bounds, false otherwise
	     */
	    isOutOfBounds: function isOutOfBounds(currentScrollY) {
	      var pastTop = currentScrollY < 0,
	          pastBottom = currentScrollY + this.getScrollerPhysicalHeight() > this.getScrollerHeight();
	
	      return pastTop || pastBottom;
	    },
	
	    /**
	     * determines if the tolerance has been exceeded
	     * @param  {int} currentScrollY the current scroll y position
	     * @return {bool} true if tolerance exceeded, false otherwise
	     */
	    toleranceExceeded: function toleranceExceeded(currentScrollY, direction) {
	      return Math.abs(currentScrollY - this.lastKnownScrollY) >= this.tolerance[direction];
	    },
	
	    /**
	     * determine if it is appropriate to unpin
	     * @param  {int} currentScrollY the current y scroll position
	     * @param  {bool} toleranceExceeded has the tolerance been exceeded?
	     * @return {bool} true if should unpin, false otherwise
	     */
	    shouldUnpin: function shouldUnpin(currentScrollY, toleranceExceeded) {
	      var scrollingDown = currentScrollY > this.lastKnownScrollY,
	          pastOffset = currentScrollY >= this.offset;
	
	      return scrollingDown && pastOffset && toleranceExceeded;
	    },
	
	    /**
	     * determine if it is appropriate to pin
	     * @param  {int} currentScrollY the current y scroll position
	     * @param  {bool} toleranceExceeded has the tolerance been exceeded?
	     * @return {bool} true if should pin, false otherwise
	     */
	    shouldPin: function shouldPin(currentScrollY, toleranceExceeded) {
	      var scrollingUp = currentScrollY < this.lastKnownScrollY,
	          pastOffset = currentScrollY <= this.offset;
	
	      return scrollingUp && toleranceExceeded || pastOffset;
	    },
	
	    /**
	     * Handles updating the state of the widget
	     */
	    update: function update() {
	      var currentScrollY = this.getScrollY(),
	          scrollDirection = currentScrollY > this.lastKnownScrollY ? 'down' : 'up',
	          toleranceExceeded = this.toleranceExceeded(currentScrollY, scrollDirection);
	
	      if (this.isOutOfBounds(currentScrollY)) {
	        // Ignore bouncy scrolling in OSX
	        return;
	      }
	
	      if (currentScrollY <= this.offset) {
	        this.top();
	      } else {
	        this.notTop();
	      }
	
	      if (currentScrollY + this.getViewportHeight() >= this.getScrollerHeight()) {
	        this.bottom();
	      } else {
	        this.notBottom();
	      }
	
	      if (this.shouldUnpin(currentScrollY, toleranceExceeded)) {
	        this.unpin();
	      } else if (this.shouldPin(currentScrollY, toleranceExceeded)) {
	        this.pin();
	      }
	
	      this.lastKnownScrollY = currentScrollY;
	    }
	  };
	  /**
	   * Default options
	   * @type {Object}
	   */
	  Headroom.options = {
	    tolerance: {
	      up: 0,
	      down: 0
	    },
	    offset: 0,
	    scroller: window,
	    classes: {
	      pinned: 'headroom--pinned',
	      unpinned: 'headroom--unpinned',
	      top: 'headroom--top',
	      notTop: 'headroom--not-top',
	      bottom: 'headroom--bottom',
	      notBottom: 'headroom--not-bottom',
	      initial: 'headroom'
	    }
	  };
	  Headroom.cutsTheMustard = typeof features !== 'undefined' && features.rAF && features.bind && features.classList;
	
	  return Headroom;
	});

/***/ },
/* 34 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	
	var _jquery = __webpack_require__(4);
	
	var _jquery2 = _interopRequireDefault(_jquery);
	
	var _megamenu = __webpack_require__(35);
	
	var _megamenu2 = _interopRequireDefault(_megamenu);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	// ASAP hide megamenu panels
	(0, _jquery2['default'])('.js-megamenu').addClass('is-ready');
	
	var opts = {
	  /* if false open menu on hover */
	  openOnClick: true,
	
	  /* prefix for generated unique id attributes, which are required
	     to indicate aria-owns, aria-controls and aria-labelledby */
	  uuidPrefix: 'megamenu',
	
	  /* css class used to define the megamenu styling */
	  menuClass: 'Megamenu',
	
	  menuListClass: 'Megamenu-list',
	
	  /* css class for a top-level navigation item in the megamenu */
	  topNavItemClass: 'Megamenu-item',
	
	  /* css class for a megamenu panel */
	  panelClass: 'Megamenu-subnav',
	
	  /* css class for a group of items within a megamenu panel */
	  panelGroupClass: 'Megamenu-subnavGroup',
	
	  /* css class for the hover state */
	  hoverClass: 'is-hover',
	
	  /* css class for the focus state */
	  focusClass: 'is-focus',
	
	  /* css class for the open state */
	  openClass: 'is-open'
	};
	
	/*
	 *	Takes a Treeview and makes it work with Megamenu
	 */
	var listToMegaMenu = function listToMegaMenu($ul, _opts) {
	  var attrs = 'class aria-expanded aria-hidden role tabindex';
	  return $ul.clone().removeAttr(attrs).addClass(_opts.menuListClass).find('*').removeAttr(attrs).end().find('> li').each(function (i, li) {
	    (0, _jquery2['default'])(li).addClass(_opts.topNavItemClass).find('a')
	    // make item tabbable, this is required !
	    .attr('href', '#').end().find('> ul > li').unwrap().wrap('<ul class="' + _opts.panelGroupClass + '" />').end().find('> ul').wrapAll('<div class="' + _opts.panelClass + '" />');
	  }).end();
	};
	
	(0, _jquery2['default'])(document).ready(function () {
	  (0, _jquery2['default'])('.js-megamenu').each(function (i, el) {
	    var $el = (0, _jquery2['default'])(el);
	    var rel = (0, _jquery2['default'])(el).data('rel');
	    if ($el.find('ul').length === 0 && rel && (0, _jquery2['default'])(rel).length > 0) {
	      var $menu = listToMegaMenu((0, _jquery2['default'])(rel), opts);
	      $el.append($menu);
	      // @FIXME: make space for javascript rendered megamenu
	      if ((0, _jquery2['default'])('header').css('position') === 'fixed') {
	        (0, _jquery2['default'])('body').css({
	          paddingTop: '+=' + $el.height() + 'px'
	        });
	      }
	    }
	    $el.accessibleMegaMenu(opts);
	  });
	});
	
	exports['default'] = {
	  opts: opts,
	  listToMegaMenu: listToMegaMenu,
	  Megamenu: _megamenu2['default']
	};
	module.exports = exports['default'];

/***/ },
/* 35 */
/***/ function(module, exports) {

	'use strict';
	
	/*
	Copyright © 2013 Adobe Systems Incorporated.
	
	Licensed under the Apache License, Version 2.0 (the “License”)
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at
	
	http://www.apache.org/licenses/LICENSE-2.0
	
	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an “AS IS” BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
	*/
	
	/**
	 * @fileOverview accessibleMegaMenu plugin
	 *
	 *<p>Licensed under the Apache License, Version 2.0 (the “License”)
	 *<br />Copyright © 2013 Adobe Systems Incorporated.
	 *<br />Project page <a href='https://github.com/adobe-accessibility/Accessible-Mega-Menu'>https://github.com/adobe-accessibility/Accessible-Mega-Menu</a>
	 * @version 0.1
	 * @author Michael Jordan
	 * @requires jquery
	 */
	
	/*jslint browser: true, devel: true, plusplus: true, nomen: true */
	/*global jQuery */
	(function ($, window, document) {
	  var pluginName = 'accessibleMegaMenu',
	      defaults = {
	    openOnClick: false,
	    uuidPrefix: 'accessible-megamenu', // unique ID's are required to indicate aria-owns, aria-controls and aria-labelledby
	    menuClass: 'accessible-megamenu', // default css class used to define the megamenu styling
	    topNavItemClass: 'accessible-megamenu-top-nav-item', // default css class for a top-level navigation item in the megamenu
	    panelClass: 'accessible-megamenu-panel', // default css class for a megamenu panel
	    panelGroupClass: 'accessible-megamenu-panel-group', // default css class for a group of items within a megamenu panel
	    hoverClass: 'hover', // default css class for the hover state
	    focusClass: 'focus', // default css class for the focus state
	    openClass: 'open' // default css class for the open state
	  },
	      Keyboard = {
	    BACKSPACE: 8,
	    COMMA: 188,
	    DELETE: 46,
	    DOWN: 40,
	    END: 35,
	    ENTER: 13,
	    ESCAPE: 27,
	    HOME: 36,
	    LEFT: 37,
	    PAGE_DOWN: 34,
	    PAGE_UP: 33,
	    PERIOD: 190,
	    RIGHT: 39,
	    SPACE: 32,
	    TAB: 9,
	    UP: 38,
	    keyMap: {
	      48: '0',
	      49: '1',
	      50: '2',
	      51: '3',
	      52: '4',
	      53: '5',
	      54: '6',
	      55: '7',
	      56: '8',
	      57: '9',
	      59: '',
	      65: 'a',
	      66: 'b',
	      67: 'c',
	      68: 'd',
	      69: 'e',
	      70: 'f',
	      71: 'g',
	      72: 'h',
	      73: 'i',
	      74: 'j',
	      75: 'k',
	      76: 'l',
	      77: 'm',
	      78: 'n',
	      79: 'o',
	      80: 'p',
	      81: 'q',
	      82: 'r',
	      83: 's',
	      84: 't',
	      85: 'u',
	      86: 'v',
	      87: 'w',
	      88: 'x',
	      89: 'y',
	      90: 'z',
	      96: '0',
	      97: '1',
	      98: '2',
	      99: '3',
	      100: '4',
	      101: '5',
	      102: '6',
	      103: '7',
	      104: '8',
	      105: '9',
	      190: '.'
	    }
	  };
	  /**
	   * @desc Creates a new accessible mega menu instance.
	   * @param {jquery} element
	   * @param {object} [options] Mega Menu options
	   * @param {string} [options.uuidPrefix=accessible-megamenu] - Prefix for generated unique id attributes, which are required to indicate aria-owns, aria-controls and aria-labelledby
	   * @param {string} [options.menuClass=accessible-megamenu] - CSS class used to define the megamenu styling
	   * @param {string} [options.topNavItemClass=accessible-megamenu-top-nav-item] - CSS class for a top-level navigation item in the megamenu
	   * @param {string} [options.panelClass=accessible-megamenu-panel] - CSS class for a megamenu panel
	   * @param {string} [options.panelGroupClass=accessible-megamenu-panel-group] - CSS class for a group of items within a megamenu panel
	   * @param {string} [options.hoverClass=hover] - CSS class for the hover state
	   * @param {string} [options.focusClass=focus] - CSS class for the focus state
	   * @param {string} [options.openClass=open] - CSS class for the open state
	   * @constructor
	   */
	  function AccessibleMegaMenu(element, options) {
	    this.element = element;
	
	    // merge optional settings and defaults into settings
	    this.settings = $.extend({}, defaults, options);
	
	    this._defaults = defaults;
	    this._name = pluginName;
	
	    this.mouseTimeoutID = null;
	    this.focusTimeoutID = null;
	    this.mouseFocused = false;
	    this.justFocused = false;
	
	    this.init();
	  }
	
	  AccessibleMegaMenu.prototype = function () {
	
	    /* private attributes and methods ------------------------ */
	    var uuid = 0,
	        keydownTimeoutDuration = 1000,
	        keydownSearchString = '',
	        isTouch = typeof window.hasOwnProperty === 'function' && !!window.hasOwnProperty('ontouchstart'),
	        _getPlugin,
	        _addUniqueId,
	        _togglePanel,
	        _clickHandler,
	        _clickOutsideHandler,
	        _DOMAttrModifiedHandler,
	        _focusInHandler,
	        _focusOutHandler,
	        _keyDownHandler,
	        _mouseDownHandler,
	        _mouseOverHandler,
	        _mouseOutHandler,
	        _toggleExpandedEventHandlers;
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_getPlugin
	     * @desc Returns the parent accessibleMegaMenu instance for a given element
	     * @param {jQuery} element
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _getPlugin = function _getPlugin(element) {
	      return $(element).closest(':data(plugin_' + pluginName + ')').data('plugin_' + pluginName);
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_addUniqueId
	     * @desc Adds a unique id and element.
	     * The id string starts with the
	     * string defined in settings.uuidPrefix.
	     * @param {jQuery} element
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _addUniqueId = function _addUniqueId(element) {
	      element = $(element);
	      var settings = this.settings;
	      if (!element.attr('id')) {
	        element.attr('id', settings.uuidPrefix + '-' + new Date().getTime() + '-' + ++uuid);
	      }
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_togglePanel
	     * @desc Toggle the display of mega menu panels in response to an event.
	     * The optional boolean value 'hide' forces all panels to hide.
	     * @param {event} event
	     * @param {Boolean} [hide] Hide all mega menu panels when true
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _togglePanel = function _togglePanel(event, hide) {
	      var target = $(event.target),
	          that = this,
	          settings = this.settings,
	          menu = this.menu,
	          topli = target.closest('.' + settings.topNavItemClass),
	          panel = target.hasClass(settings.panelClass) ? target : target.closest('.' + settings.panelClass),
	          newfocus;
	
	      _toggleExpandedEventHandlers.call(this, true);
	
	      if (hide) {
	        topli = menu.find('.' + settings.topNavItemClass + ' .' + settings.openClass + ':first').closest('.' + settings.topNavItemClass);
	        if (!(topli.is(event.relatedTarget) || topli.has(event.relatedTarget).length > 0)) {
	          if ((event.type === 'mouseout' || event.type === 'focusout') && topli.has(document.activeElement).length > 0) {
	            return;
	          }
	          topli.find('[aria-expanded]').attr('aria-expanded', 'false').removeClass(settings.openClass).filter('.' + settings.panelClass).attr('aria-hidden', 'true');
	          if (event.type === 'keydown' && event.keyCode === Keyboard.ESCAPE || event.type === 'DOMAttrModified') {
	            newfocus = topli.find(':tabbable:first');
	            setTimeout(function () {
	              menu.find('[aria-expanded].' + that.settings.panelClass).off('DOMAttrModified.accessible-megamenu');
	              newfocus.focus();
	              that.justFocused = false;
	            }, 99);
	          }
	        } else if (topli.length === 0) {
	          menu.find('[aria-expanded=true]').attr('aria-expanded', 'false').removeClass(settings.openClass).filter('.' + settings.panelClass).attr('aria-hidden', 'true');
	        }
	      } else {
	        clearTimeout(that.focusTimeoutID);
	        topli.siblings().find('[aria-expanded]').attr('aria-expanded', 'false').removeClass(settings.openClass).filter('.' + settings.panelClass).attr('aria-hidden', 'true');
	        topli.find('[aria-expanded]').attr('aria-expanded', 'true').addClass(settings.openClass).filter('.' + settings.panelClass).attr('aria-hidden', 'false');
	        if (event.type === 'mouseover' && target.is(':tabbable') && topli.length === 1 && panel.length === 0 && menu.has(document.activeElement).length > 0) {
	          target.focus();
	          that.justFocused = false;
	        }
	
	        _toggleExpandedEventHandlers.call(that);
	      }
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_clickHandler
	     * @desc Handle click event on mega menu item
	     * @param {event} Event object
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _clickHandler = function _clickHandler(event) {
	      var target = $(event.currentTarget),
	          topli = target.closest('.' + this.settings.topNavItemClass),
	          panel = target.closest('.' + this.settings.panelClass);
	      if (topli.length === 1 && panel.length === 0 && topli.find('.' + this.settings.panelClass).length === 1) {
	        if (!target.hasClass(this.settings.openClass)) {
	          event.preventDefault();
	          event.stopPropagation();
	          _togglePanel.call(this, event);
	          this.justFocused = false;
	        } else {
	          if (this.justFocused) {
	            event.preventDefault();
	            event.stopPropagation();
	            this.justFocused = false;
	          } else if (isTouch) {
	            event.preventDefault();
	            event.stopPropagation();
	            _togglePanel.call(this, event, target.hasClass(this.settings.openClass));
	          }
	        }
	      }
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_clickOutsideHandler
	     * @desc Handle click event outside of a the megamenu
	     * @param {event} Event object
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _clickOutsideHandler = function _clickOutsideHandler(event) {
	      if ($(event.target).closest(this.menu).length === 0) {
	        event.preventDefault();
	        event.stopPropagation();
	        _togglePanel.call(this, event, true);
	      }
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_DOMAttrModifiedHandler
	     * @desc Handle DOMAttrModified event on panel to respond to Windows 8 Narrator ExpandCollapse pattern
	     * @param {event} Event object
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _DOMAttrModifiedHandler = function _DOMAttrModifiedHandler(event) {
	      if (event.originalEvent.attrName === 'aria-expanded' && event.originalEvent.newValue === 'false' && $(event.target).hasClass(this.settings.openClass)) {
	        event.preventDefault();
	        event.stopPropagation();
	        _togglePanel.call(this, event, true);
	      }
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_focusInHandler
	     * @desc Handle focusin event on mega menu item.
	     * @param {event} Event object
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _focusInHandler = function _focusInHandler(event) {
	      clearTimeout(this.focusTimeoutID);
	      var target = $(event.target),
	          panel = target.closest('.' + this.settings.panelClass);
	      target.addClass(this.settings.focusClass).on('click.accessible-megamenu', $.proxy(_clickHandler, this));
	      this.justFocused = !this.mouseFocused;
	      this.mouseFocused = false;
	      if (this.panels.not(panel).filter('.' + this.settings.openClass).length) {
	        _togglePanel.call(this, event);
	      }
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_focusOutHandler
	     * @desc Handle focusout event on mega menu item.
	     * @param {event} Event object
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _focusOutHandler = function _focusOutHandler(event) {
	      this.justFocused = false;
	      var that = this,
	          target = $(event.target),
	          topli = target.closest('.' + this.settings.topNavItemClass);
	
	      target
	      // .removeClass(this.settings.focusClass)
	      .off('click.accessible-megamenu');
	
	      if (window.cvox) {
	        // If ChromeVox is running...
	        that.focusTimeoutID = setTimeout(function () {
	          window.cvox.Api.getCurrentNode(function (node) {
	            if (topli.has(node).length) {
	              // and the current node being voiced is in
	              // the mega menu, clearTimeout,
	              // so the panel stays open.
	              clearTimeout(that.focusTimeoutID);
	            } else {
	              that.focusTimeoutID = setTimeout(function (scope, _event, hide) {
	                _togglePanel.call(scope, _event, hide);
	              }, 275, that, event, true);
	            }
	          });
	        }, 25);
	      } else {
	        that.focusTimeoutID = setTimeout(function () {
	          _togglePanel.call(that, event, true);
	        }, 300);
	      }
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_keyDownHandler
	     * @desc Handle keydown event on mega menu.
	     * @param {event} Event object
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _keyDownHandler = function _keyDownHandler(event) {
	      var that = this.constructor === AccessibleMegaMenu ? this : _getPlugin(this),
	          // determine the AccessibleMegaMenu plugin instance
	      settings = that.settings,
	          target = $($(this).is('.' + settings.hoverClass + ':tabbable') ? this : event.target),
	          // if the element is hovered the target is this, otherwise, its the focused element
	      menu = that.menu,
	          topnavitems = that.topnavitems,
	          topli = target.closest('.' + settings.topNavItemClass),
	          tabbables = menu.find(':tabbable'),
	          panel = target.hasClass(settings.panelClass) ? target : target.closest('.' + settings.panelClass),
	          panelGroups = panel.find('.' + settings.panelGroupClass),
	          currentPanelGroup = target.closest('.' + settings.panelGroupClass),
	          next,
	          keycode = event.keyCode || event.which,
	          start,
	          i,
	          o,
	          label,
	          found = false,
	          newString = Keyboard.keyMap[event.keyCode] || '',
	          regex,
	          isTopNavItem = topli.length === 1 && panel.length === 0;
	
	      if (target.is('input:focus, select:focus, textarea:focus, button:focus')) {
	        // if the event target is a form element we should handle keydown normally
	        return;
	      }
	
	      if (target.is('.' + settings.hoverClass + ':tabbable')) {
	        $('html').off('keydown.accessible-megamenu');
	      }
	
	      switch (keycode) {
	        case Keyboard.ESCAPE:
	          _togglePanel.call(that, event, true);
	          break;
	        case Keyboard.DOWN:
	          event.preventDefault();
	          if (isTopNavItem) {
	            _togglePanel.call(that, event);
	            found = topli.find('.' + settings.panelClass + ' :tabbable:first').focus().length === 1;
	          } else {
	            found = tabbables.filter(':gt(' + tabbables.index(target) + '):first').focus().length === 1;
	          }
	
	          if (!found && window.opera && opera.toString() === '[object Opera]' && (event.ctrlKey || event.metaKey)) {
	            tabbables = $(':tabbable');
	            i = tabbables.index(target);
	            found = $(':tabbable:gt(' + $(':tabbable').index(target) + '):first').focus().length === 1;
	          }
	          break;
	        case Keyboard.UP:
	          event.preventDefault();
	          if (isTopNavItem && target.hasClass(settings.openClass)) {
	            _togglePanel.call(that, event, true);
	            next = topnavitems.filter(':lt(' + topnavitems.index(topli) + '):last');
	            if (next.children('.' + settings.panelClass).length) {
	              found = next.children().attr('aria-expanded', 'true').addClass(settings.openClass).filter('.' + settings.panelClass).attr('aria-hidden', 'false').find(':tabbable:last').focus() === 1;
	            }
	          } else if (!isTopNavItem) {
	            found = tabbables.filter(':lt(' + tabbables.index(target) + '):last').focus().length === 1;
	          }
	
	          if (!found && window.opera && opera.toString() === '[object Opera]' && (event.ctrlKey || event.metaKey)) {
	            tabbables = $(':tabbable');
	            i = tabbables.index(target);
	            found = $(':tabbable:lt(' + $(':tabbable').index(target) + '):first').focus().length === 1;
	          }
	          break;
	        case Keyboard.RIGHT:
	          event.preventDefault();
	          if (isTopNavItem) {
	            found = topnavitems.filter(':gt(' + topnavitems.index(topli) + '):first').find(':tabbable:first').focus().length === 1;
	          } else {
	            if (panelGroups.length && currentPanelGroup.length) {
	              // if the current panel contains panel groups, and we are able to focus the first tabbable element of the next panel group
	              found = panelGroups.filter(':gt(' + panelGroups.index(currentPanelGroup) + '):first').find(':tabbable:first').focus().length === 1;
	            }
	
	            if (!found) {
	              found = topli.find(':tabbable:first').focus().length === 1;
	            }
	          }
	          break;
	        case Keyboard.LEFT:
	          event.preventDefault();
	          if (isTopNavItem) {
	            found = topnavitems.filter(':lt(' + topnavitems.index(topli) + '):last').find(':tabbable:first').focus().length === 1;
	          } else {
	            if (panelGroups.length && currentPanelGroup.length) {
	              // if the current panel contains panel groups, and we are able to focus the first tabbable element of the previous panel group
	              found = panelGroups.filter(':lt(' + panelGroups.index(currentPanelGroup) + '):last').find(':tabbable:first').focus().length === 1;
	            }
	
	            if (!found) {
	              found = topli.find(':tabbable:first').focus().length === 1;
	            }
	          }
	          break;
	        case Keyboard.TAB:
	          i = tabbables.index(target);
	          if (event.shiftKey && isTopNavItem && target.hasClass(settings.openClass)) {
	            _togglePanel.call(that, event, true);
	            next = topnavitems.filter(':lt(' + topnavitems.index(topli) + '):last');
	            if (next.children('.' + settings.panelClass).length) {
	              found = next.children().attr('aria-expanded', 'true').addClass(settings.openClass).filter('.' + settings.panelClass).attr('aria-hidden', 'false').find(':tabbable:last').focus();
	            }
	          } else if (event.shiftKey && i > 0) {
	            found = tabbables.filter(':lt(' + i + '):last').focus().length === 1;
	          } else if (!event.shiftKey && i < tabbables.length - 1) {
	            found = tabbables.filter(':gt(' + i + '):first').focus().length === 1;
	          } else if (window.opera && opera.toString() === '[object Opera]') {
	            tabbables = $(':tabbable');
	            i = tabbables.index(target);
	            if (event.shiftKey) {
	              found = $(':tabbable:lt(' + $(':tabbable').index(target) + '):last').focus().length === 1;
	            } else {
	              found = $(':tabbable:gt(' + $(':tabbable').index(target) + '):first').focus().length === 1;
	            }
	          }
	
	          if (found) {
	            event.preventDefault();
	          }
	          break;
	        case Keyboard.SPACE:
	          if (isTopNavItem) {
	            event.preventDefault();
	            _clickHandler.call(that, event);
	          } else {
	            return;
	          }
	          break;
	        case Keyboard.ENTER:
	          return;
	          break;
	        default:
	          // alphanumeric filter
	          clearTimeout(this.keydownTimeoutID);
	
	          keydownSearchString += newString !== keydownSearchString ? newString : '';
	
	          if (keydownSearchString.length === 0) {
	            return;
	          }
	
	          this.keydownTimeoutID = setTimeout(function () {
	            keydownSearchString = '';
	          }, keydownTimeoutDuration);
	
	          if (isTopNavItem && !target.hasClass(settings.openClass)) {
	            tabbables = tabbables.filter(':not(.' + settings.panelClass + ' :tabbable)');
	          } else {
	            tabbables = topli.find(':tabbable');
	          }
	
	          if (event.shiftKey) {
	            tabbables = $(tabbables.get().reverse());
	          }
	
	          for (i = 0; i < tabbables.length; i++) {
	            o = tabbables.eq(i);
	            if (o.is(target)) {
	              start = keydownSearchString.length === 1 ? i + 1 : i;
	              break;
	            }
	          }
	
	          regex = new RegExp('^' + keydownSearchString.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&'), 'i');
	
	          for (i = start; i < tabbables.length; i++) {
	            o = tabbables.eq(i);
	            label = $.trim(o.text());
	            if (regex.test(label)) {
	              found = true;
	              o.focus();
	              break;
	            }
	          }
	          if (!found) {
	            for (i = 0; i < start; i++) {
	              o = tabbables.eq(i);
	              label = $.trim(o.text());
	              if (regex.test(label)) {
	                o.focus();
	                break;
	              }
	            }
	          }
	          break;
	      }
	      that.justFocused = false;
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_mouseDownHandler
	     * @desc Handle mousedown event on mega menu.
	     * @param {event} Event object
	     * @memberof accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _mouseDownHandler = function _mouseDownHandler(event) {
	      if ($(event.target).is(this.settings.panelClass) || $(event.target).closest(':focusable').length) {
	        this.mouseFocused = true;
	      }
	      this.mouseTimeoutID = setTimeout(function () {
	        clearTimeout(this.focusTimeoutID);
	      }, 1);
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_mouseOverHandler
	     * @desc Handle mouseover event on mega menu.
	     * @param {event} Event object
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _mouseOverHandler = function _mouseOverHandler(event) {
	      clearTimeout(this.mouseTimeoutID);
	      $(event.target).addClass(this.settings.hoverClass);
	      _togglePanel.call(this, event);
	      if ($(event.target).is(':tabbable')) {
	        $('html').on('keydown.accessible-megamenu', $.proxy(_keyDownHandler, event.target));
	      }
	    };
	
	    /**
	     * @name jQuery.fn.accessibleMegaMenu~_mouseOutHandler
	     * @desc Handle mouseout event on mega menu.
	     * @param {event} Event object
	     * @memberof jQuery.fn.accessibleMegaMenu
	     * @inner
	     * @private
	     */
	    _mouseOutHandler = function _mouseOutHandler(event) {
	      var that = this;
	      $(event.target).removeClass(that.settings.hoverClass);
	
	      that.mouseTimeoutID = setTimeout(function () {
	        _togglePanel.call(that, event, true);
	      }, 250);
	      if ($(event.target).is(':tabbable')) {
	        $('html').off('keydown.accessible-megamenu');
	      }
	    };
	
	    _toggleExpandedEventHandlers = function _toggleExpandedEventHandlers(hide) {
	      var menu = this.menu;
	      if (hide) {
	        $('html').off('mouseup.outside-accessible-megamenu, touchend.outside-accessible-megamenu, mspointerup.outside-accessible-megamenu,  pointerup.outside-accessible-megamenu');
	
	        menu.find('[aria-expanded].' + this.settings.panelClass).off('DOMAttrModified.accessible-megamenu');
	      } else {
	        $('html').on('mouseup.outside-accessible-megamenu, touchend.outside-accessible-megamenu, mspointerup.outside-accessible-megamenu,  pointerup.outside-accessible-megamenu', $.proxy(_clickOutsideHandler, this));
	
	        /* Narrator in Windows 8 automatically toggles the aria-expanded property on double tap or click.
	           To respond to the change to collapse the panel, we must add a listener for a DOMAttrModified event. */
	        menu.find('[aria-expanded=true].' + this.settings.panelClass).on('DOMAttrModified.accessible-megamenu', $.proxy(_DOMAttrModifiedHandler, this));
	      }
	    };
	
	    /* public attributes and methods ------------------------- */
	    return {
	      constructor: AccessibleMegaMenu,
	
	      /**
	       * @lends jQuery.fn.accessibleMegaMenu
	       * @desc Initializes an instance of the accessibleMegaMenu plugins
	       * @memberof jQuery.fn.accessibleMegaMenu
	       * @instance
	       */
	      init: function init() {
	        var settings = this.settings,
	            nav = $(this.element),
	            menu = nav.children().first(),
	
	        // Only filter to those items with the selector class
	        topnavitems = this.settings.topNavItems ? menu.children(this.settings.topNavItems) : menu.children();
	        this.start(settings, nav, menu, topnavitems);
	      },
	
	      start: function start(settings, nav, menu, topnavitems) {
	        var that = this;
	        this.settings = settings;
	        this.menu = menu;
	        this.topnavitems = topnavitems;
	
	        nav.attr('role', 'navigation');
	        menu.addClass(settings.menuClass);
	        topnavitems.each(function (i, topnavitem) {
	          var topnavitemlink, topnavitempanel;
	          topnavitem = $(topnavitem);
	          topnavitem.addClass(settings.topNavItemClass);
	          topnavitemlink = topnavitem.find(':tabbable:first');
	          topnavitempanel = topnavitem.children(':not(:tabbable):last');
	          _addUniqueId.call(that, topnavitemlink);
	          if (topnavitempanel.length) {
	            _addUniqueId.call(that, topnavitempanel);
	            topnavitemlink.attr({
	              'aria-haspopup': true,
	              'aria-controls': topnavitempanel.attr('id'),
	              'aria-expanded': false
	            });
	
	            topnavitempanel.attr({
	              'role': 'group',
	              'aria-expanded': false,
	              'aria-hidden': true
	            }).addClass(settings.panelClass).not('[aria-labelledby]').attr('aria-labelledby', topnavitemlink.attr('id'));
	          }
	        });
	
	        this.panels = menu.find('.' + settings.panelClass);
	
	        menu.on('focusin.accessible-megamenu', ':focusable, .' + settings.panelClass, $.proxy(_focusInHandler, this)).on('focusout.accessible-megamenu', ':focusable, .' + settings.panelClass, $.proxy(_focusOutHandler, this)).on('keydown.accessible-megamenu', $.proxy(_keyDownHandler, this)).on('mousedown.accessible-megamenu', $.proxy(_mouseDownHandler, this));
	
	        if (!settings.openOnClick) {
	          menu.on('mouseover.accessible-megamenu', $.proxy(_mouseOverHandler, this)).on('mouseout.accessible-megamenu', $.proxy(_mouseOutHandler, this));
	        } else {
	          menu.on('click.accessible-megamenu', $.proxy(_mouseOverHandler, this));
	        }
	
	        if (isTouch) {
	          menu.on('touchstart.accessible-megamenu', $.proxy(_clickHandler, this));
	        }
	
	        menu.find('hr').attr('role', 'separator');
	
	        if ($(document.activeElement).closest(menu).length) {
	          $(document.activeElement).trigger('focusin.accessible-megamenu');
	        }
	      },
	
	      /**
	       * @desc Get default values
	       * @example $(selector).accessibleMegaMenu('getDefaults')
	       * @return {object}
	       * @memberof jQuery.fn.accessibleMegaMenu
	       * @instance
	       */
	      getDefaults: function getDefaults() {
	        return this._defaults;
	      },
	
	      /**
	       * @desc Get any option set to plugin using its name (as string)
	       * @example $(selector).accessibleMegaMenu('getOption', some_option)
	       * @param {string} opt
	       * @return {string}
	       * @memberof jQuery.fn.accessibleMegaMenu
	       * @instance
	       */
	      getOption: function getOption(opt) {
	        return this.settings[opt];
	      },
	
	      /**
	       * @desc Get all options
	       * @example $(selector).accessibleMegaMenu('getAllOptions')
	       * @return {object}
	       * @memberof jQuery.fn.accessibleMegaMenu
	       * @instance
	       */
	      getAllOptions: function getAllOptions() {
	        return this.settings;
	      },
	
	      /**
	       * @desc Set option
	       * @example $(selector).accessibleMegaMenu('setOption', 'option_name',  'option_value',  reinitialize)
	       * @param {string} opt - Option name
	       * @param {string} val - Option value
	       * @param {boolean} [reinitialize] - boolean to re-initialize the menu.
	       * @memberof jQuery.fn.accessibleMegaMenu
	       * @instance
	       */
	      setOption: function setOption(opt, value, reinitialize) {
	        this.settings[opt] = value;
	        if (reinitialize) {
	          this.init();
	        }
	      }
	    };
	  }();
	
	  /*
	   * @param {object} [options] Mega Menu options
	   * @param {string} [options.uuidPrefix=accessible-megamenu] - Prefix for generated unique id attributes, which are required to indicate aria-owns, aria-controls and aria-labelledby
	   * @param {string} [options.menuClass=accessible-megamenu] - CSS class used to define the megamenu styling
	   * @param {string} [options.topNavItemClass=accessible-megamenu-top-nav-item] - CSS class for a top-level navigation item in the megamenu
	   * @param {string} [options.panelClass=accessible-megamenu-panel] - CSS class for a megamenu panel
	   * @param {string} [options.panelGroupClass=accessible-megamenu-panel-group] - CSS class for a group of items within a megamenu panel
	   * @param {string} [options.hoverClass=hover] - CSS class for the hover state
	   * @param {string} [options.focusClass=focus] - CSS class for the focus state
	   * @param {string} [options.openClass=open] - CSS class for the open state
	   */
	  $.fn[pluginName] = function (options) {
	    return this.each(function () {
	      if (!$.data(this, 'plugin_' + pluginName)) {
	        $.data(this, 'plugin_' + pluginName, new $.fn[pluginName].AccessibleMegaMenu(this, options));
	      }
	    });
	  };
	
	  $.fn[pluginName].AccessibleMegaMenu = AccessibleMegaMenu;
	
	  /* :focusable and :tabbable selectors from
	     https://raw.github.com/jquery/jquery-ui/master/ui/jquery.ui.core.js */
	
	  /**
	   * @private
	   */
	  function visible(element) {
	    return $.expr.filters.visible(element) && !$(element).parents().addBack().filter(function () {
	      return $.css(this, 'visibility') === 'hidden';
	    }).length;
	  }
	
	  /**
	   * @private
	   */
	  function _focusable(element, isTabIndexNotNaN) {
	    var map,
	        mapName,
	        img,
	        nodeName = element.nodeName.toLowerCase();
	    if ('area' === nodeName) {
	      map = element.parentNode;
	      mapName = map.name;
	      if (!element.href || !mapName || map.nodeName.toLowerCase() !== 'map') {
	        return false;
	      }
	      img = $('img[usemap=#' + mapName + ']')[0];
	      return !!img && visible(img);
	    }
	    return (/input|select|textarea|button|object/.test(nodeName) ? !element.disabled : 'a' === nodeName ? element.href || isTabIndexNotNaN : isTabIndexNotNaN) &&
	    // the element and all of its ancestors must be visible
	    visible(element);
	  }
	
	  $.extend($.expr[':'], {
	    data: $.expr.createPseudo ? $.expr.createPseudo(function (dataName) {
	      return function (elem) {
	        return !!$.data(elem, dataName);
	      };
	    }) : // support: jQuery <1.8
	    function (elem, i, match) {
	      return !!$.data(elem, match[3]);
	    },
	
	    focusable: function focusable(element) {
	      return _focusable(element, !isNaN($.attr(element, 'tabindex')));
	    },
	
	    tabbable: function tabbable(element) {
	      var tabIndex = $.attr(element, 'tabindex'),
	          isTabIndexNaN = isNaN(tabIndex);
	      return (isTabIndexNaN || tabIndex >= 0) && _focusable(element, !isTabIndexNaN);
	    }
	  });
	})(jQuery, window, document);

/***/ },
/* 36 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	var _jquery = __webpack_require__(4);
	
	var _jquery2 = _interopRequireDefault(_jquery);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	var hideClass = 'u-jsHiddenVisually';
	
	(0, _jquery2['default'])('.js-Share').click(function (e) {
	  var $el = (0, _jquery2['default'])(e.currentTarget);
	  var $share = $el.closest('.Share');
	  var $buttons = $share.find('ul');
	
	  $buttons.toggleClass(hideClass);
	
	  $share.find('.Share-revealText').toggleClass(hideClass);
	
	  $share.find('.Share-revealIcon').toggleClass('is-open');
	});

/***/ },
/* 37 */
/***/ function(module, exports, __webpack_require__) {

	'use strict';
	
	Object.defineProperty(exports, "__esModule", {
	  value: true
	});
	
	var _jquery = __webpack_require__(4);
	
	var _jquery2 = _interopRequireDefault(_jquery);
	
	var _throttle = __webpack_require__(7);
	
	var _throttle2 = _interopRequireDefault(_throttle);
	
	function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }
	
	var threshold = 100;
	
	var _toggleScrolltop = function _toggleScrolltop() {
	  (0, _jquery2['default'])(window).scrollTop() > threshold ? (0, _jquery2['default'])('.js-scrollTop').show() : (0, _jquery2['default'])('.js-scrollTop').hide();
	};
	
	(0, _jquery2['default'])(window).scroll((0, _throttle2['default'])(500, _toggleScrolltop));
	(0, _jquery2['default'])(document).ready(_toggleScrolltop);
	
	exports['default'] = {
	  threshold: threshold
	};
	module.exports = exports['default'];

/***/ }
/******/ ])
});
;
//# sourceMappingURL=IWT.js.map