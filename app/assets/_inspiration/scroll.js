 function scrollTo(id) {     			
	$('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');		
}		