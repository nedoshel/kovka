@initFilePreview = () ->
  $('#feedback_image').change ->
    w = $('img.colorbox-img').width()
    h = $('img.colorbox-img').height()
    $('img.colorbox-img').attr 'width', w
    $('img.colorbox-img').attr 'height', h
    oFReader = new FileReader
    oFReader.readAsDataURL @files[0]
    oFReader.onload = (oFREvent) ->
      $('img.colorbox-img').attr 'src', oFREvent.target.result


$(document).on 'submit', 'form.js-feedback', (e, data) ->
  e.preventDefault();

jQuery ->
  $('.colorbox').on 'click', (e) ->
    e.preventDefault()
    url = $(@).data('href') || $(@).attr('href')
    $.colorbox
      href: url
      onComplete: (e) ->
        x = $("img.colorbox-img").width() + 50
        # y = $("img.colorbox-img").height() + 450
        $(@).colorbox.resize
          width: x
          # height: y
        initValidation()
        initFilePreview()
        $('.tooltipster').each ->
          $t = $(@)
          $t.tooltipster
            content: $($t.data 'href').html()
            contentAsHTML: true
            maxWidth: 400
