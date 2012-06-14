({
  appDir       : "../",
  baseUrl      : "./",
  dir          : "../js",
  paths        : {
    jquery     : 'libs/jquery/jquery-1.7.2.min',
    jqueryui   : 'libs/jqueryui/jquery-ui-1.8.20.custom.min',
    underscore : 'libs/underscore/underscore-min',
    backbone   : 'libs/backbone/backbone-min',
  },

  optimize : "uglify",
  modules  : [
    {
      name: "config"
    }
  ],

  inlineText          : true,
  fileExclusionRegExp : /\.(coffee|coffee~|js~|swp)/
})
