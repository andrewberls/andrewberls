$form = $('#convert-form');

$(function() {
  // Load RGB convert initially
  $form.load('forms/rgb_form.html');

  // Handle navbar display
  $('#navbar li a').click(function() {
    $('#navbar li a').removeClass('current');
    $(this).addClass('current');
  });

  // Load appropriate form on navbar click
  $("#loadRGB").click(function() {
    $form.load('forms/rgb_form.html', function() {
      evaluate_rgb();
    });
  });

  $("#loadHex").click(function() {
    $form.load('forms/hex_form.html', function() {
      evaluate_hex();
    });
  });

});
