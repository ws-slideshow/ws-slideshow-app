describe 'module config: ', ->

  beforeEach module('wsss.config')

  describe 'ConfigModel', ->
    beforeEach inject ($injector) ->
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
      result =
        hello: 'world'
      @configModel.json = url
      @httpBackend.whenGET(url).respond(
        200,
        result
      )
      @service.fetch()
      @httpBackend.flush()
      expect(@configModel.data).to.deep.equal result

    it 'fetching JSONP data and adding result to model', ->
      url = '/any.json'
      result =
        hello: 'world'
      @configModel.jsonp = url
      @httpBackend.whenJSONP(url).respond(
        200,
        result
      )
      @service.fetch()
      @httpBackend.flush()
      expect(@configModel.data).to.deep.equal result

    it 'fetching and parsing XML data storing into model', ->
      url = '/any.xml'
      data = '''
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <slideshow>
        <albums>
          <album slidePath="album1/slides/amrum/" thumbPath="album1/thumbs/amrum/">
          </album>
        </slideshow>
      '''

      @configModel.xml = url
      @httpBackend.expectGET(url).respond(
        data
      )
      @service.fetch()
      @httpBackend.flush()
      expect(@configModel.data.albums.length).to.equal 1

      album = @configModel.data.albums[0]
      expect(album.slidePath).to.equal "album1/slides/amrum/"
      expect(album.thumbPath).to.equal "album1/thumbs/amrum/"
