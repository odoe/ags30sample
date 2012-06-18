(function() {

  require({
    async: true,
    parseOnLoad: true,
    aliases: [["text", "dojo/text"]],
    packages: [
      {
        name: "jquery",
        location: location.pathname.replace(/\/[^/]+$/, "") + "src/libs/jquery",
        main: "jquery-1.7.2.min"
      }, {
        name: "jqueryui",
        location: location.pathname.replace(/\/[^/]+$/, "") + "src/libs/jqueryui",
        main: "jquery-ui-1.8.20.custom.min"
      }, {
        name: "underscore",
        location: location.pathname.replace(/\/[^/]+$/, "") + "src/libs/underscore",
        main: "underscore-min"
      }, {
        name: "backbone",
        location: location.pathname.replace(/\/[^/]+$/, "") + "src/libs/backbone",
        main: "backbone-min"
      }, {
        name: "templates",
        location: location.pathname.replace(/\/[^/]+$/, "") + "templates"
      }, {
        name: "views",
        location: location.pathname.replace(/\/[^/]+$/, "") + "src/views"
      }, {
        name: "models",
        location: location.pathname.replace(/\/[^/]+$/, "") + "src/models"
      }, {
        name: "helpers",
        location: location.pathname.replace(/\/[^/]+$/, "") + "src/helpers"
      }, {
        name: "app",
        location: location.pathname.replace(/\/[^/]+$/, "") + "src",
        main: "app"
      }
    ]
  });

  define.amd.jQuery = true;

  require(['app'], function(App) {
    return App.initialize();
  });

}).call(this);
