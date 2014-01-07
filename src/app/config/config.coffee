angular.module('wsss.config', [

])

#  model
# ------------------------------------------------------------
#  ConfigModel is acting as a domain model
#  to share date beetween controllers
.service('ConfigModel', [
    '$log'
    ($log) ->
      # default values
      # config pathes
      json = null
      jsonp = null
      xml = null

      getConfigURL = ->
        if json?
          url = json
        else if jsonp?
          url = jsonp
        else if xml?
          url = xml
        else
          url = undefined
        url



  ])

# service
# ------------------------------------------------------------
.factory('ConfigService', [
  '$http'
  'ConfigModel'
  '$log'
  ($http, ConfigModel, $log)->

    #TODO: fetch data
    fetch = ->

    {
      fetch
    }
])