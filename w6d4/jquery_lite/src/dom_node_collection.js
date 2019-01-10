class DOMNodeCollection {
  constructor(elements) {
    this.elements = elements;
    //The core function should return an instance of DOMNodeCollection.??
  }
  html(str) {
    if (str) {
      this.elements.forEach(element => {
        element.innerHTML = str;
      });
    } else {
      return this.elements[0].innerHTML;
    }
  }

  empty() {
    this.elements.forEach(el => {
      el.innerHTML = '';
    });
  }

  append(collection) {
    collection.forEach(tag => {
      this.elements.forEach(el => {
        el.innerHTML += tag.outerHTML;
      });
    });
  }

  // second time around like a boss
  attr(attribute) {
    for (let i = 0; i < this.elements.length; i++) {
      const el = this.elements[i];
      if (el.outerHTML.includes(attribute)) {
        let atts = el.attributes;
        return atts[attribute].value;
      }
    }
  }

  // first attempt
  // attr(attribute) {
  //   let result;
  //   this.elements.forEach((el) => {
  //     if (el.outerHTML.includes(attribute)) {
  //       let arr = el.outerHTML.split("\"");
  //       for (let i = 0; i < arr.length; i++) {
  //         if (arr[i].includes(attribute)) {
  //           result = arr[i + 1];
  //         }
  //       }
  //     }
  //   });
  //   return result;
  // }

  // addClass(klass) {
  //   for(let i = 0; i < this.elements.length; i++) {
  //     let el = this.elements[i];
  //     debugger
  //     if(el.outerHTML.includes('class')) {
  //       debugger
  //       el.attributes['class'].value += ` ${klass}`;
  //     } else {
  //       el.attributes['class'] = ` ${klass}`;
  //     }
  //   }
  //   return this;
  // }
  addClass(klass) {
    this.elements.forEach(el => {
      el.classList.add(klass);
    });
  }

  removeClass(klass) {
    this.elements.forEach(el => {
      el.classList.remove(klass);
    });
  }

  children() {
    const kids = [];
    this.elements.forEach(el => {
      if (el.children) { kids.push(el.children); }
      else if (el.children.length === 0) { kids.push(el); }
    });
    return new DOMNodeCollection(kids);
  }

  parent() {
      const parents = [];
      this.elements.forEach(el => {
        parents.push(el.parentNode);
      });
      return new DOMNodeCollection(parents);
  }

  find(selector) {
    const found = [];
    this.elements.forEach(el => {
    found.push(el.querySelectorAll(selector));
    });
    return found;
  }
  
  remove() {
    this.elements.forEach(el => {
      el.remove();
    });
  }
}

module.exports = DOMNodeCollection;
