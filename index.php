<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<title>AndrewBerls.com</title>	
	<link rel="stylesheet" href="_css/reset.css" />
	<link rel="stylesheet" href="_css/style.css" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	
</head>

<body>
	
	<section id="header">
		<div class="wrapper">
			<!--<h1>Hello World!</h1>-->
			<h2>Andrew <span>Berls</span></h2>
			<ul class="nav">							
				<!--
					portfolio
					resources
					experiments
					about
					contact
					tumblr
				-->				
				<li><a href="#portfolio" class="portfolio">portfolio</a></li>
				<!--<li><a href="#about" class="about">about me</a></li>-->
				<li><a href="#contact"   class="contact">get in touch</a></li>
				<li><a href="#footer"    class="footer">resources</a></li>
			</ul>
		</div>
	</section>
	
	<section id="home">
		<div class="wrapper">
		
			<!--<h1>Welcome!</h1>-->
			<!--<p>This site is still very much a work in progress, but feel free to poke around and <a href="javascript:void(0)" onclick="scrollTo('footer')">check out our resources.</a></p>-->
			<p class="title">Hello and welcome! My name is <span>Andrew Berls</span> and I really enjoy making websites.</p>
			<p>Ever since I started working with the web I've been fascinated by <span>minimalist design</span>, <span>elegant code</span>, and <span>natural user experiences</span>.</p>
			<p>I'm constantly working to improve my skills, and I love working with others to produce clean, effective, and standards-compliant sites for any range of needs. You can check out some of my best work <a class="portfolio" href="#portfolio">here</a>, or feel free to <a class ="contact" href="#contact">shoot me an email!</a></p>			
		</div>
	</section>
	
	<section id="portfolio">
		<div class="wrapper">
			
			
			<div class="slider">
				<div class="window">
					<div class="reel">
						
						<div class="frame">
							<a href="#"><img src="_images/sexinfo_large1.jpg" alt="" /></a>
							<div class="text">
								<h3>SexInfoOnline.com</h3>
								<p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
							</div>
																								
						</div>
						
						<div class="frame">
							<a href="#"><img src="_images/bruceb_large1.jpg" alt="" /></a>
							<div class="text">
								<h3>Bruceb Consulting</h3>
								<p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
							</div>
						</div>
						
						<div class="frame">
							<a href="#"><img src="_images/rha_large1.jpg" alt="" /></a>
							<div class="text">
								<h3>UCSB RHA</h3>
								<p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>					
							</div>
						</div>	
														
					</div> <!-- .reel -->				
				</div> <!-- .reel -->
				
				<div class="thumb">
					<a class="active" href="#" rel="1"><img src="_images/sexinfo_thumb1.jpg" alt="" /></a>
				</div>
				<div class="thumb">
					<a class="" href="#" rel="2"><img src="_images/bruceb_thumb1.jpg" alt="" /></a>
				</div>
				<div class="thumb">
					<a class="" href="#" rel="3"><img src="_images/rha_thumb1.jpg" alt="" /></a>
				</div>
			</div> <!-- .slider -->
			
		</div>
	</section>
	
	<!--<section id="about">
		<div class="wrapper"></div>
	</section>-->
	
	<section id="contact">
		<div class="wrapper">
			
			<p class="msgBad">Oops! There was an error submitting the form. Please check your fields and try again.</p>
			<p class="msgGood">Success! I'll get back to you as soon as I can!</p>
			
			<form method="post" action="mail.php">
				<h2>Get in Touch</h2>
				<p>If you're interested in working together on a project, or just want to say hello, I'd love to hear from you!</p>
				<label for="name">Name:</label>
				<input class="" type="text" name="name" value="Name" id="name" />	
				
				<label for="email">Email:</label>
				<input type="text" name="email" value="Email" id="email"/>
				
				<label for="message">Message:</label>
				<textarea name="message" rows="8" cols="40" id="message">Your message</textarea>
				
				<input type="submit" name="submit" value="Submit" class ="cta" id="submit"/>				
			</form>
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
			
			<!-- FOR OPTIONAL RIGHT DETAIL COLUMN - ENABLE RULE IN CSS -->
			<!--<div class="column">
				<h3>Details</h3>
				<ul>
					<li>Andrew Berls</li>
					<li>andrew@andrewberls.com</li>
					<li></li>
				</ul>
			</div>-->
		</div>
	</section>
	
	<section id="copyright">
		<div class="wrapper">
			<p class="left">Copyright © 2011 Andrew Berls. This site was built using <a href="#">XHTML</a>,
			<a href="#">CSS3</a>, and 
			<a href="#">jQuery</a>
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
		//scrollTo('portfolio');
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
		return false; //Prevent browser jump to link anchor
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
