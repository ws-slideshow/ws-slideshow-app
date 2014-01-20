angular.module('wsss.slides', [
  'wsss.error'
  'wsss.config'
])

# controller
# ------------------------------------------------------------
.controller('SlidesController',[
    'ConfigModel'
    'ErrorUtil'
    '$log'
    (
      configModel
      errorUtil
      $log
    )->

      init = ->
        $log.info "SlidesController "

      init()
])

# models
# ------------------------------------------------------------
.factory('AlbumModel', [
    '$log'
    (
      $log
    ) ->
      model =
        thumbPath: ''
        thumbPrefix: ''
        slidePath: ''
        slidePrefix: ''
  ]
)

# directives
# ------------------------------------------------------------
.directive('wssSlides', [
  '$log'
  (
    $log
  ) ->
    restrict: 'E'
    templateUrl: 'slides/slides.tpl.html'
    scope: {}
    compile: (element, attrs)->

])

.directive('wsssSlide', [
  '$log'
  (
    $log
  ) ->
    restrict: 'E'
    templateUrl: 'slides/slide.tpl.html'
    scope: {}
    compile: (element, attrs)->

])