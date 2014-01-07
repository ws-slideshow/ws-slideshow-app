angular.module('wsss.app', [
  'wsss.config'
])


# AppController
# ------------------------------------------------------------
.controller('AppController',[
  '$log',
  'ConfigService'
  ($log)->

    init = ->
      $log.info("app #{Math.random()} ")


    init()
])