#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require select2
#= require bootstrap-wysihtml5
#= require_self


jQuery ->
  data1 = [
    {
      id: "дешевые"
      text: "дешевые"
    }
    {
      id: "ворота"
      text: "ворота"
    }
    {
      id: "эскизы"
      text: "эскизы"
    }
  ]
  $(".js-select2-tags").select2
    tags: true
    tokenSeparators: [","]
    createSearchChoice :  (term) ->
      { id: term, text: term }
    ajax:
      url: '/admin/tags.json'
      dataType: "json"
      data: (term, page) ->
        console.log term
        q: term
      results: (data, page) ->
        console.log data
        results: data
    initSelection: (element, callback) ->
      splitVal = (string, separator) ->
        val = undefined
        i = undefined
        l = undefined
        return []  if string is null or string.length < 1
        val = string.split(separator)
        i = 0
        l = val.length

        while i < l
          val[i] = $.trim(val[i])
          i = i + 1
        val
      data = []
      $(splitVal(element.val(), ",")).each ->
        data.push
          id: this
          text: this

        return

      callback data
      return


    # data: data1

  $('.wysihtml5').wysihtml5
    toolbar:
      image: false
      html: true
      fa: true
