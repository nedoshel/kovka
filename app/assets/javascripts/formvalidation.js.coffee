@initValidationForm = ($form) ->

  $form
    .bootstrapValidator
      icon:
        valid: "glyphicon glyphicon-ok"
        invalid: "glyphicon glyphicon-remove"
        validating: "glyphicon glyphicon-refresh"

      fields:
        "feedback[name]":
          validators:
            notEmpty:
              message: ' '
              # message: "Обязательное поле"

            regexp:
              # regexp: /[а-яА-Я|\s]+/
              regexp: /^[а-яА-Я|\s]+$/
              # message: "Допустима только кириллица"
              message: ' '

        "feedback[email]":
          validators:
            notEmpty:
              # message: "Обязательное поле"
              message: ' '

            emailAddress:
              # message: "Введите корректный email"
              message: ' '

        "feedback[phone]":
          validators:
            notEmpty:
              # message: "Обязательное поле"
              message: ' '
            # phone:
            #   country: 'RU'
            #   message: 'Введите корректный телефон в формате +7(911)976-91-04'
            stringLength:
              min: 10
              # message: 'Введите корректный телефон в формате +7(911)976-91-04'
              message: ' '

    .on "success.form.bv", (e) ->
      $form = $(e.target)
      e.preventDefault()  if $form.data("remote") and $.rails isnt `undefined`
      return

    .on "submit", (e) ->
      $form = $(e.target)
      if $form.data("remote")
        numInvalidFields = $form.data("bootstrapValidator").getInvalidFields().length
        if numInvalidFields
          e.preventDefault()
          false


@initValidation = () ->
  $('input[name="feedback[phone]"]')
    .inputmask
      mask: "+7(999)999-99-99"
      autoUnmask: true

  initValidationForm $('form.js-feedback')


