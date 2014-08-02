var Vue = require('vue'),
  request = require('superagent'),
  util = require('./util'),
  error = require('./error');

module.exports = Vue.extend({

  components: {
    preloader: require('./preloader'),
    slides: require('./slides'),
    nav: require('./nav')
  },

  template: require('./main.html'),
  // default data
  data: {
    json: './slides.json',
    options: {},
    loading: true,
    albumsPreferences: {
      loop: false
    },
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

    nullAlbum: function () {
      return {
        slides: []
      };
    },

    currentAlbum: function () {
      return this.albums[this.albumIndex] || this.nullAlbum;
    },

    hasNextAlbum: function () {
      return this.albumIndex < this.albums.length - 1;
    },

    hasPrevAlbum: function () {
      return this.albumIndex > 0;
    },

    // slides
    // ------------------------------------------------------------

    nullSlide: function () {
      return {}
    },

    currentSlide: function () {
      return this.currentAlbum.slides[this.slideIndex] || this.nullSlide;
    },

    hasNextSlide: function () {
      var result = this.currentAlbum
        && this.currentAlbum.slides
        && this.slideIndex < this.currentAlbum.slides.length - 1;

      // check loop option, too
      if (!result) {
        result = !!this.albumsPreferences.loop || !!this.currentAlbum.loop
      }

      return result;
    },

    hasPrevSlide: function () {
      return this.slideIndex > 0;
    },


    maxSlideIndex: function () {
      return this.currentAlbum.slides.length - 1;
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
          error.show("Error loading JSON file", err);
        } else {
          if(data.body){
            self.addData(data.body);
          }
          self.loading = false;
        }

      });
    },

    addData: function (data) {
      this.preferences = util.mergeObject(this.preferences, data.preferences);
      this.albumsPreferences = util.mergeObject(this.albumsPreferences, data.albumsPreferences);
      this.albums = data.albums;
    },

    // albums
    // ------------------------------------------------------------

    nextAlbum: function () {
      if (!!this.hasNextAlbum) {
        this.albumIndex += 1;
        this.slideIndex = 0;
      }
    },

    prevAlbum: function () {
      if (!!this.hasPrevAlbum) {
        this.albumIndex -= 1;
      }
    },

    // slides
    // ------------------------------------------------------------

    /**
     * Triggers next slide index.
     * If not a next slide is available
     * it checks the loop options of current album
     * or all albums, too.
     */
    nextSlide: function () {
      if (!!this.hasNextSlide) {
        // check max slide index
        if (this.slideIndex == this.maxSlideIndex) {
          if (!!this.currentAlbum.loop) {
            this.slideIndex = 0;
          } else if (!!this.albumsPreferences.loop) {
            this.slideIndex = 0;
            this.nextAlbum();
          }
        } else {
          this.slideIndex += 1;
        }
      }
    },

    prevSlide: function () {
      if (!!this.hasPrevSlide) {
        this.slideIndex -= 1;
      } else {
        if (!!this.hasPrevAlbum) {
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
    this.fetchJSONData(this.json);

  }
});