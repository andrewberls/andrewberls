//----- SCROLLING FOR HEADER NAVIGATION ---//
	function scrollTo(id) {		 	    		
		$('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');		
	}

	$('.nav a, #home a').click(function(event) {
		event.preventDefault();	
		var id = $(this).attr('class');
		scrollTo(id);
		//return false;
	});	
	$('#top').click(function(event) {
		event.preventDefault();			
		scrollTo('header');		
	});	

	//----- CONTACT FORM FOCUS/BLUR ---//
	$(document).ready(function() {
		$('input,textarea').focus(function() {
	        if (this.value == this.defaultValue){	             
	        	this.value = '';
	    	}
	    	if ($(this).hasClass('invalid')) {
	    		$(this).removeClass('invalid');
	    		$(this).val('');	    		
	    	}        
	    });
	    $('input,textarea').blur(function() {
	        if (this.value == ''){	        	
	        	this.value = this.defaultValue;
	        	$(this).removeClass('valid');
	    	} else {
	    		this.value = this.value;
	    		$(this).addClass('valid');
	    	}	    	
		    });
	});

	$('.thumb a').click(function() {
		$(this).addClass('active');
	});
	
	
	//----- IMAGE SLIDER ---//
	//-- Overflow scrolls by default - hide with JS
	$('.window').css('overflow', 'hidden');
	
	//Get width of the image, how many images there are, then determine the size of the image reel.
	var imageWidth = $('.window').width();
	var numImages = $('.reel img').size();
	var reelWidth = imageWidth * numImages;
	var active = 1;
	
	//Adjust the image reel to its new size
	$('.reel').css({'width' : reelWidth});
	
	function rotate(id) {		
		var offset = Math.abs(id-active);		
		var distance = imageWidth * offset;		
		$('.reel').animate({
			left: -distance
		}, 550);
	}
	
	$('.thumb a').click(function() {
		$('.thumb a').removeClass('active');		
		$(this).addClass("active");
		var id = $(this).attr('rel');
		rotate(id);		
		return false; //Prevent browser jump to anchor link
	});
	
	
	//----- JS FORM VALIDATION ---//
	$('#submit').click(function() {
		var name = $('#name'),
			email = $('#email'),
			message = $('#message'),
			errors = false;
			
		if (!name.val()|| name.val() == "Name") {
			name.addClass('invalid');
			name.val('Please enter your name!')
			errors = true;
		}
		if (!email.val()|| email.val() == "Email") {
			email.addClass('invalid');
			email.val('Please enter your email!')
			errors = true;
		}
		if (!message.val()|| message.val() == "Message") {
			message.addClass('invalid');
			message.val('Please enter your message!')
			errors = true;
		}
		
		if (errors) return false;
	});
	