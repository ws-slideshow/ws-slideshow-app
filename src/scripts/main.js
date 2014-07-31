'use strict';

var Vue = require('vue'),
  request = require('superagent'),
  util = require('./util'),

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
          nav: require('./nav')
        },

        template: require('./main.html'),

        data: {
          loading: true,
          albums: [],
          preferences: {
            sec: 4,
            startViewID: 1,
            autoStart: false,
            hideBar: true,
            preventFullScreen: false,
            themeColor: "#00C8FA",
            bgColor: "#000000",
            bgAlpha: 100,
            height: 600,
            width: 800,
            slideEffect: "random",
            saveSlide: false,
            thumbSize: 60,
            iconWidth: 48,
            iconHeight: 40,
            thumbsBgColor: "#000000",
            thumbsBorderColor: "#00CCFF",
            soundAutoPlay: false,
            soundPath: "",
            descriptionAlign: "top",
            descriptionBgColor: "#000000",
            descriptionBgAlpha: 40,
            albumDescriptionTxtColor: "#FFFFFF",
            albumDescriptionTxtHoverColor: "#000000",
            albumDescriptionBgColor: "#FFFFFF"

          },
          slideIndex: 0,
          albumIndex: 0
        },

        computed: {

          // albums
          // ------------------------------------------------------------

          currentAlbum: function(){
            var album = this.albums[this.albumIndex];
            if(!album){
              album = {slides: []};
            }
            return album;
          },
          hasNextAlbum: function(){
            return this.albumIndex < this.albums.length - 1;
          },
          hasPrevAlbum: function(){
            return this.albumIndex > 0;
          },

          // slides
          // ------------------------------------------------------------

          currentSlide: function(){
            return this.currentAlbum.slides[this.slideIndex];
          },

          hasNextSlide: function(){
            return this.slideIndex < this.currentAlbum.slides.length - 1;
          },
          hasPrevSlide: function(){
            return this.slideIndex > 0;
          }
        },

        methods: {

          // data
          // ------------------------------------------------------------

          fetchJSONData: function (url) {
            this.loading = true;
            var self = this;
            request.get(url, function (err, data) {
              if (err) {
                // TODO: handle error
              } else {
                var json = data.body;
                self.preferences = util.mergeObject(self.preferences, json.preferences);
                self.albums = json.albums;
                self.loading = false;
              }

            });
          },

          // albums
          // ------------------------------------------------------------

          nextAlbum: function(){
            if(!!this.hasNextAlbum){
              this.albumIndex += 1;
              this.slideIndex = 0;
            }
          },

          prevAlbum: function(){
            if(!!this.hasPrevAlbum){
              this.albumIndex -= 1;
            }
          },

          // slides
          // ------------------------------------------------------------

          nextSlide: function(){
            if(!!this.hasNextSlide){
              this.slideIndex += 1;
            } else {
              this.nextAlbum();
            }
          },

          prevSlide: function(){
            if(!!this.hasPrevSlide){
              this.slideIndex -= 1;
            } else {
              if(!!this.hasPrevAlbum){
                this.prevAlbum();
                this.slideIndex = this.currentAlbum.slides.length - 1;
              }
            }
          }
        },

        ready: function () {

          this.$watch('slideIndex', function (value) {
            console.log("WATCHING slideIndex " + value);
          });

          this.$watch('albumIndex', function (value) {
            console.log("WATCHING albumIndex " + value);
          });

          // load data
          this.fetchJSONData(options.json);

        }
      })

    }
  };

module.exports = window.WSSlideshow = WSSlideshow;
