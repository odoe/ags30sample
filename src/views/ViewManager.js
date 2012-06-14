(function() {

  define(['jquery', 'underscore', 'backbone', 'views/map/MapView'], function($, _, Backbone, MapView) {
    var ViewManager;
    return ViewManager = Backbone.View.extend({
      el: $('#container'),
      render: function() {
        var eventManager, mv,
          _this = this;
        dojo.require("dijit.layout.ContentPane");
        dojo.require("dijit.TitlePane");
        dojo.require("esri.tasks.geometry");
        dojo.require("esri.dijit.Measurement");
        dojo.require("esri.dijit.Scalebar");
        eventManager = _.extend({}, Backbone.Events);
        mv = new MapView();
        this.$el.append(mv.render().el);
        dojo.addOnLoad(function() {
          esri.config.defaults.io.proxyUrl = "proxy.ashx";
          esri.config.defaults.io.alwaysUseProxy = false;
          esri.config.defaults.geometryService = new esri.tasks.GeometryService("http://tasks.arcgisonline.com/ArcGIS/rest/services/Geometry/GeometryServer");
          mv.ready();
          return mv.on("mapLoaded", function(map) {
            return require(['views/tools/measureTool'], function(MeasureView) {
              var measure;
              measure = new MeasureView(eventManager);
              _this.$el.append(measure.render(map).el);
              return eventManager.trigger("initMeasure");
            });
          });
        });
        return this;
      }
    });
  });

}).call(this);
