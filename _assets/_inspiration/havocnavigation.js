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