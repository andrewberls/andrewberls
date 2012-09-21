$ ->
  $('.tr-modal').click (e) ->
    e.preventDefault()
    id = $(this).attr('href')
    $(id).modal { overlayClose: true }
