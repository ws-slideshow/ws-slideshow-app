var gulp = require('gulp'),
  config = require('../config');

gulp.task('wiredep', function () {
  var wiredep = require('wiredep').stream;

  gulp.src(config.styles + '/*.scss')
    .pipe(wiredep({
      directory: config.vendor
    }))
    .pipe(gulp.dest(config.styles));

  gulp.src(config.src + '/index.html')
    .pipe(wiredep({
      directory: config.vendor,
      exclude: []
    }))
    .pipe(gulp.dest(config.src));
});