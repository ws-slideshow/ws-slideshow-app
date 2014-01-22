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
  'ErrorUtil'
  '$log'
  (
    $scope
    appModel
    configModel
    errorUtil
    $log
  )->

    init = ->

      if appModel.hasData()
        initConfigData()
      else
        unwatch = $scope.$watch 'appModel.data', (newValue, oldValue) ->
          # ignore call due to initialization
          if newValue isnt oldValue
            # unwatch
            unwatch()
            initConfigData()


    initConfigData = ->
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
#        $log.info "ThumbsOverviewController "


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
    scope: true
    controller: 'ThumbsOverviewController'
    compile: (element, attrs)->


])
