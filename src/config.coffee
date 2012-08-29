# pass the require function your dojoConfig options
# to read more about the dojo config options, you can review
# http://dojotoolkit.org/documentation/tutorials/1.7/dojo_config/
require
  # async - set if Dojo should be loaded asycnhronously
  # jQuery will not work unless this is true
  async: true # can also be async: 1, shorthand for use in define() modules
  # parseOnLoad - will just scan your DOM for dojo elements
  parseOnLoad: true
  # set an alias for dojo/text, just
  # to make it easier to use
  aliases: [
    [ "text", "dojo/text" ]
  ]
  #
  # packages - This was tricky part
  # There is a paths element, similar to require.js,
  # but did not work for me
  # See this link for information on using Dojo 1.7 CDN with
  # third-party libraries
  # http://dojotoolkit.org/documentation/tutorials/1.7/cdn/
  packages: [
    # name to be used in require/define methods, ie- define(['jquery'], function($){});
    name: "jquery"
    # replace the root path your apps root path, or the CDN dojo will assume these
    # libraries exist in the CDN server path
    # this is only the path to a folder, not a javascript file
    location: location.pathname.replace(/\/[^/]+$/, "") + "src/libs/jquery"
    # if you want to load a javascript file when this "name" is used, define that file here
    main: "jquery-1.7.2.min"
  ,
    name: "jqueryui"
    location: location.pathname.replace(/\/[^/]+$/, "") + "src/libs/jqueryui"
    main: "jquery-ui-1.8.20.custom.min"
  ,
    name: "underscore"
    location: location.pathname.replace(/\/[^/]+$/, "") + "src/libs/underscore"
    main: "underscore-min"
  ,
    name: "backbone"
    location: location.pathname.replace(/\/[^/]+$/, "") + "src/libs/backbone"
    main: "backbone-min"
  ,
    name: "templates"
    location: location.pathname.replace(/\/[^/]+$/, "") + "templates"
  ,
    name: "views"
    location: location.pathname.replace(/\/[^/]+$/, "") + "src/views"
  ,
    name: "models"
    location: location.pathname.replace(/\/[^/]+$/, "") + "src/models"
  ,
    name: "helpers"
    location: location.pathname.replace(/\/[^/]+$/, "") + "src/helpers"
  ,
    name: "app"
    location: location.pathname.replace(/\/[^/]+$/, "") + "src"
    main: "app"
   ]
# If using jQuery, let the AMD loader, in this case, Dojo 1.7 know
# you are loading jQuery as an AMD module
# This is a safety net,since so many other
# utilities out there use jQuery
# I have not tested this with Zeptos.js yet
# see this link for more information
# https://github.com/amdjs/amdjs-api/wiki/jQuery-and-AMD
define.amd.jQuery = true
require ['jquery', 'app'], ($, App) ->
  # Make sure jQuery is ready to roll.
  # This is usually important if you have
  # data-* attributes that need to be parsed
  # by a jQuery ui extension.
  $(document).ready ->
    App.initialize()
