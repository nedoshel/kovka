@initValidation = () ->


  $('form.js-feedback').ajaxForm
    success: (formData, jqForm, options) ->
      $.colorbox.close()

  $('input[name="feedback[phone]"]').inputmask
    mask: "+7(999)999-99-99"
    autoUnmask: true


  $("#new_feedback").bootstrapValidator
    icon:
      valid: "glyphicon glyphicon-ok"
      invalid: "glyphicon glyphicon-remove"
      validating: "glyphicon glyphicon-refresh"

    fields:
      "feedback[name]":
        validators:
          notEmpty:
            message: "Обязательное поле"

          regexp:
            regexp: /[а-яА-Я|\s]+/
            message: "Допустимса только кириллица"

      "feedback[email]":
        validators:
          notEmpty:
            message: "Обязательное поле"

          emailAddress:
            message: "Введите корректный email"

      "feedback[phone]":
        validators:
          notEmpty:
            message: "Обязательное поле"
          stringLength:
            min: 10
            message: 'Введите корректный телефон в формате +7(911)976-91-04'
          # phone:
          #   country: "RU"
          #   message: 'Введите корректный телефон в формате +7(911)976-91-04'

