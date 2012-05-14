# Validate contact form before submissiopn

#------------------------------
# Utility Methods
#------------------------------
insertAfter = (refNode, newNode) -> 
  refNode.parentNode.insertBefore(newNode, refNode.nextSibling)

validate = (fields) ->
  for field in fields
    return true if !field.value
  return false

$ ->
  # Create and insert an alet error box if blank fields present

  $('#submit-contact').click ->
    $form = $(this).parent()
    fields = $form.find(':text, textarea')
    errors = validate(fields)

    if errors && $form.find('.flash').size() == 0 # Only if an alert doesn't already exist
      alertBox = $.el.div({'class' : 'flash flash-error'}, 'Please check your fields and try again!')
      $title = $form.find('h2')[0]
      insertAfter($title, alertBox)      
      $('.flash').hide().slideDown('fast')
      return false