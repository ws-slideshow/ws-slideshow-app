angular.module('wsss.config', [
  'wsss.error'
  'wsss.slides'
])

#  model
# ------------------------------------------------------------
#  ConfigModel is acting as a domain model
#  to share date beetween controllers
.factory('ConfigModel', [
    '$log'
    (
      $log
    ) ->
      model =
        # default values
        rootElementID: null
        # config pathes
        json: null
        jsonp: null
        xml: null

        # data
        data: null
        hasData: ->
         model.data?
])

# service
# ------------------------------------------------------------
.factory('ConfigService', [
  '$q'
  '$http'
  'ConfigModel'
  'AlbumModel'
  'ErrorUtil'
  '$log'
  (
    $q
    $http
    configModel
    AlbumModel
    errorUtil
    $log
  )->

    deferred = $q.defer()

    fetchJSONData = (url)->
      $log.info "fetchJSONData #{url}"

      $http
      .get(url)
      .success((data)->
        configModel.data = data
        deferred.resolve data
      )
      .error((data, status, headers, config)->
        deferred.reject data
        errorUtil.show "#{data} // #{status}"
      )

      deferred.promise

    fetchJSONPData = (url)->
      $http
      .jsonp(url)
      .success((data)->
          configModel.data = data
          deferred.resolve data
        )
      .error((data, status, headers, config)->
          deferred.reject data
          errorUtil.show "#{data} // #{status}"
        )

      deferred.promise

    fetchXMLData = (url)->
      $http
      .get(url)
      .success((data)=>
          configModel.data = parseXML data
          if configModel.data?
            deferred.resolve data
          else
            message = "Unable to parse XML config file"
            errorUtil.show "#{message}"
            deferred.reject message
        )
      .error((data, status, headers, config)->
          deferred.reject data
          errorUtil.show "#{data} // #{status}"
        )

      deferred.promise

    parseXML = (data)->
     # TODO: Parse ALL Data
      parser = new DOMParser()
      xmlData = parser.parseFromString(data, "application/xml")
      # parsing albums
      albumsXML = xmlData.getElementsByTagName('album')
      albums = []
      for albumXML in albumsXML
        album = new AlbumModel()

        slidePath = albumXML.getAttribute "slidePath"
        album.slidePath = slidePath if slidePath?

        thumbPath = albumXML.getAttribute "thumbPath"
        album.thumbPath = thumbPath if thumbPath?

        albums.push album

      {
        albums
      }





    service =
      fetch: ->
        $log.info "fetch"
        if configModel.json?
          promise = fetchJSONData configModel.json
        else if configModel.jsonp?
          promise = fetchJSONPData configModel.jsonp
        else if configModel.xml?
          promise = fetchXMLData configModel.xml
        else
          promise = deferred.promise

        promise
])