class BrewLog.Router
  constructor: (@name) ->

  routes: {
    "fermentables:new": BrewLog.Fermentables.Form
    "fermentables:create": BrewLog.Fermentables.Form
    "fermentables:edit": BrewLog.Fermentables.Form
    "fermentables:update": BrewLog.Fermentables.Form
  }

  start: ->
    @bindEvents()

  bindEvents: ->
    $(document).ready(@route)
    $(document).on('page:load', @route)
    $(document).on('page:fetch', @dispose)

  route: =>
    body = $("body")
    controller = body.data("controller")
    action = body.data("action")

    routeAddress = @routes["#{controller}:#{action}"]

    if routeAddress
      @routeClass = new routeAddress
      @routeClass.run()

  dispose: =>
    if @routeClass
      @routeClass.dispose()
      delete @routeClass
