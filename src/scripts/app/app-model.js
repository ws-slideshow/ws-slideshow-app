/** @jsx m */
'use strict';

var m = require('mithril'),

  AppModel = function(element){

    this.element = undefined;
    this.data = m.prop({});
    this.countValue = m.prop(0);
    this.selectedSlideID = m.prop(0);

    this.loading = m.prop(true);

    this.fetchJSONData = function (url) {
      this.loading(true);
      console.log("url " + url);
      m.request(
        {
          method: "GET",
          url: url
        }
      ).then(
        this.resultHandler
      )

    }.bind(this)

    this.resultHandler = function(result){
      this.loading(false);
      this.data(result);
//      console.log("data " + JSON.stringify(this.data));
      console.log("resultHandler ");
    }.bind(this)

  };

module.exports = AppModel;