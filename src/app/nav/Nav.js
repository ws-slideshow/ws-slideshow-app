var View = require('famous/core/View'),
  Surface = require('famous/core/Surface'),
  Transform = require('famous/core/Transform'),
  Modifier = require('famous/core/Modifier'),
  Actions = require('../event/Actions')
  ;

// constructor
// ------------------------------------------------------------

function Nav() {
  View.apply(this, arguments);

  return this;
}

// public
// ------------------------------------------------------------

Nav.prototype = Object.create(View.prototype);
Nav.prototype.constructor = Nav;

Nav.DEFAULT_OPTIONS = {
  width: 200,
  height: 50
};

Nav.prototype.init = function () {
  addContent.call(this);
  return this;
};

// private
// ------------------------------------------------------------
addContent = function () {

  var surface = new Surface({
    size: [undefined, 50],
    content: 'NAV',
    properties: {
      backgroundColor: '#eee5B1',
      textAlign: 'center',
      color: '#FFF',
      lineHeight: '50px',
      fontSize: '13px',
      fontFamily: 'Arial'
    }
  });

  this.add(surface);


  surface.on('click', function() {
    Actions.nextSlide();
  });
}

module.exports = Nav;