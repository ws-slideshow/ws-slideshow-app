var View = require('famous/core/View'),
  Surface = require('famous/core/Surface'),
  Transform = require('famous/core/Transform'),
  Modifier = require('famous/core/Modifier'),
  Nav = require('./nav/Nav'),
  Slides = require('./slides/Slides'),
  Reflux = require('reflux');

// constructor
// ------------------------------------------------------------

function App() {

  View.apply(this, arguments);
}

// public
// ------------------------------------------------------------

App.prototype = Object.create(View.prototype);
App.prototype.constructor = App;

App.DEFAULT_OPTIONS = {};

App.prototype.init = function () {
  // use famous built in event system
  var EventHandler = require('famous/core/EventHandler');
  Reflux.setEventEmitter(new EventHandler());
  // add content
  addSlides.call(this);
  addNav.call(this);

  return this;
};

// private
// ------------------------------------------------------------

var addSlides = function(){
    var modifier = new Modifier({
      align: [0, 0],
      origin: [0, 0]
    }),
      slides = new Slides().init();

    this.add(modifier).add(slides);
  },


  addNav = function(){
    var modifier = new Modifier({
      align: [0, 1],
      origin: [0, 1]
    }),
      content = new Nav().init();

    this.add(modifier).add(content);

  }

module.exports = App;