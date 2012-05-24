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

  $.each([$("#in_R"), $("#in_G"), $("#in_B")], function(i, field) {
    // Validate fields and prevent bad conversion
    
    if (!field.val() || field.val().length > 3) {
      field.addClass("invalid");
      return false;
    } else {
      // Fields OK - remove any invalid markers and perform conversion
      field.removeClass("invalid");

      var in_r = $("#in_R").val(), 
          in_g = $("#in_G").val(), 
          in_b = $("#in_B").val(),
          $out_h = $("#out_hex");

      var new_color = "#" + rgbToHex(in_r, in_g, in_b);
      
      $out_h.val(new_color);
      $("#previewBox").css("background-color", new_color); 
      $("#previewText").css("color", new_color);
    }
  });

}

function evaluate_hex() {

  var $in_h = $("#in_hex"),       // JQuery input object
       in_h = $("#in_hex").val(); // Actual hex input value

  if (in_h.charAt(0) === "#") {
    // Trim off '#' if present
      in_h = in_h.substr(1);
    }

  if (!in_h || [3,6].indexOf(in_h.length) === -1) {
    // Catch blank value or values not of length 3 or 6
    $in_h.addClass("invalid");
    return false;
  } else {
    $in_h.removeClass("invalid");

    if (in_h.length == 3) {
      // Dirty hack to coerce 3-digit number into 6
      in_h = in_h[0] + in_h[0] +
             in_h[1] + in_h[1] +
             in_h[2] + in_h[2];
    }

    $("#out_R").val(hexToVal(in_h, 0, 2));
    $("#out_G").val(hexToVal(in_h, 2, 4));
    $("#out_B").val(hexToVal(in_h, 4, 6));
    
    $("#previewBox").css("background-color", "#" + in_h); 
    $("#previewText").css("color", "#" + in_h);
  }

}


//-- CLICK HANDLERS
//------------------------------------
$(function () { 
  $("#convert-form").on('click', '#rgbConvert', function() {
    evaluate_rgb();
    return false;
  });

  $("#convert-form").on('click', '#hexConvert', function() {
    evaluate_hex();
    return false;
  });
    
  // $("#clone").click(function () {
  //   $("#in_G, #in_B").attr("value", $("#in_R").val());
  //   evaluate_rgb();   
  // });
  
});


