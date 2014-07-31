/** @jsx m */
'use strict';

var Vue = require('vue'),
  request = require('superagent'),

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

      new Vue({
        el: options.element,
        components: {
          preloader: require('./preloader'),
          slides: require('./slides'),
          footer: require('./footer')
        },
        template: require('./main.html'),

        data: {
          title: 'Hello WS-Slideshow & Vue.js!',
          element: undefined,
          json: undefined,
          countValue: -1,
          selectedSlideID: -1,
          loading: true
        },

        ready: function () {

          console.log("MAIN countValue " + this.countValue);

          this.$watch('countValue', function (value) {
            console.log("WATCH value  ");
            console.log(value);
          });

          // load data
          this.fetchJSONData(options.json);

        },

        methods: {
          fetchJSONData: function (url) {
            this.loading = true;
            console.log("url " + url);
            var self = this;
            request.get(url, function (err, data) {
              if (err) {
                throw err;
              } else {
                self.data = data;
                self.loading = false;
              }

            });
          }
        }
      })

    }
  };

module.exports = window.WSSlideshow = WSSlideshow;
