<?php 
	$name = $_POST['name'];
	$email = $_POST['email'];
	$message = $_POST['message'];
	
	$email_subject= "andrewberls.com - message from " . $name;
	$email_body = $message . "<br /><br /> Respond to: " . $email;
	
	$to = "andrew.berls@gmail.com";
	$headers = "From: andrewberls.com\r\n";
	$headers .= "Reply-To: " . $email . "\r\n";
	
	mail($to, $email_subject, $email_body, $headers);
?>