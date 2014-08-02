var gulp = require('gulp'),
  config = require('../config'),
  karmaConfig = require('../../config/karma-conf.js'),
  karma = require('karma').server,
  pkg = require('../../package.json');


gulp.task('test-unit', ['browserify-test'], function (done) {
  // add files to config
  karmaConfig.files = [
      config.tmp + '/app/' + pkg.name + '.spec.js'
  ];

  karma.start(karmaConfig, done);
});
