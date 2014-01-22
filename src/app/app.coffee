angular.module('wsss.app', [
  # common
  'wsss.error'
  # app
  'wsss.config'
  'wsss.nav'
  'wsss.slides'
  'wsss.thumbs'
])

# models
# ------------------------------------------------------------

.factory('AppModel', [
  '$rootScope'
  '$log'
  (
    $rootScope
    $log
  ) ->

     # return a model object
    model =
      #
      # data
      data: null
      hasData: ->
        model.data?
      #
      # album
      currentAlbumID: 0
      #
      #slides
      currentSlideID: 0

      currentSlideURL: ->
        url = ''
        if model.hasData()
          album = model.data.albums[model.currentAlbumID]
          slide = album.slides[model.currentSlideID]
          url = "#{album.slidePath}#{slide.name}"
        url

])

# AppController
# ------------------------------------------------------------

.controller('AppController',[
  '$rootScope'
  '$scope'
  'ConfigService'
  'AppModel'
  'ErrorUtil'
  '$log'
  (
    $rootScope
    $scope
    configService
    appModel
    errorUtil
    $log
  )->

    init = ->
      $scope.appModel = appModel
      # fetch config data
      configService
      .fetch()
      .then( (data)->
        $scope.appModel.data = data
      )

    init()
])

# directives
# ------------------------------------------------------------
.directive('wsSlideshow', [
  '$rootScope'
  'AppModel'
  'ConfigModel'
  '$log'
  (
    $rootScope
    appModel
    configModel
    $log
  ) ->
    restrict: 'E'
    templateUrl: 'app.tpl.html'
    scope: {}
    controller: 'AppController'
    compile: (element, attrs)->
      # update ConfigModel
      configModel.json = attrs.json
      configModel.jsonp = attrs.jsonp
      configModel.xml = attrs.xml
      # update AppModel
      appModel.rootElementID = attrs.id
      # update template
      div = element.children(1)
      div.addClass attrs.class
])
