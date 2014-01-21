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
.constant 'AppModelEvents',
  CURRENT_ALBUM_ID_CHANGED: 'currentAlbumIDChanged'
  CURRENT_SLIDE_ID_CHANGED: 'currentSlideIDChanged'


.factory('AppModel', [
  '$rootScope'
  'AppModelEvents'
  '$log'
  (
    $rootScope
    AppModelEvents
    $log
  ) ->
    _currentAlbumID = 0
    _currentSlideID = 0

    # return a model object
    model =
      #
      # data
      data: null
      hasData: ->
        model.data?
      #
      # album
      setCurrentAlbumID: (id, silence=false)->
        if _currentAlbumID isnt id
          _currentAlbumID = id
          $rootScope.$broadcast AppModelEvents.CURRENT_ALBUM_ID_CHANGED, _currentAlbumID unless silence

      getCurrentAlbumID: ->
        _currentAlbumID
      #
      #slides
      setCurrentSlideID: (id, silence=false)->
        if _currentSlideID isnt id
          _currentSlideID = id
          $rootScope.$broadcast AppModelEvents.CURRENT_SLIDE_ID_CHANGED, _currentSlideID unless silence

      getCurrentSlideID: ->
        _currentSlideID

      currentSlideURL: ->
        if model.hasData()
          album = model.data.albums[_currentAlbumID]
          slide = album.slides[_currentSlideID]
          return "#{album.slidePath}#{slide.name}"
        else
          return null

])

# AppController
# ------------------------------------------------------------

.constant 'AppEvents',
  CONFIG_LOADED: 'configLoaded'

.controller('AppController',[
  '$rootScope'
  '$scope'
  'ConfigService'
  'ConfigModel'
  'AppEvents'
  'ErrorUtil'
  '$log'
  (
    $rootScope
    $scope
    configService
    configModel
    AppEvents
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
          $rootScope.$broadcast AppEvents.CONFIG_LOADED
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
      div =  element.children(1)
      div.addClass attrs.class
])
