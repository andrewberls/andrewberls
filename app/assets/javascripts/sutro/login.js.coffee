validate = (fields) ->
  for field in fields
    return true if !field.value
  return false

$ ->

  # On submit, show an error box if blank fields present
  
  $("#submit-login").click ->
    form = $(this).parent()[0]
    fields = form.getElementsByTagName('input')
    errors = validate(fields)
    
    if errors && !$('#login').find('.svtro-flash').size() 
      # Only if an alert doesn't already exist
      alertBox = $.el.div({'class' : 'svtro-flash flash-red'}, 'Invalid email or password.')
      form.parentNode.insertBefore(alertBox, form)
      $('.svtro-flash').hide().slideDown(125)
      
    return false if errors