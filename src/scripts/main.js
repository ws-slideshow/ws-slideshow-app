/** @jsx m */
'use strict';

var m = require('mithril'),
  AppController = require('./app/app-controller'),
  AppView = require('./app/app-view'),
  AppModel = require('./app/app-model'),

  WSSlideshow = {

    init: function (options) {
      //
      // TODO: Should we use a polyfill to support older browsers?
      // Polyfill https://developer.mozilla.org/de/docs/JavaScript/Reference/Global_Objects/Array/isArray#Compatibility
      if (Array.isArray(options)) {
        for (var i = 0; i < options.length; i++) {
          this.initModule(options[i]);
        }
      } else {
        this.initModule(options);
      }
    },

    initModule: function (options) {
      var
        element = document.getElementById(options.id),
        model = new AppModel(),
        controller = function () {},
        view = function (ctrl) {
          return AppView(new AppController(model, element))
        };

      // module
      m.module(element, {
        controller: controller,
        view: view
      });
      // fetch data
      model.fetchJSONData(options.json);
    }
  };

module.exports = window.WSSlideshow = WSSlideshow;
