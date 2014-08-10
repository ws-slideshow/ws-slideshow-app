var Dispatcher = require('./Dispatcher'),
 ActionConstants = require('./ActionConstants'),

  Actions = {

    nextSlide: function(data){
      Dispatcher.dispatch(ActionConstants.NEXT_SLIDE, data);
    },

    prevSlide: function(data){
      Dispatcher.dispatch(ActionConstants.PREV_SLIDE, data);
    }

  };


module.exports = Actions;