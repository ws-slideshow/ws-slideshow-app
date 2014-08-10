var EventHandler = require('famous/core/EventHandler'),
  AppActions = require('./AppActions'),
  Reflux = require('reflux'),


  stores = {

    slideIndex: Reflux.createStore({
      init: function () {
        this.listenTo(AppActions.nextSlide, this.nextSlideHandler);
        this.listenTo(AppActions.prevSlide, this.prevSlideHandler);
        this.slideIndex = 0;
      },
      nextSlideHandler: function (data) {
        this.slideIndex += 1;
        this.trigger(this.slideIndex);
      },
      prevSlideHandler: function (data) {
        this.slideIndex -= 1;
        this.trigger(this.slideIndex);
      }

    })


  };

module.exports = stores;