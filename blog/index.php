<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<title>AndrewBerls.com</title>	
	<link rel="stylesheet" href="../_css/reset.css" />
	<link rel="stylesheet" href="blog.css" />
	<link rel="icon" type="image/ico" href="../favicon.ico" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>		
</head>

<body>
	
	<section id="header">
		<div class="wrapper">			
			<h2>Andrew <span>Berls</span></h2>
			<ul class="nav">	
				<li><a href="#portfolio" class="portfolio">portfolio</a></li>
				<li><a href="#about" class="about">about me</a></li>
				<li><a href="#contact" class="contact">get in touch</a></li>
				<li><a href="#footer" class="footer">resources</a></li>
			</ul>			
		</div>
	</section>
	
	<section id="main">
		<div class="wrapper">
			
			<div class="sidebar"></div>
			
			<div class="post">
				<h4>This is the post title</h4>
				<p class="date">7 November 2011</p>
				<p>Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum </p>
			</div>
			
			<div class="post">
				<h4>This is the post title</h4>
				<p class="date">7 November 2011</p>
				<p>Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum </p>
			</div>
						
		</div>		
	</section>
		
	
	<section id="footer">
		<div class="wrapper">
			<div class="column borderRight">
				<h3>Projects</h3>
				<ul>
					<li><a href="https://github.com/andrewberls">GitHub</a></li>
					<li><a href="http://apps.andrewberls.com">Web Apps</a></li>
					<li><a href="http://www.soc.ucsb.edu/sexinfo">SexInfo Online</a></li>
					<li><a href="http://www.bruceb.com">bruceb.com</a></li>
					<li><a href="http://www.acmucsb.com">ACM</a></li>
				</ul>
			</div>
			<div class="column borderBoth">
				<h3>Media</h3>
				<ul>
					<li><a href="http://www.linkedin.com/pub/andrew-berls/2b/1a6/aa8">LinkedIn</a></li>
					<li><a href="http://andrewberls.tumblr.com">Tumblr</a></li>
					<li><a href="http://brucebnews.com">Bruceb News</a></li>
				</ul>
			</div>
			<div class="column borderLeft">
				<h3>Tools</h3>
				<ul>
					<li><a href="http://code.google.com/p/zen-coding/">Zen Coding</a></li>
					<li><a href="http://www.sass-lang.com">Sass for CSS</a></li>
					<li><a href="http://www.aptana.com/">Aptana Studio</a></li>
				</ul>
			</div>					
		</div>
	</section>
	
	<section id="copyright">
		<div class="wrapper">
			<p class="left">Copyright © 2011 Andrew Berls. This site was built using 
			<a href="http://www.w3.org/TR/xhtml1/">XHTML</a>,
			<a href="http://www.css3.info/">CSS3</a>, and 
			<a href="http://jquery.com/">jQuery</a>
			</p>
			<p class="right"><a href="http://validator.w3.org/check?uri=http%3A%2F%2Fwww.andrewberls.com">valid HTML</a> | 
				<a href="#">valid CSS</a></p>
		</div>
	</section>
		
<script type="text/javascript">
	//----- SCROLLING FOR HEADER NAVIGATION ---//
	function scrollTo(id) {		 	    		
		$('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');		
	}

	$('.nav a, #home a').click(function() {		
		var id = $(this).attr('class');
		scrollTo(id);
		return false;
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
	
</script>

<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-9633739-4']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>	
</body>
</html>
