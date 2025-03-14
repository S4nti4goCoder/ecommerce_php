<?php
class UsersController
{
    /*=============================================
	Registro de usuarios
	=============================================*/
    public function register()
    {
        if (isset($_POST["email_user"])) {
            echo '<script>
				fncMatPreloader("on");
				fncSweetAlert("loading", "procesando...", "");
		    </script>';
            if (
                preg_match('/^[A-Za-zñÑáéíóúÁÉÍÓÚ ]{1,}$/', $_POST["name_user"]) &&
                preg_match('/^[.a-zA-Z0-9_]+([.][.a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/', $_POST["email_user"])
            ) {
                /*=============================================
				Registro de Usuarios
				=============================================*/
                $url = "users?register=true&suffix=user";
                $method = "POST";
                $fields = array(
                    "name_user" => TemplateController::capitalize(trim($_POST["name_user"])),
                    "email_user"  => $_POST["email_user"],
                    "password_user" => $_POST["password_user"],
                    "method_user" => "directo",
                    "verification_user" => 0,
                    "confirm_user" => TemplateController::genPassword(20),
                    "date_created_user" => date("Y-m-d")
                );
                $register = CurlController::request($url, $method, $fields);
                if ($register->status == 200) {
                    echo '<script>
								fncFormatInputs();
								fncMatPreloader("off");
								fncToastr("success", "Su cuenta ha sido creada, revisa tu correo electrónico para activar tu cuenta");
					</script>';
                }
            } else {
                echo '<div class="alert alert-danger mt-3">Error de sintaxis en los campos</div>
				<script>
				    fncToastr("error","Error de sintaxis en los campos");
					fncMatPreloader("off");
					fncFormatInputs();
				</script>
				';
            }
        }
    }
}
