const DOMNodeCollection = require("./dom_node_collection.js");

function $l(selector) {
  let arrEls;

  if (typeof selector === 'string') {
    const elementList = document.querySelectorAll(selector);
    arrEls = Array.from(elementList);
  } else if (selector instanceof HTMLElement) {
    const elementList = document.querySelectorAll(selector);
    arrEls = Array.from(elementList);
  }
  return new DOMNodeCollection(arrEls);
}

window.$l = $l;
