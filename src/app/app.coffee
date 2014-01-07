angular.module('wsss.app', [
  'wsss.config'
])

# directives
# ------------------------------------------------------------
.directive('wsSlideshow', [
  '$rootScope'
  'ConfigModel'
  '$log'
  ($rootScope, ConfigModel, $log) ->
    restrict: 'E'
    template: '''
      <div />
    '''
    scope: false
    compile: (element, attrs)->
      # update ConfigModel
      ConfigModel.json = attrs.json
      ConfigModel.id = attrs.id
      # update template == lazy instantiating of AppController
      div = element.find 'div'
      div.attr 'ng-controller', 'AppController'
      div.attr 'class', attrs.class
])

# AppController
# ------------------------------------------------------------
.controller('AppController',[
  '$rootScope'
  '$scope'
  '$element'
  'ConfigService'
  'ConfigModel'
  '$log',
  ($rootScope, $scope, $element, ConfigService, ConfigModel, $log)->

    init = ->
      $log.info "AppController: json #{ConfigModel.json} "

    init()
])