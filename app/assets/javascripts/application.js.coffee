#= require jquery
#= require jquery_ujs
#= require_tree ./libs
#= require jquery.colorbox
#= require jquery.colorbox-ru
#= require jquery.inputmask
#= require bootstrapValidator.min
#= require formvalidation


jQuery ->


  $('.colorbox').on 'click', (e) ->
    e.preventDefault()
    url = $(@).attr 'href'
    $.colorbox
      href: url
      onComplete: (e) ->
        x = $("img.colorbox-img").width() + 50
        # y = jQuery("div.lightbox-stack div.media-gallery-item div.gallery-thumb-outer div.gallery-thumb-inner a img").height()
        jQuery(this).colorbox.resize
          width: x
          # height: y
        initValidation()


