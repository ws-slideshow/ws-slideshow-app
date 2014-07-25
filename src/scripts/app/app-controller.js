'use strict';

var m = require('mithril'),

  AppController = function(model){

    this.model = model;

    this.sec = function(){
      return (this.model.data().preferences && this.model.data().preferences.sec)
        ? this.model.data().preferences.sec
        : undefined;
    };

    this.add = function(value){
      console.log("add " + value);
      var newValue = this.model.countValue() + value;
      console.log("newValue " + newValue);
      this.model.countValue(newValue);
    };


    this.remove = function(value){
      var newValue = this.model.countValue() - value;
      console.log("newValue " + newValue);
      this.model.countValue(newValue);
    };

  };

module.exports = AppController;