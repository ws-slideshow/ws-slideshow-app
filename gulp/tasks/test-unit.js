var gulp = require('gulp'),
  config = require('../config'),
  karmaConfig = require('../../test/karma-conf.js'),
  karma = require('karma').server,
  pkg = require('../../package.json');


gulp.task('test-unit', function (done) {
  // add files to config
  karmaConfig.files = [
      config.tmp + '/scripts/' + pkg.name + '.spec.js',
      config.test + "/unit/**/*.js"
  ];

  karma.start(karmaConfig, done);
});
