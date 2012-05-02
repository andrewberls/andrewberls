# Validate contact form before submissiopn

#------------------------------
# Utility Methods
#------------------------------
insertAfter = (refNode, newNode) -> 
  refNode.parentNode.insertBefore(newNode, refNode.nextSibling)

validate = (fields) ->
  errors = false
  for field in fields
    # TODO: Add error class to invalid fields?
    errors = true if !field.value
  errors

$ ->
  # Create and insert an alet error box if blank fields present

  $('#submit-contact').click ->
    $form = $(this).parent()
    fields = $form.find(':text, textarea')
    errors = validate(fields)

    if errors && $form.find('.flash').size() == 0 # Only if an alert doesn't already exist
      alertBox = document.createElement('div')
      alertBox.setAttribute('class', 'flash flash-error')
      errTxt = document.createTextNode('Please check your fields and try again!')
      alertBox.appendChild(errTxt)
      $title = $form.find('h2')[0]
      insertAfter($title, alertBox)      
      $('.flash').hide().slideDown('fast')
      return false