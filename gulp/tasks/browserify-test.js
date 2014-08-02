var gulp = require('gulp'),
  config = require('../config'),
  $ = require('gulp-load-plugins')(),
  pkg = require('../../package.json');

gulp.task('browserify-test', function () {
  return gulp.src(config.app + '/**/*.spec.js')
    .pipe($.browserify({
      basedir: config.app
    }))
    .pipe($.rename(pkg.name + '.spec.js'))
    .pipe(gulp.dest(config.tmp + '/app'))
    .pipe($.size())
});