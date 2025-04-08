/*=============================================
Aumentar y disminuir la cantidad
=============================================*/
$(document).on("click", ".btnInc", function () {
  var key = $(this).attr("key");
  if ($(this).attr("type") == "btnMin") {
    if (Number($(".showQuantity_" + key).val()) > 1) {
      $(".showQuantity_" + key).val(
        Number($(".showQuantity_" + key).val()) - 1
      );
    }
  }
  if ($(this).attr("type") == "btnMax") {
    $(".showQuantity_" + key).val(Number($(".showQuantity_" + key).val()) + 1);
  }

  /*=============================================
  Actualizamos el subtotal
  =============================================*/
  var quantity = $(".showQuantity_" + key).val();
  var price = $(".priceCart_" + key).html();

  $(".subtotalCart_" + key).html((Number(quantity) * Number(price)).toFixed(2));

  /*=============================================
  Actualizamos el total
  =============================================*/
  var sumaSubtotal = $(".subtotalCart");
  var total = 0;

  sumaSubtotal.each((i) => {
    total += Number($(sumaSubtotal[i]).html());
  });

  $(".totalCart").html(total.toFixed(2));

  /*=============================================
  Actualizamos la cesta
  =============================================*/
  var showQuantity = $(".showQuantity");
  var shoppingBasket = 0;

  showQuantity.each((i) => {
    shoppingBasket += Number($(showQuantity[i]).val());
  });

  $("#shoppingBasket").html(shoppingBasket);
  $("#totalShop").html(total.toFixed(2));

  /*=============================================
  Actualizamos base de datos
  =============================================*/
  var idCart = $(this).attr("idCart");

  var data = new FormData();
  data.append("token", localStorage.getItem("token-user"));
  data.append("idCartUpdate", idCart);
  data.append("quantityCartUpdate", quantity);
  $.ajax({
    url: "/ajax/forms.ajax.php",
    method: "POST",
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    success: function (response) {
      if (response == 200) {
        fncToastr("success", "El producto ha sido actualizado");
      }
    },
  });
});
