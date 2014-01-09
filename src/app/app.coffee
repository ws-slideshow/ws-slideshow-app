angular.module('wsss.app', [
  'wsss.error'
  'wsss.config'
])

# directives
# ------------------------------------------------------------
.directive('wsSlideshow', [
  '$rootScope'
  'ConfigModel'
  '$log'
  (
    $rootScope
    ConfigModel
    $log
  ) ->
    restrict: 'E'
    template: '''
      <div />
    '''
    scope: false
    compile: (element, attrs)->
      # update ConfigModel
      ConfigModel.json = attrs.json
      ConfigModel.jsonp = attrs.jsonp
      ConfigModel.xml = attrs.xml
      ConfigModel.rootElementID = attrs.id
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
  'ConfigService'
  'ConfigModel'
  'ErrorUtil'
  '$log'
  (
    $rootScope
    $scope
    configService
    configModel
    errorUtil
    $log
  )->

    init = ->
      $log.info "AppController: json #{configModel.json} "
      # fetch config data
      configService
      .fetch()
      .then( (data)->
        $log.info "success"
      )

    init()
])