$ ->
  # Load dialog on page load
  #$('#portfolio-modal').modal()


  # Load dialog on click
  $('#tr-portfolio-modal').click (e) ->
    $('#portfolio-modal').modal {
      overlayClose : true,
      # onOpen: (dialog) ->
      #   dialog.overlay.fadeIn('fast', ->
      #     dialog.container.slideDown('fast', ->
      #       dialog.data.show()
      #     )
      #   )
    }
    false