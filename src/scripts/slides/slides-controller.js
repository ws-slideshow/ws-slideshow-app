'use strict';

var m = require('mithril'),

  SlidesController = function (model) {
    this.model = model;

    this.selectedSlideIDChanged = function(){
      var value = this.model.countValue() + 3;
      console.log("selectedSlideIDChanged " + value)
    }

    this.slidePath = function(){
//      return "slides/amrum/0.jpg";
      return "";
    };

    this.slideLoadedHandler = function () {
      console.log("SlidesController::slideLoadedHandler ");
    };
  };


module.exports = SlidesController;