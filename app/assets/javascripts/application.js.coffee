#= require jquery
#= require jquery_ujs
#= require_tree ./libs
#= require jquery.colorbox
#= require jquery.colorbox-ru
#= require jquery.inputmask
#= require jquery.fastLiveFilter


#= require jquery.validate
#= require jquery.validate.additional-methods
#= require jquery.validate.localization/messages_ru
#= require formvalidation
#= require jquery.tooltipster.min.js
#= require jquery.form

#= require feedbacks

@initSearch = () ->
  $('#search_input').fastLiveFilter '#container',
    selector: '.js-filter'
    timeout: 500
    callback: (total) ->
      filter = $("#filters li a.selected").data "filter"
      $('#container').isotope
        filter: "#{filter}:visible"
        itemSelector: ".element"

@initIsotope = () ->
  $container = $("#container")

  $container.isotope
    filter: ":visible"
    itemSelector: ".element"

  $("#filters a").click ->
    selector = $(this).attr("data-filter")
    $container.isotope
      filter: "#{selector}:visible"
      itemSelector: ".element"

    false

  $optionLinks = $("#filters li a")
  $optionLinks.click ->
    $this = $(this)
    return false  if $this.hasClass("selected")
    $optionSet = $this.parents("#filters")
    $optionSet.find(".selected").removeClass "selected"
    $this.addClass "selected"
    options = {}
    key = $optionSet.attr("data-option-key")
    value = $this.attr("data-option-value")
    value = (if value is "false" then false else value)
    options[key] = value
    if key is "layoutMode" and typeof changeLayoutMode is "function"
      changeLayoutMode $this, options
    else
      $container.isotope options
    false

jQuery ->
  initSearch()
  initIsotope()
  # $('#search_input').fastLiveFilter '#container .element',
  #   selector: '.tovname .colorbox'
