'use strict';

var m = require('mithril'),

  FooterController = function (model) {
    this.model = model;

    this.currentSlideID = function(){
      return model.currentSlideID()
    };

    this.add = function (value) {
      this.model.countValue(this.model.countValue() + value);
    };
  };


module.exports = FooterController;