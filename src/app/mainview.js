var View = require('famous/core/View'),
  Modifier = require('famous/core/Modifier'),
  Surface = require('famous/core/Surface'),
  Transform = require('famous/core/Transform'),
  ImageSurface = require('famous/surfaces/ImageSurface');

function MainView() {
  View.apply(this, arguments);

  this._addText();
  this._addLogo();
}

MainView.prototype = Object.create(View.prototype);
MainView.prototype.constructor = MainView;

MainView.DEFAULT_OPTIONS = {};

MainView.prototype._addLogo = function () {
  // your app here
  var logo = new ImageSurface({
    size: [50, 50],
    content: 'http://code.famo.us/assets/famous_logo.svg',
    classes: ['double-sided']
  });

  var initialTime = Date.now();
  var centerSpinModifier = new Modifier({
    origin: [0.5, 0.5],
    transform: function () {
      return Transform.rotateY(0.002 * (Date.now() - initialTime));
    }
  });

  this.add(centerSpinModifier).add(logo)

}
MainView.prototype._addText = function () {
  var surface = new Surface({
    size: [500, 50],
    content: 'HELLO WS-Slideshow, I am a surface of FAMOUS',
    properties: {
      backgroundColor: '#9AC5B1',
      textAlign: 'center',
      color: '#FFF',
      lineHeight: '50px',
      fontSize: '13px',
      fontFamily: 'Arial'
    }
  });

  this.add(surface);
}

module.exports = MainView;