urlsafe = (url) ->
  url = $.trim url               # First trim any trailing whitespace
  url = url.replace(/\s+/g, ' ') # Remove duplicate spaces
  # Trim any punctuation
  url = url.replace(/[\.,-\/#\?!$@%\^\*;&:\[\]{}=\-_`~()]/g, '')
  url.split(' ').join('-').toLowerCase() # Remaining spaces to hyphens, lowercase everything


preview =  ->
  markdown = $('#post_body').val()
  if markdown
    $.post('/preview', { markdown: markdown }).done (json) ->
      html = JSON.parse(json).html
      $('.post-preview').html(html)


$ ->
  preview()

  $('#save').click ->
    # Fill hidden status field to mark post as draft
    $('#post_status').val('0')

  $title = $("#post_title")
  $body  = $("#post_body")
  $alias = $("#post_url_alias")

  $title.bind "propertychange keyup input paste", ->
    # Automatically suggest values for the alias based on the title
    url = $(@).val()
    $alias.val urlsafe(url)

  timeout = -1
  $body.keyup ->
    clearTimeout(timeout) if timeout
    timeout = setTimeout(preview, 700)
