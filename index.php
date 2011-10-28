<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<title>AndrewBerls.com</title>	
	<link rel="stylesheet" href="_css/reset.css" />
	<link rel="stylesheet" href="_css/style.css" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	
	<script type="text/javascript">
		// Manages scrolling for header navigation
		function scrollTo(id) {		 	    		
			$('html,body').animate({scrollTop: $("#"+id).offset().top},'slow');		
		}
	
		// Handle contact form focus/blur
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
	</script>
		
	
	
</head>

<body>
	
	<section id="header">
		<div class="wrapper">
			<h1>Hello World!</h1>
			<ul class="nav">
				
				<!--FIX TO REMOVE JS:VOID AND WORK USING NAMED ANCHORS WITHOUT JS-->
				
				<li><a href="javascript:void(0)"   onclick="scrollTo('portfolio')">portfolio</a></li> <!-- href home, no onclick -->
				<li><a href="javascript:void(0)"   onclick="scrollTo('about')">about me</a></li>
				<li><a href="javascript:void(0)"   onclick="scrollTo('contact')">get in touch</a></li>
				<li><a href="javascript:void(0)"   onclick="scrollTo('footer')">resources</a></li>
			</ul>
		</div>
	</section>
	
	<section id="home">
		<div class="wrapper">
		
			<h1>Welcome!</h1>
			<p>This site is still very much a work in progress, but feel free to poke around and <a href="javascript:void(0)" onclick="scrollTo('footer')">check out our resources.</a></p>
			<p style="margin: 5px 0 15px;">This form doesn't actually do anything.</p>
			
			
			
			
			
		</div>
	</section>
	
	<section id="portfolio">
		<div class="wrapper">
			
			
			<div class="slider">
				<div class="window">
					<div class="reel">
						<div class="frame">
							<a href=""><img src="_images/sexinfo_large1.jpg" alt="" /></a>																			
						</div> <!-- #FRAME NECESSARY? -->
						
						<div class="frame">
							<!--<a href=""><img src="_images/bruceb_large1.jpg" alt="" /></a>-->
						</div>
						
						<div class="frame">
							<!--<a href=""><img src="_images/rha_large1.jpg" alt="" /></a>-->
						</div>										
					</div> <!-- .reel -->				
				</div> <!-- .reel -->
				
				<div class="thumb active">
					<a href=""><img src="_images/sexinfo_thumb1.jpg" alt="" /></a>
				</div>
				<div class="thumb">
					<a href=""><img src="_images/bruceb_thumb1.jpg" alt="" /></a>
				</div>
				<div class="thumb">
					<a href=""><img src="_images/rha_thumb1.jpg" alt="" /></a>
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
		$('.thumb').hover(
			// Mouseover
			function() {
				if ($(this).hasClass('active')) {
					return false;
				}
				$(this).css({
					'border'            : '3px solid #666',
					'-moz-transition'   : 'all 0.12s ease-out',
			        '-o-transition'     : 'all 0.12s ease-out',
			        '-webkit-transition': 'all 0.12s ease-out' 
				});
			},
			// Mouseleave
			function() {
				if ($(this).hasClass('active')) {
					return false;
				}
				$(this).css({
					'border'            : '3px solid #C4C4C4',
					'-moz-transition'   : 'all 0.12s ease-out',
			        '-o-transition'     : 'all 0.12s ease-out',
			        '-webkit-transition': 'all 0.12s ease-out' 
				});
			});
			
		//Get size of the image, how many images there are, then determine the size of the image reel.
		//var imageSize = $('.window').width();
			//alert(imageSize);
		//Adjust the image reel to its new size
		
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