# Validate contact form before submission

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
  # Mailcheck the email field

  $email = $('#message_email')
  $hint = $("#hint")

  $email.on 'blur', ->
    $hint.css('display', 'none').empty()
    $(this).mailcheck {
      suggested: (element, suggestion) ->
        if !$hint.html()
          # First error - fill in/show entire hint element
          suggestion = "Yikes! Did you mean <span class='suggestion'>" +
                        "<span class='address'>#{suggestion.address}</span>" +
                        "@<a href='#' class='domain'>#{suggestion.domain}</a></span>?";

          $hint.html(suggestion).fadeIn(150)
        else
          # Subsequent errors
          $(".address").html(suggestion.address)
          $(".domain").html(suggestion.domain)
    }

  $hint.on 'click', '.domain', ->
    # On click, fill in the field with the suggestion and remove the hint
    $email.val($(".suggestion").text());
    $hint.fadeOut(200, -> $(this).empty())
    return false


  # On submit, show an error box if blank fields present

  $('#submit-contact').click ->
    $form  = $(this).parent()
    fields = $form.find(':text, textarea')
    errors = validate(fields)

    if errors && !$form.find('.flash').size()
      # Only if an alert doesn't already exist
      alertBox = $.el.div { 'class' : 'flash flash-error' }, 'Please check your fields and try again!'
      $title   = $form.find('h2')[0]
      insertAfter($title, alertBox)
      $('.flash').hide().slideDown('fast')

    return false if errors


