var React = require('react'),
  Fluxxor = require('fluxxor'),
  AppConstants = require('./app-constants'),

  AppStore = Fluxxor.createStore({

    getState: function() {
      return {
        currentSlideID: this.currentSlideID,
        elementId: this.elementId,
        preloading: this.preloading
      };
    },

    initialize: function (options) {

      this.currentSlideID = options.slideID || 0;
      this.elementId = options.elementId;

      this.bindActions(
        AppConstants.LOAD_DATA, this.loadDataHandler,
        AppConstants.NEXT_SLIDE, this.nextSlideHandler,
        AppConstants.PREV_SLIDE, this.prevSlideHandler
      );
    },

    setPreloading: function(newValue){
      if(this.preloading !== newValue){
        this.preloading = newValue;
        this.emit("change");
      }
    },

    loadDataHandler: function(data){
      this.setPreloading(true);
      console.log("loadDataHandler " + data);
      setTimeout(function() {
        this.setPreloading(false);
      }.bind(this), 1000);
    },

    nextSlideHandler: function(){

    },

    prevSlideHandler: function(){

    }


  });

module.exports = AppStore;