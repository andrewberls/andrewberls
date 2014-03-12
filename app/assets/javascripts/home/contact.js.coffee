insertAfter = (refNode, newNode) ->
  refNode.parentNode.insertBefore(newNode, refNode.nextSibling)

validate = (fields) ->
  for field in fields
    return true if !field.value
  return false

$ ->

  $email = $('#message_email')
  $hint  = $("#hint")

  $email.on 'blur', ->
    $(@).mailcheck {
      suggested: (elem, suggestion) ->
        address = suggestion.address
        domain  = suggestion.domain

        if !$hint.html()
          # First error - fill in/show entire hint element
          suggestion = """
            Yikes! Did you mean <span class='suggestion'>#{address}@<a href='#' class='domain'>#{domain}</a></span>?
          """
          $hint.html(suggestion).fadeIn(150)
        else
          # Subsequent errors - modify domain only
          $(".domain").html(domain)
    }

  $(document.body).delegate '.domain', 'click', ->
    # On click, fill in the field with the suggestion and remove the hint
    $email.val $(".suggestion").text()
    $hint.fadeOut 200, -> $(@).empty()
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



