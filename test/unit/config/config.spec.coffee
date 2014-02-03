describe 'module config: ', ->

  beforeEach module('wsss.config')
  beforeEach module('wsss.test')

  describe 'ConfigModel', ->
    beforeEach inject ($injector, MockFactory) ->
      @mockFactory = MockFactory
      @model = $injector.get 'ConfigModel'

    afterEach ->
      @model = undefined

    it 'is injectable', ->
      expect(@model).to.be.ok

    it 'updates default values', ->
      @model.rootElementID = 'anyid'
      expect(@model.rootElementID).not.to.be.null
      @model.json = 'file.json'
      expect(@model.json).not.to.be.null
      @model.jsonp = 'file-p.json'
      expect(@model.jsonp).not.to.be.null
      @model.xml = 'file.xml'
      expect(@model.xml).not.to.be.null
      @model.data = {}
      expect(@model.data).not.to.be.null

    it 'has no data by default', ->
      expect(@model.hasData()).not.to.be.ok

    it 'has data', ->
      @model.data = {any:'data'}
#      expect(@model.data).to.equal 'hello'
      expect(@model.hasData()).to.be.ok

  describe 'ConfigService', ->

    beforeEach inject ($httpBackend, $injector) ->
      @httpBackend = $httpBackend
      @service = $injector.get 'ConfigService'
      @configModel = $injector.get 'ConfigModel'

    afterEach ->
      @service = undefined
      @httpBackend.verifyNoOutstandingRequest()
      @httpBackend.verifyNoOutstandingExpectation()

    it 'is injectable', ->
      expect(@service).to.be.ok

    it 'fetching JSON and adding result to model', ->
      url = '/any.json'
      mockdata =
        hello: 'world'
      @configModel.json = url
      @httpBackend.whenGET(url).respond(
        200,
        mockdata
      )
      @service.fetch().then( (data)->
        expect(data).to.deep.equal mockdata
      )
      @httpBackend.flush()

    it 'fetching JSONP data and adding result to model', ->
      url = '/any.json'
      mockdata =
        hello: 'world'
      @configModel.jsonp = url
      @httpBackend.whenJSONP(url).respond(
        200,
        mockdata
      )

      @service.fetch()
      .then( (data)->
        expect(data).to.deep.equal mockdata
      )
      @httpBackend.flush()

    it 'fetching and parsing XML data storing into model', ->
      url = '/any.xml'
      mockdata = @mockFactory.xmlData()

      @configModel.xml = url
      @httpBackend.expectGET(url).respond(
        mockdata
      )
      @service.fetch()
      .then( (data)->
        expect(data.albums.length).to.equal 2

        album = data.albums[0]
        expect(album.slidePath).to.equal "slides/album1/"
        expect(album.thumbPath).to.equal "thumbs/album1/"
      )
      @httpBackend.flush()
