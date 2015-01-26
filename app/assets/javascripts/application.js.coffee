#= require jquery
#= require jquery_ujs
#= require_tree ./libs
#= require jquery.colorbox
#= require jquery.colorbox-ru
#= require jquery.inputmask
#= require bootstrapValidator.min
#= require formvalidation
#= require jquery.form


jQuery ->


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

