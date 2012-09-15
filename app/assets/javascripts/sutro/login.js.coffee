validate = (fields) ->
  for field in fields
    return true if !field.value
  return false

$ ->
  # Create and insert an alert error box if blank fields present
  # Only if an alert doesn't already exist

  $("#submit-login").click ->
    form   = $(@).parent()[0]
    fields = form.getElementsByTagName('input')
    errors = validate(fields)

    if errors && !$('#login').find('.svtro-flash').size()
      alertBox = $.el.div { 'class' : 'svtro-flash flash-red' }, 'Invalid email or password.'
      form.parentNode.insertBefore(alertBox, form)
      $('.svtro-flash').hide().slideDown(125)

    return false if errors
