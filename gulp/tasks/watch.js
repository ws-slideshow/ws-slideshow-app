var gulp = require('gulp'),
  config = require('../config'),
  $ = require('gulp-load-plugins')();

gulp.task('watch', ['setWatch', 'connect', 'serve'], function () {

  var server = $.livereload();

  // watch for changes

  gulp.watch([
      config.src + '/*.html',
      config.tmp + '/styles/**/*.css',
      config.scripts + '/**/*.js'
  ]).on('change', function (file) {
    server.changed(file.path);
  });

  gulp.watch(config.assets + '/**', ['copy']);
  gulp.watch(config.styles + '/**/*.scss', ['styles']);
  gulp.watch(config.scripts + '/**/*.js', ['scripts']);
  gulp.watch('bower.json', ['wiredep']);
});
