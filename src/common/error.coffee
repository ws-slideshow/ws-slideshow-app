angular.module('wsss.error', [

])

.factory('ErrorUtil', [
    '$window'
    '$log'
    (
      $window
      $log
    )->

      toAlert = (message)->
        $window.alert "ERROR: #{message}"

      toConsole = (message)->
        $log.error message

      util =
        show: (message)->
          toAlert message
          toConsole message
  ])