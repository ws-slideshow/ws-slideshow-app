var Reflux = require('reflux'),

  actions = {
    nextSlide: Reflux.createAction(),
    prevSlide: Reflux.createAction()
  };

module.exports = actions;