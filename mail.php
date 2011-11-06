<?php 
	$name = $_POST['name'];
	$email = $_POST['email'];
	$message = $_POST['message'];
	
	$email_subject= "andrewberls.com - new form submission";
	$email_body = "{$message} \n {$email}";
	
	echo $email_body;
?>