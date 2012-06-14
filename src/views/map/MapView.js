(function() {
  var __indexOf = Array.prototype.indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  define(['jquery', 'underscore', 'backbone', 'helpers/extentfactory'], function($, _, Backbone, extents) {
    var MapView;
    return MapView = Backbone.View.extend({
      tagName: 'div',
      id: 'map',
      initialize: function() {},
      render: function() {
        return this;
      },
      ready: function() {
        var map, orientationEvent, supportsOrientationChange, tms,
          _this = this;
        map = new esri.Map(this.id, {
          extent: extents.losAngeles()
        });
        dojo.connect(map, "onLoad", function(_map_) {
          return _this.trigger("mapLoaded", _map_);
        });
        tms = new esri.layers.ArcGISTiledMapServiceLayer("http://services.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer");
        map.addLayer(tms);
        supportsOrientationChange = __indexOf.call(window, "onorientationchange") >= 0;
        orientationEvent = supportsOrientationChange ? "orientationchange" : "resize";
        return dojo.connect(window, orientationEvent, function() {
          if (map != null) map.reposition();
          return map != null ? map.resize() : void 0;
        });
      }
    });
  });

}).call(this);
