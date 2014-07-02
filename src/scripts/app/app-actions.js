var AppConstants = require('./app-constants'),
 AppActions = {

  nextSlide: function() {
    this.dispatch(AppConstants.NEXT_SLIDE);
  },

  prevSlide: function() {
    this.dispatch(AppConstants.PREV_SLIDE);
  },

  loadData: function(path) {
    this.dispatch(AppConstants.LOAD_DATA, path);
  }

};

module.exports = AppActions;