function rotate(a){var b=Math.abs(a-active),c=imageWidth*b;$(".reel").animate({left:-c},550)}function scrollTo(a){$("html,body").animate({scrollTop:$("#"+a).offset().top},"slow")}function capitalize(a){return a.charAt(0).toUpperCase()+a.slice(1)}$("ul.nav a, #home a").click(function(a){if(!$(this).hasClass("blog")&&!$(this).hasClass("noScroll")){a.preventDefault();var b=$(this).attr("class");scrollTo(b)}});$("#top").click(function(a){a.preventDefault();scrollTo("header")});$("div.window").css({overflow:"hidden",height:"450px"});$(".thumb").css("display","block");var imageWidth=$(".window").width();var numImages=$(".reel img").size();var reelWidth=imageWidth*numImages;var active=1;$(".reel").css({width:reelWidth});$(".thumb a").click(function(){$(".thumb a").removeClass("active");$(this).addClass("active");var a=$(this).attr("rel");rotate(a);return false});$(document).ready(function(){$("input,textarea").focus(function(){if(this.value==this.defaultValue){this.value=""}if($(this).hasClass("invalid")){$(this).removeClass("invalid");$(this).val("")}});$("input,textarea").blur(function(){if(this.value==""){this.value=this.defaultValue;$(this).removeClass("valid")}else{$(this).addClass("valid")}})});$("div.thumb a").click(function(){$(this).addClass("active")});$("#submit").click(function(){var a=$("#name"),b=$("#email"),c=$("#message"),d=false;var e=[a,b,c];var f=["name","email","message"];for(var g=0;g<e.length;g++){var h="Please enter your "+f[g]+"!";if(!e[g].val()||e[g].val()==capitalize(f[g])||e[g].val()==h){e[g].addClass("invalid").val(h);d=true}}return d?false:true})