define [
  'jquery'
  'underscore'
  'backbone'
  'helpers/extentfactory'
], ($, _, Backbone, extents) ->
  MapView = Backbone.View.extend
    tagName: 'div'
    id: 'map'
    initialize: ->

    render: ->
      @

    ready: ->
      map = new esri.Map @.id,
        extent: extents.losAngeles()


      dojo.connect map, "onLoad", (_map_) =>
        @trigger "mapLoaded", _map_

      tms = new esri.layers.ArcGISTiledMapServiceLayer "http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer"
      map.addLayer tms

      # This handles how the map should resize or rotate on mobile devices
      supportsOrientationChange = "onorientationchange" in window
      orientationEvent = if supportsOrientationChange then "orientationchange" else "resize"
      dojo.connect window, orientationEvent, ->
        map?.reposition()
        map?.resize()
