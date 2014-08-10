var EventHandler = require('famous/core/EventHandler'),
  Dispatcher = require('./event/Dispatcher'),
  ActionConstants = require('./event/ActionConstants'),
  Model = require('model'),
  eventInput = new EventHandler(),
  
  // model
  // ------------------------------------------------------------
  
  store = new Model({
    slideIndex: 0
  }),

  // private
  // ------------------------------------------------------------
  
  init = function () {
    console.log("INIT AppStore");
    // register events
    Dispatcher.register(eventInput);
    // add event handler
    eventInput.addListener(ActionConstants.NEXT_SLIDE, nextSlideHandler);
    eventInput.addListener(ActionConstants.PREV_SLIDE, prevSlideHandler);
  },

  nextSlideHandler = function (data) {
    store.slideIndex += 1;
  };

  prevSlideHandler = function (data) {
    store.slideIndex -= 1;
  };

init();


module.exports = store;