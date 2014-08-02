var gulp = require('gulp'),
  config = require('../config'),
  $ = require('gulp-load-plugins')();

gulp.task('watch', ['build', 'connect', 'serve'], function () {

  // watch for changes

  gulp.watch([
      config.src + '/*.html',
      config.tmp + '/styles/*.css',
      config.tmp + '/app/**/*.js'
  ]).on('change', function (file) {
    $.livereload().changed(file.path);
  });

  gulp.watch(config.assets + '/**', ['copy']);
  gulp.watch(config.styles + '/**/*.scss', ['styles']);
  gulp.watch(config.app + '/**/*.js', ['browserify']);
  gulp.watch(config.app + '/**/*.html', ['browserify']);
  gulp.watch('bower.json', ['wiredep']);
});
