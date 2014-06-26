/** @jsx React.DOM */
var React = require('react'),
  App = require('app/app'),

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
      var container = document.getElementById(options.id);
      React.renderComponent(
        <App elementId={options.id} json={options.json} />,
        document.getElementById(options.id)
      );
    }
  };

module.exports =
  window.WSSlideshow =
    WSSlideshow;
