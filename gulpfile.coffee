gulp = require 'gulp'
gutil = require 'gulp-util'
clean = require 'gulp-clean'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
uglify = require 'gulp-uglify'
sass = require 'gulp-ruby-sass'
minifyCSS = require 'gulp-minify-css'

pkg = require './package.json'

runRelease = gulp.env.release

pathes =
  src: './src'
  dist: './dist'
  vendor: './vendor'
  test: './test'
  assets: './assets'


# clean
# ------------------------------------------------------------
gulp.task('clean', ->
  gulp.src('./dist/**/*',
    read: false
  )
  .pipe(clean())
)

# js
# ------------------------------------------------------------
gulp.task('js', ->
  gulp.src([
    "#{pathes.src}/common/**/**.coffee",
    "#{pathes.src}/app/slides/**/**.coffee",
    "#{pathes.src}/app/thumbs/**/**.coffee",
    "#{pathes.src}/app/config/**/**.coffee",
    "#{pathes.src}/app/app.coffee",
    "#{pathes.src}/app/#{pkg.name}.coffee"
  ])
  .pipe(coffee(
    bare: true
    join: true
  ))
  .pipe(concat("ws-slideshow.js"))
  .pipe(
    if runRelease then uglify() else gutil.noop()
  )
  .pipe(gulp.dest(
    "#{pathes.dist}/js"
  ))
)

# styles
# ------------------------------------------------------------
gulp.task('styles', ->
  gulp.src(
    "#{pathes.src}/sass/#{pkg.name}.scss"
  )
  .pipe(sass(
    unixNewlines: true
#    sourcemap: !runRelease
    lineNumbers: !runRelease
    debugInfo: !runRelease
  ))
  .pipe(
    if runRelease then minifyCSS() else gutil.noop()
  )
  .pipe(gulp.dest(
    "#{pathes.dist}/styles"
  ))
)

# assets
# ------------------------------------------------------------

gulp.task('assets', ->
  # just copy assets
  gulp.src(
    "#{pathes.assets}/**"
  )
  .pipe(gulp.dest(
      "#{pathes.dist}/assets"
    ))
)

# watch
# Note: in (not release) debug mode only
# ------------------------------------------------------------
unless runRelease
  gulp.watch("#{pathes.src}/common/**/**.coffee", ->
    gulp.run(
      'js'
    )
  )

# livereload
# ------------------------------------------------------------
# TODO: add task

# HTML replace
# ------------------------------------------------------------
# TODO: add task to replace place holder

# default
# ------------------------------------------------------------
gulp.task('default', ->
  gulp.run(
    'clean'
    'js'
    'styles'
    'assets'
  )
)