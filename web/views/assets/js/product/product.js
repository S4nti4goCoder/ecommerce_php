/*=============================================
FlexSlider
=============================================*/
function activateFlexSlider() {
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
}

activateFlexSlider();

/*=============================================
Cambiar variante
=============================================*/
$(document).on("change", ".changeVariant", function () {
  var variant = JSON.parse($(this).attr("variant"));
  var url = $(this).attr("url");
  console.log("variant: ", variant);

  /*=============================================
    Cambiar la galeria de imagenes
    =============================================*/
  if (variant.type_variant == "gallery") {
    $(".blockMedia").html(`
        <div id="slider" class="flexslider" style="margin-bottom:-4px">
            <ul class="slides"></ul>
        </div>
        <div id="carousel" class="flexslider">
            <ul class="slides"></ul>
        </div>
    `);
    var count = 0;
    JSON.parse(variant.media_variant).forEach((e, i) => {
      count++;
      $("#slider .slides").append(`
            <li><img src="/views/assets/img/products/${url}/${e}" class="img-thumbnail" /></li>
        `);
      $("#carousel .slides").append(`
            <li><img src="/views/assets/img/products/${url}/${e}" class="img-thumbnail" /></li>
        `);
      if (JSON.parse(variant.media_variant).length == count) {
        activateFlexSlider();
      }
    });
  }
});
