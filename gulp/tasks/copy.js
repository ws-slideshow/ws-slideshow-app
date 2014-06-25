var gulp = require('gulp'),
  config = require('../config');

gulp.task('copy', function () {
  return gulp.src([
      config.assets + '/**'
    ])
    .pipe(gulp.dest(config.dist + '/assets'));
});