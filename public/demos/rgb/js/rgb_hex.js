//-- UTILITY CONVERSION METHODS
//------------------------------------
function toHex(a) { 
  if (a === null) { 
    return "00"; 
  } 
  a = parseInt(a, 10); 
  if (a === 0 || isNaN(a)) { 
    return "00"; 
  } 
  a = Math.max(0, a); 
  a = Math.min(a, 255); 
  a = Math.round(a); 
  return "0123456789ABCDEF".charAt((a - a % 16) / 16) + "0123456789ABCDEF".charAt(a % 16);
}

function rgbToHex(r, g, b) { 
  return toHex(r) + toHex(g) + toHex(b);
} 

function hexToVal(h, start, end) { 
  return parseInt(h.substring(start, end), 16);
}


//-- FILL RESULT FIELDS/PREVIEW
//------------------------------------
function evaluate_rgb() {

  var in_r = $("#in_R").val(), 
      in_g = $("#in_G").val(), 
      in_b = $("#in_B").val(),
      $out_h = $("#out_hex");

  var new_color = "#" + rgbToHex(in_r, in_g, in_b);
  
  $out_h.val(new_color);
  $("#previewBox").css("background-color", new_color); 
  $("#previewText").css("color", new_color);
}

function evaluate_hex() {
  var in_h = $("#in_hex").val();

  $("#out_R").val(hexToVal(in_h, 0, 2));
  $("#out_G").val(hexToVal(in_h, 2, 4));
  $("#out_B").val(hexToVal(in_h, 4, 6));
  
  $("#previewBox").css("background-color", "#" + in_h); 
  $("#previewText").css("color", "#" + in_h);
}


//-- CLICK HANDLERS
//------------------------------------
$(function () { 
  $("#convert-form").on('click', '#rgbConvert', function(e) {
    e.preventDefault();
    evaluate_rgb();
  });

  $("#convert-form").on('click', '#hexConvert', function(e) {
    e.preventDefault();
    evaluate_hex();
  });
    
  // $("#clone").click(function () {
  //   $("#in_G, #in_B").attr("value", $("#in_R").val());
  //   evaluate_rgb();   
  // });
  
});


