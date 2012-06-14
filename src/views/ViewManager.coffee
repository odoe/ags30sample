define [
  'jquery'
  'underscore'
  'backbone'
  'views/map/MapView'
], ($, _, Backbone, MapView) ->
  ViewManager = Backbone.View.extend
    el: $ '#container'

    render: ->
      # just use dojo.require as before
      # there are a few other ways to do this
      # but the esri modules are not all AMD
      # compliant, so play it safe with dojo.require
      dojo.require "dijit.layout.ContentPane"
      dojo.require "dijit.TitlePane"
      dojo.require "esri.tasks.geometry"
      dojo.require "esri.dijit.Measurement"
      dojo.require "esri.dijit.Scalebar"

      eventManager = _.extend {}, Backbone.Events

      mv = new MapView()
      @$el.append mv.render().el
      dojo.addOnLoad =>
        esri.config.defaults.io.proxyUrl = "proxy.ashx"
        esri.config.defaults.io.alwaysUseProxy = false
        esri.config.defaults.geometryService = new esri.tasks.GeometryService "http://tasks.arcgisonline.com/ArcGIS/rest/services/Geometry/GeometryServer"
        mv.ready()
        mv.on "mapLoaded", (map) =>
          require ['views/tools/measureTool'], (MeasureView) =>
            measure = new MeasureView(eventManager)
            @$el.append measure.render(map).el
            eventManager.trigger "initMeasure"

      @
