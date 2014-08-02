'use strict';

var Vue = require('vue'),
  Main = require('./main'),

  WSSlideshow = {

    init: function (options) {
      //
      // TODO: Should we use a polyfill to support older browsers?
      // Polyfill https://developer.mozilla.org/de/docs/JavaScript/Reference/Global_Objects/Array/isArray#Compatibility
      if (Array.isArray(options)) {
        for (var i = 0; i < options.length; i++) {
          this.initComponents(options[i]);
        }
      } else {
        this.initComponents(options);
      }
    },

    initComponents: function (options) {
      var main = new Main({
        el: options.element,
        data:{
          json: options.json
        }
      });

    }
  };

module.exports = window.WSSlideshow = WSSlideshow;
