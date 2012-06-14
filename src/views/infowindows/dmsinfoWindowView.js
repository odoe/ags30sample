(function() {

  define(['jquery', 'underscore', 'backbone', 'text!templates/infowindows/dmsinfoWindow.html'], function($, _, Backbone, DmsInfoTemplate) {
    var dmsinfoView;
    return dmsinfoView = Backbone.View.extend({
      tagName: 'div',
      initialize: function(fields) {
        this.fields = fields;
      },
      render: function() {
        var template;
        template = _.template(DmsInfoTemplate, {
          fields: this.fields
        });
        this.$el.html(template);
        return this;
      }
    });
  });

}).call(this);
