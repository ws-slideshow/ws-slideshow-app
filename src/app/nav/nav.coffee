angular.module('wsss.nav', [
  # common
  'wsss.error'
  # app
  'wsss.config'
])

# controllers
# ------------------------------------------------------------
.controller('NavController',[
  '$rootScope'
  '$scope'
  'AppModel'
  'ConfigModel'
  '$log'
  (
    $rootScope
    $scope
    appModel
    configModel
    $log
  )->

    init = ->

      if appModel.hasData()
        initData()
      else
        unwatch = $scope.$watch 'appModel.data', (newValue, oldValue) ->
          # ignore call due to initialization
          if newValue isnt oldValue
            # unwatch
            unwatch()
            initData()

    initData = ->
      $scope.navHeight = "#{appModel.data.preferences.thumbSize + 10}px"

    init()
])

# directives
# ------------------------------------------------------------
.directive('wssNav', [
  '$rootScope'
  'ConfigModel'
  '$log'
  (
    $rootScope
    configModel
    $log
  ) ->
    restrict: 'E'
    templateUrl: 'nav/nav.tpl.html'
    scope: true
    controller: 'NavController'
    compile: (element, attrs)->

])

