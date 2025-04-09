<?php

class PaymentsController
{

    /*=============================================
	Actualizar datos y pasarelas de pago
	=============================================*/
    public function payment()
    {
        if (isset($_POST["optradio"])) {

            /*=============================================
    		Actualizar datos de usario en bd
    		=============================================*/
            $url = "users?id=" . $_SESSION["user"]->id_user . "&nameId=id_user&token=" . $_SESSION["user"]->token_user . "&table=users&suffix=user";
            $method = "PUT";
            $fields = "name_user=" . TemplateController::capitalize(trim($_POST["name_user"])) . "&country_user=" . explode("_", $_POST["country_user"])[0] . "&department_user=" . TemplateController::capitalize(trim($_POST["department_user"])) . "&city_user=" . TemplateController::capitalize(trim($_POST["city_user"])) . "&address_user=" . trim(urlencode($_POST["address_user"])) . "&phone_user=" . str_replace("+", "", explode("_", $_POST["country_user"])[1]) . "_" . str_replace("-", "", $_POST["phone_user"]);

            $updateUser = CurlController::request($url, $method, $fields);
            if ($updateUser->status == 200) {

                /*=============================================
				Traemos su carrito de compras
				=============================================*/
                $url = "relations?rel=carts,variants,products&type=cart,variant,product&linkTo=id_user_cart&equalTo=" . $_SESSION["user"]->id_user;
                $method = "GET";
                $fields = array();

                $carts = CurlController::request($url, $method, $fields);
                if ($carts->status == 200) {
                    $carts = $carts->results;
                    $totalCart = 0;

                    foreach ($carts as $key => $value) {
                        if ($value->offer_variant == 0) {
                            $totalCart += $value->price_variant * $value->quantity_cart;
                        } else {
                            $totalCart += $value->offer_variant * $value->quantity_cart;
                        }
                    }

                    echo '<pre>';
                    print_r($totalCart);
                    echo '</pre>';
                    $ref = TemplateController::genCodec(1000);

                    /*=============================================
					Pasarela de pagos de PayPal
					=============================================*/
                    if ($_POST["optradio"] == "paypal") {
                        $url = "v2/checkout/orders";
                        $method = "POST";
                        $fields = '{
                            "intent": "CAPTURE",
                            "purchase_units": [
                              {
                                "reference_id": "' . $ref . '",
                                "amount": {
                                  "currency_code": "USD",
                                  "value": "' . $totalCart . '"
                                }
                              }
                            ],
                            "payment_source": {
                              "paypal": {
                                "experience_context": {
                                  "payment_method_preference": "IMMEDIATE_PAYMENT_REQUIRED",
                                  "user_action": "PAY_NOW",
                                  "return_url": "' . TemplateController::path() . 'thanks?ref=' . $ref . '",
                                  "cancel_url": "' . TemplateController::path() . 'checkout"
                                }
                              }
                            }
                          }';

                        $paypal = CurlController::paypal($url, $method, $fields);
                        if ($paypal->status == "PAYER_ACTION_REQUIRED") {
                            $count = 0;
                            foreach ($carts as $key => $value) {
                                $url = "carts?id=" . $value->id_cart . "&nameId=id_cart&token=" . $_SESSION["user"]->token_user . "&table=users&suffix=user";
                                $method = "PUT";
                                $fields = "ref_cart=" . $ref . "&order_cart=" . $paypal->id . "&method_cart=" . $_POST["optradio"];

                                $updateCart = CurlController::request($url, $method, $fields);
                                $count++;
                                if ($count == count($carts)) {
                                    echo '<script>
										window.location ="' . $paypal->links[1]->href . '"
									</script>';
                                }
                            }
                        }
                    }

                    /*=============================================
					Pasarela de pagos de D-Local Go
					=============================================*/
                    if ($_POST["optradio"] == "dlocal") {
                        echo '<script>
                            window.location ="' . TemplateController::path() . 'thanks?ref=' . $ref . '"
                        </script>';
                    }

                    /*=============================================
					Pasarela de pagos de Mercado Pago
					=============================================*/
                    if ($_POST["optradio"] == "mercado_pago") {
                        echo '<script>
                            window.location ="' . TemplateController::path() . 'thanks?ref=' . $ref . '"
                        </script>';
                    }
                }
            }
        }
    }
}
