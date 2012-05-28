$title = $("#post_title")
$alias = $("#post_url_alias")

$ ->
  $title.bind "propertychange keyup input paste", ->
    # Automatically suggest values for the alias based on the title
    url = $.trim $(@).val()        # Trim leading whitespace
    url = url.split(' ').join('-') # Spaces to hyphens
    $alias.val(url)     