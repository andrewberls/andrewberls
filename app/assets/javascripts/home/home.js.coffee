$ ->

  # Make intro pane full-height
  $intro     = $('.intro-container')
  introPaddingTop    = parseInt($intro.css('padding-top'))
  introPaddingBottom = parseInt($intro.css('padding-bottom'))

  # TODO: inner or outer height here?
  $intro.css {
    'height': window.outerHeight - introPaddingTop - introPaddingBottom
    'padding-bottom': '0px'
  }

  # Vertically center intro header
  $welcome = $intro.find('h1')
  margin   = (window.innerHeight / 3) - $welcome.outerHeight()
  $welcome.css { 'margin-top': margin + 'px' }


  # Sticky nav
  $header = $('header')
  headerHeight  = $header.outerHeight()
  $(window).on 'scroll', ->
    scrollTop = $(window).scrollTop()
    $header.toggleClass('down', (scrollTop > headerHeight))


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
