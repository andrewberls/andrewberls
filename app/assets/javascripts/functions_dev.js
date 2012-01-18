//----- UTILITY FUNCTIONS ---//
function capitalize(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

//----- SCROLLING FOR HEADER NAVIGATION ---//
function scrollTo(id) {
	$('html,body').animate({scrollTop: $("#" + id).offset().top}, 'slow');
}

$('ul.nav a, #home a').click(function (event) {
	// This statement is unecessary if button is not included
	if (!$(this).hasClass('blog') && !$(this).hasClass('noScroll')) {		
		event.preventDefault();
		var id = $(this).attr('class');
		scrollTo(id);
		//return false;
	}
});

$('#top').click(function (event) {
	event.preventDefault();
	scrollTo('header');
});

//----- IMAGE SLIDER ---//
//-- Overflow scrolls by default - hide with JS
$('div.window').css({
	'overflow' : 'hidden',
	'height' : '450px',
});
$('.thumb').css('display', 'block');

//Get width of the image, how many images there are, then determine the size of the image reel.
var imageWidth = $('.window').width();
var numImages = $('.reel img').size();
var reelWidth = imageWidth * numImages;
var active = 1;

//Adjust the image reel to its new size
$('.reel').css({'width' : reelWidth});

function rotate(id) {
	var offset = Math.abs(id-active),
		distance = imageWidth * offset;
		
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

//----- CONTACT FORM FOCUS/BLUR ---//
$(document).ready(function () {
	$('input,textarea').focus(function () {
        if (this.value == this.defaultValue) {
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
    		$(this).addClass('valid');
    	}
	    });
});

$('div.thumb a').click(function() {
	$(this).addClass('active');
});

//----- JS CONTACT FORM VALIDATION ---//
/*
 * Loop through all of the submitted field values
 * If any of the values is nil, its default value,
 * or equal to its error message (meaning already tried and failed once)
 * add an invalid class (red border/text),
 * change its value to an appropriate error message,
 * (these calls are chained together for efficiency),
 * and return false.
*/
$('#submit').click(function() {	
	// Initialize variables
	var name = $('#name'),
		email = $('#email'),
		message = $('#message'),
		errors = false;
			
	var fields = [name, email, message];
	var fieldNames = ["name","email","message"];
	
	for(var i=0; i<fields.length; i++) {
		var errMsg = 'Please enter your ' + fieldNames[i] + '!';
		// To do: implement a blank() function instead of using !val		
		if(!fields[i].val() || fields[i].val() == capitalize(fieldNames[i]) || fields[i].val() == errMsg) {
			fields[i].addClass('invalid').val(errMsg);
			errors = true;
		}
	}
	
	return errors ? false: true;
	
});