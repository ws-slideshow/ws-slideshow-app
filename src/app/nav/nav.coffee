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
  'AppEvents'
  'AppModel'
  'ConfigModel'
  '$log'
  (
    $rootScope
    $scope
    AppEvents
    appModel
    configModel
    $log
  )->

    init = ->
      $log.info "NavController::init "

      if configModel.hasData()
        initData()
      else
        $scope.$on(AppEvents.CONFIG_LOADED, ->
          initData()
        )

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
    scope: {}
    controller: 'NavController'
    compile: (element, attrs)->

])

