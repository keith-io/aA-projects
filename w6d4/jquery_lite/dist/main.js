/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
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
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(elements) {\n    this.elements = elements;\n    //The core function should return an instance of DOMNodeCollection.??\n  }\n  html(str) {\n    if (str) {\n      this.elements.forEach(element => {\n        element.innerHTML = str;\n      });\n    } else {\n      return this.elements[0].innerHTML;\n    }\n  }\n\n  empty() {\n    this.elements.forEach(el => {\n      el.innerHTML = '';\n    });\n  }\n\n  append(collection) {\n    collection.forEach(tag => {\n      this.elements.forEach(el => {\n        el.innerHTML += tag.outerHTML;\n      });\n    });\n  }\n\n  // second time around like a boss\n  attr(attribute){\n    for(let i = 0; i < this.elements.length; i++) {\n      const el = this.elements[i];\n      if (el.outerHTML.includes(attribute)) {\n        let atts = el.attributes;\n        return atts[attribute].value;\n      }\n    }\n  }\n\n  // first attempt\n  // attr(attribute) {\n  //   let result;\n  //   this.elements.forEach((el) => {\n  //     if (el.outerHTML.includes(attribute)) {\n  //       let arr = el.outerHTML.split(\"\\\"\");\n  //       for (let i = 0; i < arr.length; i++) {\n  //         if (arr[i].includes(attribute)) {\n  //           result = arr[i + 1];\n  //         }\n  //       }\n  //     }\n  //   });\n  //   return result;\n  // }\n\n  // addClass(klass) {\n  //   for(let i = 0; i < this.elements.length; i++) {\n  //     let el = this.elements[i];\n  //     debugger\n  //     if(el.outerHTML.includes('class')) {\n  //       debugger\n  //       el.attributes['class'].value += ` ${klass}`;\n  //     } else {\n  //       el.attributes['class'] = ` ${klass}`;\n  //     }\n  //   }\n  //   return this;\n  // }\n  addClass(klass) {\n    this.elements.forEach(el => {\n      el.classList.add(klass);\n    });\n  }\n\n  removeClass(klass) {\n    this.elements.forEach(el => {\n      el.classList.remove(klass);\n    });\n  }\n}\n\nmodule.exports = DOMNodeCollection;\n\n\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nfunction $l(selector) {\n  let arrEls;\n\n  if (typeof selector === 'string') {\n    const elementList = document.querySelectorAll(selector);\n    arrEls = Array.from(elementList);\n  } else if (selector instanceof HTMLElement) {\n    const elementList = document.querySelectorAll(selector);\n    arrEls = Array.from(elementList);\n  }\n  return new DOMNodeCollection(arrEls);\n}\n\nwindow.$l = $l;\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });