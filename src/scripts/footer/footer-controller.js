'use strict';

var m = require('mithril'),

  FooterController = function (model) {
    this.model = model;

    this.currentSlideID = function(){
      return model.currentSlideID()
    };

    this.add = function (value) {
      console.log("value " + value);
      this.model.countValue(this.model.countValue() + value);
    };
  };


module.exports = FooterController;