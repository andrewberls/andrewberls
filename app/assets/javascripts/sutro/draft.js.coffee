
$ -> 
  # Enable display (since requires JS)
  $('#save').css('display', 'block')


$('#save').click ->
  # Fill hidden status field & mark post as draft
  $('#post_status').val('0')