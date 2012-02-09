//----- SAVE FOR LATER ---//
$(function() {
	// Enable display (since requires JS)
	$('#save').css('display', 'block');
})

$('#save').click(function() {
	// Fill hidden status field & mark post as draft
	$('#post_status').val('draft');	
});


