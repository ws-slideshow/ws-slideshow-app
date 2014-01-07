describe 'module config: ', ->

  beforeEach module('wsss.config')

  describe 'ConfigService', ->

    beforeEach inject ($injector) ->
      @service = $injector.get 'ConfigService'

    afterEach ->
      @service = undefined

    it 'is injectable', ->
      expect(@service).to.be.ok