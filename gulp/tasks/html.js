var gulp = require('gulp'),
  config = require('../config'),
  $ = require('gulp-load-plugins')(),
  pkg = require('../../package.json');

//gulp.task('html', ['styles', 'jshint', 'browserify'], function () {
gulp.task('html', ['styles', 'browserify'], function () {
  var jsFilter = $.filter('**/*.js');
  var cssFilter = $.filter('**/*.css');

  var assets = $.useref.assets({searchPath: '{' + config.tmp + ',' + config.src + '}'});

  return gulp.src(config.src + '/index.html')
    .pipe($.replace(/__version__/g, pkg.version))
    .pipe(assets)
    .pipe($.if('*.js',
      $.uglify({
        mangle: {
          beautify: false
        }
      })))
    .pipe($.if('*.css', $.csso()))
    .pipe(assets.restore())
    .pipe($.useref())
    .pipe(gulp.dest(config.dist))
    .pipe($.size());
});