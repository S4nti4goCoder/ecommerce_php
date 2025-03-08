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

  /*=============================================
  Cambiar precio
  =============================================*/
  if (variant.offer_variant > 0) {
    $(".blockPrice").html(`
      <h5 class="my-3 text-center font-weight-bold text-danger">¡Aprovecha la PROMO y llévalo a un increíble precio!<br>↓↓↓</h5>

			<h3 class="text-center">ANTES 
				<s>$${Number(variant.price_variant).toFixed(2)}</s>
			</h3>

			<h3 class="text-center">
				<span class="text-success pt-4">AHORA ${Number(variant.offer_variant).toFixed(
          2
        )}</span>
				<span class="ml-2 px-2 p-1 small rounded-pill" 
				style="font-size: 16px; position:relative; top:-4px; border:2px solid #000 !important">
					AHORRE $${(
            Number(variant.offer_variant) - Number(variant.price_variant)
          ).toFixed(2)}			
				</span>
			</h3>
    `);
  } else {
    $(".blockPrice").html(`

      <h2 class="text-center"><span class="text-success pt-4">$${Number(
        variant.price_variant
      ).toFixed(2)}</span></h2>  
   `);
  }

  /*=============================================
  Cambiar fecha de finalización oferta
  =============================================*/
  if (variant.offer_variant > 0) {
    $(".countdown").show();
    if (variant.end_offer_variant != "0000-00-00") {
      $(".countdown").attr("ddate", variant.end_offer_variant);
      countDown();
    } else {
      $(".countdown").attr(
        "ddate",
        new Date().getFullYear() +
          "-" +
          new Date().getMonth() +
          "-" +
          new Date().getDay()
      );
      countDown();
    }
  } else {
    $(".countdown").hide();
  }
});

/*=============================================
Aplicar Sticky al bloque Media
=============================================*/
if (window.matchMedia("(min-width:768px)").matches) {
  var sticky = new Sticky(".blockMedia");
  var topMedia = $(".blockMedia").offset().top;

  $(window).scroll(function (event) {
    var scrollTop = $(window).scrollTop();
    var footerTop = $(".footerBlock").offset().top;
    var blockMedia = $(".blockMedia").height();

    if (scrollTop > footerTop - blockMedia) {
      $(".blockMedia")[0].sticky.active = false;
      $(".blockMedia").css({
        position: "relative",
        left: "0px",
        top: footerTop - (blockMedia + topMedia) + "px",
      });
    } else {
      $(".blockMedia")[0].sticky.active = true;
    }
  });
}
