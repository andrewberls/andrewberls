<?php
	$errors = array();		
	$required_fields = array('name','email','message');		
	
	if (isset($_POST['submit'])) {
		foreach($required_fields as $fieldname) {							
			if (!isset($_POST[$fieldname]) || empty($_POST[$fieldname]) || $_POST[$fieldname] == ucfirst($fieldname)) {
				$errors[] = $fieldname;
			}
		}
		
		if (empty($errors)) {
			$name = $_POST['name'];
			$email = $_POST['email'];
			$message = $_POST['message'];
			
			$email_subject= "andrewberls.com - message from " . $name;
			$email_body = $message . "\n\n Respond to: " . $email;			
			$to = "andrew.berls@gmail.com";
			$headers = "From: andrewberls.com\r\n";
			$headers .= "Reply-To: " . $email . "\r\n";
								
			mail($to, $email_subject, $email_body, $headers);
			header("Location: index.php?success=true#contact");			
			
		} else {
			//-- Errors detected in form
			// Fallback from normal JS validation
			header("Location: index.php?success=false#contact");			
		}		
	}
	
	// Populate field default values
	$name = "Name";		
	$email = "Email";
	$message = "Message";
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="utf-8" />
	<title>AndrewBerls.com</title>	
	<link rel="stylesheet" href="_css/reset.css" />
	<link rel="stylesheet" href="_css/style.css" />	
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
			<!--<a href="#" class="icon"></a>-->
		</div>
	</section>
	
	<section id="home">
		<div class="wrapper">								
			<p class="title">Hello and welcome! My name is <span>Andrew Berls</span> and I <span>really enjoy making websites.</span></p>
						
			<div class="threeCol">
				<h4>Who I am</h4>
				<p>I'm a 19-year old Computer Science student at UCSB. I love to build things and learn new tricks, and I get restless without a project on my hands.</p>
			</div>
			<div class="threeCol">
				<h4>What I do</h4>
				<p>Ever since I started working with the web I've been fascinated by <span>minimalist design</span>, <span>elegant code</span>, and <span>natural user experiences</span>.
				You can check out some of my best work
					<a class="portfolio" href="#portfolio">here</a>.</p>
			</div>
			<div class="threeCol">
				<h4>Say hello</h4>
				<p>I love working with others to produce clean, effective, and standards-compliant sites for any range of needs. Feel free to <a class ="contact" href="#contact">shoot me an email!</a></p>
			</div>			
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
								<p>I'm currently the lead web developer at SexInfoOnline.com, a site devoted to providing comprehensive sex education and accurate information about all aspects of human sexuality, as well as addressing general questions posed from all over the world. The site is run by advanced sociology students at the University of California at Santa Barbara, along with a team of student webmasters. My responsibilities include training and working with the other student developers to maintain existing content, manage projects, and add features. You can read more in the site in the <a href="http://articles.latimes.com/2009/aug/01/local/me-sexclass1">Los Angeles Times</a>.</p>
							</div>
																								
						</div>
						
						<div class="frame">
							<a href="#"><img src="_images/bruceb_large1.jpg" alt="" /></a>
							<div class="text">
								<h3>Bruceb Consulting</h3>
								<p>I rebuilt <a href="http://www.bruceb.com">Bruceb Consulting's</a> website from scratch in order to reflect modern web standards in HTML/CSS and to implement a fast and extensible site structure. The previous design of the site was left largely untouched, with a focus on making navigation more simple and elegant. The redesign was done in tandem with an update to Bruceb's <a href="http://www.brucebnews.com">Wordpress blog</a> in order to maintain consistency across platforms.</p>
							</div>
						</div>
						
						<div class="frame">
							<a href="#"><img src="_images/rha_large1.jpg" alt="" /></a>
							<div class="text">
								<h3>UCSB RHA</h3>
								<p>From August of 2010 to June of 2011, I served as the webmaster of the Residence Halls Association at UCSB, a student organization which oversees all of the Residence Halls on campus and conducts social, educational, and cultural programs for all residents. In that time, I completely redid the site's layout and navigation in an effort to increase traffic and site use. I implemented several initiatives such as transitioning the existing equipment rental system to an entirely paperless online system. My responsibilities also included creating documentation for future webmasters, and I received the NRHH Outstanding Leadership & Service Award in June for my work.</p>					
							</div>
						</div>	
														
					</div> <!-- .reel -->				
				</div> <!-- .window -->
				
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
	
	<section id="about">
		<div class="wrapper">			
			<h2>Details</h2>
			<div class="twoCol">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>	
			</div>
			<div class="twoCol">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>	
			</div>			
					
		</div>
	</section>
	
	<section id="contact">
		<div class="wrapper">								
			<?php 
				if (isset($_GET['success']) && $_GET['success'] == "false") {
				//if (!empty($errors)) {
					echo "<p class=\"msgBad\">Oops! There was an error submitting the form. Please check your fields and try again.</p>";									
				}
				//if (isset($_GET['success']) && $_GET['success'] == "true") {
				if (isset($_GET['success']) && $_GET['success'] == "true") {
					echo "<p class=\"msgGood\">Success! I'll get back to you as soon as I can!</p>";
				}
			?>
												
			<form method="post" action="index.php">
				<h2>Get in Touch</h2>
				<p>If you're interested in working together on a project, or just want to say hello, I'd love to hear from you!</p>
				<label for="name">Name:</label>
				<input type="text" name="name" id="name" value="<?php echo $name ?>" />									
				
				<label for="email">Email:</label>
				<input type="text" name="email" id="email" value="<?php echo $email ?>" />
				
				<label for="message">Message:</label>
				<textarea name="message" id="message" rows="8" cols="40"><?php echo $message ?></textarea>
				
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
