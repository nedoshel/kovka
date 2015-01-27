#= require jquery
#= require jquery_ujs
#= require_tree ./libs
#= require jquery.colorbox
#= require jquery.colorbox-ru
#= require jquery.inputmask
#= require jquery.fastLiveFilter
#= require bootstrapValidator.min
#= require formvalidation
#= require jquery.form

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


  $('.colorbox').on 'click', (e) ->
    e.preventDefault()
    url = $(@).attr 'href'
    $.colorbox
      href: url
      onComplete: (e) ->
        x = $("img.colorbox-img").width() + 50
        # y = $("img.colorbox-img").height() + 450
        $(@).colorbox.resize
          width: x
          # height: y
        initValidation()



$(document).on 'ajax:success', 'form.js-feedback', (e, data) ->
  $('#cboxLoadedContent').html data
  $.colorbox.resize
    height: '150px'
  # $.colorbox.close()

