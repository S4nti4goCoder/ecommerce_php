<?php

class AdminsController
{
    // Login de administradores
    public function login()
    {
        if (isset($_POST["loginAdminEmail"])) {
            echo '<script>
                    fncMatPreloader("on");
                    fncSweetAlert("loading", "", "");
            </script>';
            if (preg_match('/^[.a-zA-Z0-9_]+([.][.a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["loginAdminEmail"])) {
                $url = "admins?login=true&suffix=admin";
                $method = "POST";
                $fields = array(
                    "email_admin" => $_POST["loginAdminEmail"],
                    "password_admin" => $_POST["loginAdminPass"]
                );
                $login = CurlController::request($url, $method, $fields);
                if ($login->status == 200) {
                    $_SESSION["admin"] = $login->results[0];
                    echo '<script>
                        location.reload();
                    </script>';
                } else {
                    $error = null;
                    if ($login->results == "Wrong email") {
                        $error = "La dirección de correo electrónico ingresada no es válida. Por favor, revisa y vuelve a intentarlo.";
                    } else {
                        $error = "Parece que la contraseña que ingresaste es incorrecta. Asegúrate de que sea la correcta e inténtalo nuevamente.";
                    }
                    echo '<div class="alert alert-danger mt-3">Error al ingresar: ' . $error . '</div> 
                    <script>
                        //fncNotie("error", "Error al ingresar: ' . $error . '");
                        //fncSweetAlert("error","Error al ingresar: ' . $error . '","");
                        fncToastr("error","Error al ingresar: ' . $error . '");
                        fncMatPreloader("off");
                        fncFormatInputs();
                    </script>
                    ';
                }
            } else {
                echo '<div class="alert alert-danger mt-3">Error de sintaxis en el formulario</div> 
                    <script>
                        fncToastr("error","Error de sintaxis en el formulario");
                        fncMatPreloader("off");
                        fncFormatInputs();
                    </script>
                    ';
            }
        }
    }
}
