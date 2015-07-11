# $.validator.addMethod 'correctName', ((value, element) ->
#    result = .test(value)
#    console.log result
#    return result
# ), 'Неверное Имя'

@initValidationForm = ($form) ->

  patterns = {}
  $form.each ->
    patterns[$(@).attr("name")] =
      pattern: $(@).data("rule")

  profile_rules =
    # "user[account_attributes][current_bill]":
    #   required:
    #     depends: (element) ->
    #       return $("#user_account_attributes_payment_method").val() == "account"
    #   digits: true
    #   minlength: 20
    #   maxlength: 20

    "feedback[name]":
      required: true
      pattern: /^[а-яА-Я|\s]+$/i

    "feedback[email]":
      required: true
      email: true

    "feedback[phone]":
      required: true
      minlength: 10



  $.extend( true, profile_rules, patterns )

  $form.validate
    rules:
      profile_rules
    messages:
      required: ' '
      pattern: ' '
      email: ' '

    onfocusout: (element) ->
      $form.valid()

    highlight: (element) ->
      $(element).closest(".form-group").addClass "has-error"
      return

    unhighlight: (element) ->
      $(element).closest(".form-group").find('.help-block').remove()
      $(element).closest(".form-group").removeClass "has-error"
      return

    errorElement: "span"
    errorClass: "help-block"

    errorPlacement: (error, element) ->
      if element.parent(".input-group").length
        error.insertAfter element.parent()
      else if element.closest(".error-wrapper").length
        element.closest(".error-wrapper").append error
      else
        error.insertAfter element
      return

    submitHandler: (form) ->
      console.log 'submitHandler'
      $(form).ajaxSubmit
        uploadProgress: (event, position, total, percentComplete) ->
          $('.progress').removeClass 'hidden'
          percent = "#{percentComplete}%"
          $('.progress-bar').css('width', percent)
          $('.sr-only').text percent

        success: (responseText, statusText, xhr, $form) ->
          $('#cboxLoadedContent').html responseText
          $.colorbox.resize
            height: '150px'


@initValidation = () ->
  $('input[name="feedback[phone]"]')
    .inputmask
      mask: "+7(999)999-99-99"
      autoUnmask: true

  initValidationForm $('form.js-feedback')


