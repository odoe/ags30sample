(function() {

  define(['http://serverapi.arcgisonline.com/jsapi/arcgis/?v=3.0'], function(obj) {
    return {
      load: function() {
        console.log("esri loader", obj);
        return obj;
      }
    };
  });

}).call(this);
