#= require jquery
#= require jquery_ujs
#= require_tree ./libs
#= require jquery.colorbox
#= require jquery.colorbox-ru
#= require bootstrapValidator.min
#= require formvalidation


jQuery ->


  $('.colorbox').on 'click', (e) ->
    e.preventDefault()
    url = $(@).attr 'href'
    $.colorbox
      href: url
      onComplete: (e) ->
        initValidation()


