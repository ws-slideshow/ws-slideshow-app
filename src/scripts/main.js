/** @jsx React.DOM */
var React = require('react'),
  Fluxxor = require('fluxxor'),
  AppStore = require('./app/app-store'),
  AppActions = require('./app/app-actions')
  App = require('./app/app'),

  WSSlideshow = {

    init: function (options) {

      if (Array.isArray(options)) {
        for (var i = 0; i < options.length; i++) {
          this.renderComponent(options[i]);
        }
      } else {
        this.renderComponent(options)
      }
    },

    renderComponent: function (options) {

      var container = document.getElementById(options.id),
      actions = {
        loadData: function(url, index) {
          this.dispatch("ADD_URL", {url: url, index: index});
        }
      },
        appactions = AppActions,
        stores = {
          AppStore: new AppStore({
            elementId: options.id
          })
        };
        var flux = new Fluxxor.Flux(stores, appactions);
      //
      // render app
      React.renderComponent(<App flux={flux} />, container);
      //
      flux.actions.loadData(options.json);
    }
  };

module.exports =
  window.WSSlideshow =
    WSSlideshow;
