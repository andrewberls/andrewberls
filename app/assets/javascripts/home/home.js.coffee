$ ->

  # Sticky nav
  # $header = $('header')
  # headerHeight  = $header.outerHeight() - 200
  # $(window).on 'scroll', ->
  #   scrollTop = $(window).scrollTop()
  #   $header.toggleClass('down', (scrollTop > headerHeight))


  # Set up modals
  $('.tr-modal').click (e) ->
    e.preventDefault()
    id = $(this).attr('href')
    $(id).modal { overlayClose: true }


  # Set up smooth scrolling
  $('.scroll').click (e) ->
    e.preventDefault()
    href   = $(this).attr('href')
    offset = $(href).offset().top
    $('html, body').animate { scrollTop: offset }, 'slow', ->
      window.location.hash = href
