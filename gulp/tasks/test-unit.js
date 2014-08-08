var gulp = require('gulp'),
  config = require('../config'),
  karmaConfig = require('../../config/karma-conf.js'),
  karma = require('karma').server,
  pkg = require('../../package.json');


//gulp.task('test-unit', ['browserify-test'], function (done) {
gulp.task('test-unit', function (done) {
  karma.start(karmaConfig, done);
});
