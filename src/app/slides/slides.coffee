angular.module('wsss.slides', [
  'wsss.error'
  'wsss.config'
])

# controller
# ------------------------------------------------------------
.controller('SlidesController',[
    '$scope'
    'ConfigModel'
    'AppModelEvents'
    'AppEvents'
    'AppModel'
    'ErrorUtil'
    '$log'
    (
      $scope
      configModel
      AppModelEvents
      AppEvents
      appModel
      errorUtil
      $log
    ) ->

      init = ->
        $log.info "SlidesController::init"
        $scope.$on AppModelEvents.CURRENT_ALBUM_ID_CHANGED, (event, id) ->
          changeSlideHandler()

        $scope.$on AppModelEvents.CURRENT_SLIDE_ID_CHANGED, (event, id) ->
          changeSlideHandler()

        if configModel.hasData()
          changeSlideHandler()
        else
          $scope.$on(AppEvents.CONFIG_LOADED, ->
            changeSlideHandler()
          )

      changeSlideHandler = ->
        $log.info "SlidesController::changeSlideHandler #{appModel.currentSlideURL()}"


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
  '$log'
  (
    $log
  ) ->
    restrict: 'E'
    templateUrl: 'slides/slides.tpl.html'
    scope: {}
    controller: 'SlidesController'
    compile: (element, attrs)->

])