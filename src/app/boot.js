'use strict';

var Engine = require('famous/core/Engine'),
  App = require('./App'),

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
      var element = document.getElementById(options.element),
        mainContext = Engine.createContext(element),
        app = new App();
      app.init();

      console.log("element " + options.element);
      // add the instance to the context
      mainContext.add(app);

    }
  };

module.exports = window.WSSlideshow = WSSlideshow;
