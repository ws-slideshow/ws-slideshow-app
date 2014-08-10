var View = require('famous/core/View'),
  Surface = require('famous/core/Surface'),
  Transform = require('famous/core/Transform'),
  Modifier = require('famous/core/Modifier'),
  ImageSurface = require('famous/surfaces/ImageSurface'),
  appStore = require('../AppStore');

// constructor
// ------------------------------------------------------------

function Slides() {
  View.apply(this, arguments);
}

// public
// ------------------------------------------------------------

Slides.prototype = Object.create(View.prototype);
Slides.prototype.constructor = Slides;

Slides.DEFAULT_OPTIONS = {};

Slides.prototype.init = function () {
  addLogo.call(this);

  appStore.when(["slideIndex"], function (index) {
    console.log("SLIDES: slideIndex changed " + index);
  });

  return this;
};

// private
// ------------------------------------------------------------

var addLogo = function () {
  var logo = new ImageSurface({
    size: [50, 50],
    content: 'http://code.famo.us/assets/famous_logo.svg'
  });

  var initialTime = Date.now(),
    logoModifier = new Modifier({
      align: [0.5, 0.5],
      origin: [0.5, 0.5],
      transform: function () {
//      return Transform.rotateY(0.002 * (Date.now() - initialTime));
        return Transform.rotateY(0.002);
      }
    });

  logo.on('click', function () {
    console.log('logo clicked');
  });

  this.add(logoModifier).add(logo);

}

module.exports = Slides;

