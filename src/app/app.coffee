angular.module('wsss.app', [
  # common
  'wsss.error'
  # app
  'wsss.config'
  'wsss.slides'
  'wsss.thumbs'
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
      <div
        class="wsss-app-container"
        ng-controller="AppController"
        >
        <div
          class="wsss-slides-container"
          ng-controller="SlidesController"
          >
        slides
        </div>
        <div
          class="wsss-thumbs-container"
          ng-controller="ThumbsController"
        >
        thumbs
        </div>
      </div>
    '''
    scope: true
    compile: (element, attrs)->
      # update ConfigModel
      ConfigModel.json = attrs.json
      ConfigModel.jsonp = attrs.jsonp
      ConfigModel.xml = attrs.xml
      ConfigModel.rootElementID = attrs.id
      # update template
      div =  element.children(1)
      div.addClass attrs.class
      div.addClass 'halligalli'
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