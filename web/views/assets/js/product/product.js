/*=============================================
FlexSlider
=============================================*/

$("#carousel").flexslider({
  animation: "slide",
  controlNav: true,
  controlsContainer: false,
  directionNav: false,
  animationLoop: false,
  slideshow: true,
  itemWidth: 210,
  itemMargin: 5,
  asNavFor: "#slider",
});

$("#slider").flexslider({
  animation: "slide",
  controlNav: false,
  animationLoop: false,
  slideshow: false,
  sync: "#carousel",
});

/*=============================================
Cambiar variante
=============================================*/