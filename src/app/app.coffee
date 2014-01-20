angular.module('wsss.app', [
  # common
  'wsss.error'
  # app
  'wsss.config'
  'wsss.slides'
  'wsss.thumbs'
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
          $log.info "AppController -> init -> fetch: success"
          $rootScope.$broadcast "configLoaded"
        )

    init()
])

# directives
# ------------------------------------------------------------
.directive('wsSlideshow', [
  '$rootScope'
  'ConfigModel'
  '$log'
  (
    $rootScope
    configModel
    $log
  ) ->
    restrict: 'E'
    template: '''
      <div
        class="wsss-app-container"
        >
        <wss-slides></wss-slides>
        <wss-thumbs-overview ng-hide="hideThumbsOverview"></wss-thumbs-overview>
        <wss-thumbs-bar ng-hide="hideBar"></wss-thumbs-bar>
      </div>
    '''
    scope: {}
    controller: 'AppController'
    compile: (element, attrs)->
      # update ConfigModel
      configModel.json = attrs.json
      configModel.jsonp = attrs.jsonp
      configModel.xml = attrs.xml
      configModel.rootElementID = attrs.id
      # update template
      div =  element.children(1)
      div.addClass attrs.class
])
