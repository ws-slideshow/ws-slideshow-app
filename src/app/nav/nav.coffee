angular.module('wsss.nav', [
  # common
  'wsss.error'
  # app
  'wsss.config'
])

.constant('NAV_CONFIG',
  HEIGHT_OFFSET: 10
)

# controllers
# ------------------------------------------------------------
.controller('NavController',[
  '$rootScope'
  '$scope'
  'AppModel'
  'ConfigModel'
  'NAV_CONFIG'
  '$log'
  (
    $rootScope
    $scope
    appModel
    configModel
    NAV_CONFIG
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
      $scope.navHeight = "#{appModel.getPreferences().iconHeight + NAV_CONFIG.HEIGHT_OFFSET}px"

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

