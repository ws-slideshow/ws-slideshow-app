var EventHandler = require('famous/core/EventHandler')
  outputEvent = new EventHandler(),

  Dispatcher = {

    register: function(listener){
      EventHandler.setOutputHandler(listener, outputEvent)
    },

    dispatch: function(type, data){
      outputEvent.emit(type, data);
    }

  };

module.exports = Dispatcher;
