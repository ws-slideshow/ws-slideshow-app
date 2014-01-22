angular.module('wsss.slides', [
  'wsss.error'
  'wsss.config'
])

# controller
# ------------------------------------------------------------
.controller('SlidesController',[
    '$scope'
    '$element'
    '$attrs'
    '$transclude'
    'AppModel'
    'ErrorUtil'
    '$log'
    (
      $scope
      $element
      $attrs
      $transclude
      appModel
      errorUtil
      $log
    ) ->

      init = ->
        $log.info "SlidesController::init"

      init()
])

# models
# ------------------------------------------------------------
.factory('AlbumModel', [
    '$log'
    (
      $log
    ) ->
      class AlbumModel
        @thumbPath: ''
        @thumbPrefix: ''
        @slidePath: ''
        @slidePrefix: ''
  ]
)

# directives
# ------------------------------------------------------------
.directive('wssSlides', [
    'AppModel'
    '$log'
  (
    appModel
    $log
  ) ->
    restrict: 'E'
    templateUrl: 'slides/slides.tpl.html'
    scope: true
    controller: 'SlidesController'
    compile: (element, attrs, transclude)->
      $log.info "wssSlides::compile"

      postLink = (scope, element, attrs, controller)->
        $log.info "wssSlides::link"
        scope.$watch 'appModel.currentAlbumID', (newValue, oldValue) ->
          # ignore call due to initialization
          if newValue isnt oldValue
            changeSlideHandler()

        scope.$watch 'appModel.currentSlideID', (newValue, oldValue) ->
          # ignore call due to initialization
          if newValue isnt oldValue
            changeSlideHandler()

        if appModel.hasData()
          changeSlideHandler()
        else
          unwatch = scope.$watch 'appModel.data', (newValue, oldValue) ->
            # ignore call due to initialization
            if newValue isnt oldValue
              # unwatch
              unwatch()
              changeSlideHandler()

        changeSlideHandler = ->
          $log.info "wssSlides::changeSlideHandler #{appModel.currentSlideURL()}"


])