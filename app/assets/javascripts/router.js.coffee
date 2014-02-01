class BrewLog.Router
  constructor: (@name) ->
    @bindEvents()

  routes: {
    "fermentables:new": BrewLog.Fermentables.New
    "fermentables:edit": BrewLog.Fermentables.Edit
  }

  bindEvents: ->
    $(document).ready(@route)
    $(document).on('page:load', @route)

  route: ->
