(function() {

  define(['jquery', 'underscore', 'backbone', 'dojo/text!templates/MeasureTool.html', 'jqueryui'], function($, _, Backbone, MeasureTemplate) {
    var MeasureView;
    return MeasureView = Backbone.View.extend({
      tagName: "div",
      id: 'measure',
      initialize: function(eventManager) {
        this.eventManager = eventManager;
      },
      render: function(map) {
        var content,
          _this = this;
        this.map = map;
        content = _.template(MeasureTemplate, "");
        this.$el.html(content);
        this.eventManager.bind("initMeasure", function() {
          var measurement;
          measurement = new esri.dijit.Measurement({
            map: _this.map
          }, dojo.byId("measurementDiv"));
          measurement.startup();
          return $("#measure").accordion({
            collapsible: true,
            active: false
          });
        });
        return this;
      }
    });
  });

}).call(this);
