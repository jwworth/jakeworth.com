$(document).ready(function(){

    // Lightened versions of http://www.color-hex.com/color-palette/4216
    var colors = [
      '#e79dab',
      '#a5dbca',
      '#99e2ff',
      '#adc9e2'
    ];

    var randomColor = colors[Math.floor(Math.random() * colors.length)];
    $('.jumbotron').css({'background' : randomColor});
});
