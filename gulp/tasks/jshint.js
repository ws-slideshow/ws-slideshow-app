var gulp = require('gulp'),
  config = require('../config'),
  $ = require('gulp-load-plugins')();

gulp.task('jshint', function () {
  return gulp.src([
      config.app + '/**/*.js',
    './Gulpfile.js'
  ])
    .pipe($.jshint())
    .pipe($.jshint.reporter(
      require('jshint-stylish')
    ))
});