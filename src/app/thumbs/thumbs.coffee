angular.module('wsss.thumbs', [
  'wsss.error'
  'wsss.config'
  'wsss.templates'
])

# controllers
# ------------------------------------------------------------
.controller('ThumbsBarController',[
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
      $log.info "ThumbsBarController "

      if configModel.hasData()
        initData()
      else
        $scope.$on('configLoaded', ->
          $log.info "LISTEN configLoaded "
          initData()
        )

    initData = ->
      $log.info configModel.data
      $scope.hideBar = configModel.data.preferences.hideBar
      $scope.hideBar = false

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
  '$log'
  (
    $log
  ) ->
    restrict: 'E'
    templateUrl: 'thumbs/thumbsbar.tpl.html'
    scope: true
    controller: 'ThumbsBarController'
    compile: (element, attrs)->

])

.directive('wssThumbsOverview', [
  '$log'
  (
    $log
  ) ->
    restrict: 'E'
    templateUrl: 'thumbs/thumbsoverview.tpl.html'
    scope: {}
    controller: 'ThumbsOverviewController'
    compile: (element, attrs)->

])
