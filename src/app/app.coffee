angular.module('wsss.app')

# AppController
# ------------------------------------------------------------
.controller 'AppController',[
  '$log',
  ($log)->

    init = ->
      $log.info("app #{Math.random()} ")


    init()
]