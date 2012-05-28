urlsafe = (url) ->
  # First trim any punctuation
  url = url.replace(/[\.,-\/#!$@%\^\*;&:\[\]{}=\-_`~()]/g, '')
  url = url.replace(/\s+/g, ' ')         # Remove duplicate spaces
  url.split(' ').join('-').toLowerCase() # Remaining spaces to hyphens, lowercase everything

$ ->
  $title = $("#post_title")
  $alias = $("#post_url_alias")

  $title.bind "propertychange keyup input paste", ->
    # Automatically suggest values for the alias based on the title
    url = $.trim $(@).val() # Trim leading whitespace
    $alias.val urlsafe(url) # Fill the alias field with the cleaned url