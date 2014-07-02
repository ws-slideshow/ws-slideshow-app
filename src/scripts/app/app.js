/** @jsx React.DOM */
var React = require('react'),
  Fluxxor = require('fluxxor'),
  FluxMixin = Fluxxor.FluxMixin(React),
  FluxChildMixin = Fluxxor.FluxChildMixin(React),
  StoreWatchMixin = Fluxxor.StoreWatchMixin,
  Preloader = require('./preloader'),
  Slides = require('./slides'),
  ThumbsOverview = require('./thumbs-overview'),
  ThumbsBar = require('./thumbs-bar'),
  Nav = require('./nav'),


  App = React.createClass({

    mixins: [
      FluxMixin,
      StoreWatchMixin("AppStore")
    ],

    getStateFromFlux: function () {
      var flux = this.getFlux();
      return {
        appData: flux.store("AppStore").getState()
      };
    },

    render: function () {
      console.log("preloading " + this.state.appData.preloading);
      if (!!this.state.appData.preloading) {
        return <Preloader />;
      } else {
        return <div
        className="wsss-app-container"
        >
          <Slides />
          <ThumbsOverview />
          <ThumbsBar />
          <Nav />
        </div>
      }
    }
  });

module.exports = App;
