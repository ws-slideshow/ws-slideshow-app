var gulp = require('gulp'),
  config = require('../config'),
  $ = require('gulp-load-plugins')(),
  pkg = require('../../package.json');

gulp.task('scripts', function () {
  return gulp.src([
      config.scripts + '/main.js'
  ])
    .pipe($.jshint())
    .pipe($.jshint.reporter(
      require('jshint-stylish')
    ))
    .pipe($.concat(pkg.name + '.js'))
    .pipe(gulp.dest(config.tmp + '/scripts'))
    .pipe($.size())
});