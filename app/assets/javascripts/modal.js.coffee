$ ->

  $('#tr-sexinfo-modal').click (e) ->
    $('#sexinfo-modal').modal {
      overlayClose : true,
      # onOpen: (dialog) ->
      #   dialog.overlay.fadeIn('fast', ->
      #     dialog.container.slideDown('fast', ->
      #       dialog.data.show()
      #     )
      #   )
    }
    false

  $('#tr-robodactyl-modal').click (e) ->
    $('#robodactyl-modal').modal { overlayClose: true }
    false

  $('#tr-bruceb-modal').click (e) ->
    $('#bruceb-modal').modal { overlayClose: true }
    false

  $('#tr-rha-modal').click (e) ->
    $('#rha-modal').modal { overlayClose: true }
    false