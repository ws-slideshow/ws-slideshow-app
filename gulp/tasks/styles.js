var gulp = require('gulp'),
  config = require('../config'),
  pkg = require('../../package.json'),
  $ = require('gulp-load-plugins')();

gulp.task('styles', function () {
  return gulp.src(config.styles + '/' + pkg.name + '.scss')
    .pipe($.rubySass({
      style: 'expanded',
      precision: 10
    }))
    .pipe($.autoprefixer('last 1 version'))
    .pipe(gulp.dest(config.tmp + '/styles/'))
    .pipe($.size());
});