angular.module('wsss.config', [
  'wsss.error'
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
  'ErrorUtil'
  '$log'
  (
    $q
    $http
    configModel
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
      $log.info "fetchJSONPData #{url}"

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
      $log.info "fetchXMLData #{url}"

      $http
      .get(url)
      .success((data)->
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
     # TODO: Parse XML Data


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