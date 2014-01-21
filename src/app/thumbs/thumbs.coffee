angular.module('wsss.thumbs', [
  'wsss.error'
  'wsss.config'
  'wsss.templates'
])

# controllers
# ------------------------------------------------------------
.controller('ThumbsBarController',[
  '$scope'
  'AppModel'
  'ConfigModel'
  'AppEvents'
  'ErrorUtil'
  '$log'
  (
    $scope
    appModel
    configModel
    AppEvents
    errorUtil
    $log
  )->

    init = ->
      $log.info "ThumbsBarController "

      if configModel.hasData()
        initData()
      else
        $scope.$on(AppEvents.CONFIG_LOADED, ->
          $log.info "LISTEN configLoaded "
          initData()
        )

    initData = ->
      $log.info appModel.data
      $scope.barHide = appModel.data.preferences.hideBar
      $scope.barHide = false
      $scope.barHeight = "#{appModel.data.preferences.thumbSize + 10}px"

    init()
])

.controller('ThumbsOverviewController',[
    '$scope'
    'ConfigModel'
    'ErrorUtil'
    '$log'
    (
      $scope
      configModel
      errorUtil
      $log
    )->

      init = ->
        $log.info "ThumbsOverviewController "


      init()
  ])

# directives
# ------------------------------------------------------------
.directive('wssThumbsBar', [
  'AppModel'
  '$log'
  (
    appModel
    $log
  ) ->
    restrict: 'E'
    templateUrl: 'thumbs/thumbsbar.tpl.html'
    scope: true
    controller: 'ThumbsBarController'
    compile: (element, attrs)->
      container =  element.children(1)
#      $log.error "HTUMB:::"
      $log.info appModel.data
#      container.css 'height', "#{appModel.data.preferences.thumbSize}px"

])

.directive('wssThumbsOverview', [
    'ConfigModel'
    '$log'
  (
    configModel
    $log
  ) ->
    restrict: 'E'
    templateUrl: 'thumbs/thumbsoverview.tpl.html'
    scope: {}
    controller: 'ThumbsOverviewController'
    compile: (element, attrs)->


])
