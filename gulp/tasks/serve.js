var gulp = require('gulp'),
  config = require('../config');

gulp.task('serve', ['connect', 'styles'], function () {
  require('opn')(config.url + ':' + config.port);
});