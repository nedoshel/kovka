#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require select2
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
    data: data1

