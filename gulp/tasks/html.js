var gulp = require('gulp'),
  config = require('../config'),
  $ = require('gulp-load-plugins')(),
  pkg = require('../../package.json');

gulp.task('html', ['styles', 'scripts'], function () {
  var jsFilter = $.filter('**/*.js');
  var cssFilter = $.filter('**/*.css');

  return gulp.src(config.src + '/index.html')
    .pipe($.replace(/__version__/g, pkg.version))
    .pipe($.useref.assets({searchPath: '{' + config.tmp + ',' + config.src + '}'}))
    .pipe(jsFilter)
    .pipe($.uglify())
    .pipe(jsFilter.restore())
    .pipe(cssFilter)
    .pipe($.csso())
    .pipe(cssFilter.restore())
    .pipe($.useref.restore())
    .pipe($.useref())
    .pipe(gulp.dest(config.dist))
    .pipe($.size());
});