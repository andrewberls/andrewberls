urlsafe = (url) ->
  url = $.trim url # First trim any trailing whitespace
  url = url.replace(/\s+/g, ' ')         # Remove duplicate spaces
  # Trim any punctuation
  url = url.replace(/[\.,-\/#!$@%\^\*;&:\[\]{}=\-_`~()]/g, '')
  url.split(' ').join('-').toLowerCase() # Remaining spaces to hyphens, lowercase everything

$ ->
  $title = $("#post_title")
  $alias = $("#post_url_alias")

  $title.bind "propertychange keyup input paste", ->
    # Automatically suggest values for the alias based on the title
    url = $(@).val()
    $alias.val urlsafe(url) # Fill the alias field with the cleaned url