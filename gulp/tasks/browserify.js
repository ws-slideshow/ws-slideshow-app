var gulp = require('gulp'),
  config = require('../config'),
  $ = require('gulp-load-plugins')(),
  pkg = require('../../package.json');

gulp.task('browserify', function () {
  return gulp.src(config.app + '/boot.js')
    .pipe($.browserify({
      basedir: config.app,
      transform: [
        'debowerify',
        'deamdify'
      ]
    }))
    .pipe($.rename(pkg.name + '.js'))
    .pipe(gulp.dest(config.tmp + '/scripts'))
    .pipe($.size())
});