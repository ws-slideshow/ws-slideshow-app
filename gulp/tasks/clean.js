var gulp = require('gulp'),
  config = require('../config'),
  $ = require('gulp-load-plugins')();

gulp.task('clean', function () {
  return gulp.src([
    config.tmp + '/**/*',
    config.dist + '/**/*'
  ], { read: false })
  .pipe($.clean());
});
