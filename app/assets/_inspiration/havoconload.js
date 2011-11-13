var body = $('body'); 
body.data("in-transit", true); 
body.data("current-project", false); 
$(document).ready(function() {
   $.preLoadImages("http://havocinspired.co.uk/assets/images/site/loader.gif", 
   "http://havocinspired.co.uk/assets/images/site/contact-success.png"); 
   contactForm(); 
   $("a[rel=single-image]").fancybox( {
      'showNavArrows': false}
   ); 
   if($('body').width() > 860) {
      setTimeout(function() {
         body.data("in-transit", 
         false)}
      , 1000); 
      navigationScroll(); 
      sectionWaypoints(); 
      myWork(); 
      $("a[rel=iframe]").fancybox( {
         'overlayColor': '#000', 
         'hideOnContentClick': true, 
         'showNavArrows': false}
      )}
   if($('body').width() > 480 && $('body').width() < 860) {
      myWork(); 
      navigationScroll(); 
      $("a[rel=iframe]").fancybox( {
         'overlayColor': '#000', 
         'hideOnContentClick': true, 
         'showNavArrows': false}
      )}
   if($('body').width() > 730 && $('body').width() < 860) {
      columnAdjustment()}
   if($('body').width() > 861 && $('body').width() < 1025) {
      columnAdjustment()}
   if($('body').width() < 860) {
      navigationScroll()}
   }
); 
function contactForm() {
   var contactForm = $('#contact-form'); 
   contactForm.wrap("<div id=\"contact\" />"); 
   $(contactForm).validate( {
      messages : {
         contact_name : "Your name is required", 
         contact_email : {
            required : "Your email address is required", 
            email : ""}
         , contact_message : "Your message is required"}
      , invalidHandler : function() {
         $(contactForm).addClass('error'); $(contactForm).find('label:not(.error, [for=contact_url])').hide()}
      , submitHandler : function(form) {
         $(contactForm).append('<input type="hidden" name="ajax_submit" value="true" />'); $(contactForm).removeClass('error'); $(form).fadeOut(300, 
         function() {
            $("#contact").append('<div id="processing"><img src="assets/images/site/loader.gif" alt="Processing..." width="32" height="32" /></div>'); $(form).ajaxSubmit( {
               target : "#contact", 
               url : "assets/includes/contact-processor.inc.php", 
               success : function() {
                  $("#loading").remove(); $("#contact-success").fadeIn(300)}
               }
            )}
         )}
      }
   ); 
   $('input[type=text], #contact textarea', 
   contactForm).focusin(function() {
      $(this).parents('li').find('label').fadeOut(150)}
   ); 
   $('input[type=text], #contact textarea', 
   contactForm).focusout(function() {
      if(!$(this).val()) {
         $(this).parents('li').find('label').fadeIn(150)}
      }
   )}
   
   
   
   
   
function navigationScroll() {
   $("#site-header a, a.btt, a[href=#about-me]").live("click", 
   function() {
      body.data("in-transit", true); 
	  var siteHeader = $("#site-header"); 
	  var destination = $(this).attr("href"); 
	  var sectionClass = destination.substring(1); 
	  $("a", siteHeader).removeClass("current"); 
	  $("li." + sectionClass + " a", siteHeader).addClass("current"); 
	  $('html, body').animate( {
         scrollTop : $(destination).offset().top}
      , 800, 'easeInOutExpo', function() {
         body.data("in-transit", 
         false)}
      ); return false}
   )}
   
   
   
   
   
   
function sectionWaypoints() {
   var siteHeader = $("#site-header"); 
   $("section#welcome-message").waypoint(function() {
      if(body.data("in-transit") === false) {
         $("a", siteHeader).removeClass("current")}
      }
   , {
      offset : - 100}
   ); 
   $("section:not(#welcome-message)").waypoint(function() {
      if(body.data("in-transit") === false) {
         var currentSection = $(this).attr('id'); $("a", 
         siteHeader).removeClass("current"); $("li." + currentSection + " a", 
         siteHeader).addClass("current")}
      }
   , {
      offset : 200}
   ); 
   $("section:not(#welcome-message) div.wrapper").waypoint(function() {
      if(body.data("in-transit") === false) {
         var currentSection = $(this).attr('id'); $("a", 
         siteHeader).removeClass("current"); $("li." + currentSection + " a", 
         siteHeader).addClass("current")}
      }
   , {
      offset : function() {
         return $.waypoints('viewportHeight') - ($(this).outerHeight() + 300)}
      }
   )}
function myWork() {
   $("div.project:gt(0)").hide(); 
   $("#other-projects").css( {
      display : 'block'}
   ); 
   $("div.project:eq(0)").wrap('<div id="current-project"></div>'); 
   var currentProject = $("div.project:eq(0)").attr("class").split(" "); 
   $("body").data("current-project", 
   currentProject[1]); 
   $("#other-projects a").live("click", 
   function() {
      var project = $(this).attr("class").split(" "); var viewingProject = $("#current-project div.project"); if($("body").data("current-project") != project[0]) {
         $("body").data("current-project", 
         project[0]); $("#other-projects li.current").switchClass("current", 
         false, 300); var nextProject = $(this).parents("li"); nextProject.switchClass(false, "current", 300); $('html, body').animate( {
            scrollTop : $("#my-work").offset().top}
         , 300, function() {
            viewingProject.fadeOut(600, function() {
               $("#current-project").append($("div.project." + project[0])); $(viewingProject).insertAfter("#current-project"); $("#current-project div.project").fadeIn(600)}
            )}
         )}
      return false}
   )}
function columnAdjustment() {
   $("#about-me div.column:last").prepend($("#about-me div.column:not(:first, :last) p:last"))}