<?php

class ProductsController
{
    // Gestion Subcategorias
    public function productManage()
    {
        if (isset($_POST["name_product"])) {
            echo '<script>
                fncMatPreloader("on");
                fncSweetAlert("loading", "", "");
            </script>';

            if (isset($_POST["idSubcategory"])) {
                if (isset($_FILES['image_subcategory']["tmp_name"]) && !empty($_FILES['image_subcategory']["tmp_name"])) {
                    $image = $_FILES['image_subcategory'];
                    $folder = "assets/img/subcategories/" . $_POST["url_subcategory"];
                    $name = $_POST["url_subcategory"];
                    $width = 1000;
                    $height = 600;

                    $saveImageSubcategory = TemplateController::saveImage($image, $folder, $name, $width, $height);
                } else {
                    $saveImageSubcategory = $_POST["old_image_subcategory"];
                }
                $fields = "name_subcategory=" . trim(TemplateController::capitalize($_POST["name_subcategory"])) . "&url_subcategory=" . $_POST["url_subcategory"] . "&image_subcategory=" . $saveImageSubcategory . "&description_subcategory=" . trim($_POST["description_subcategory"]) . "&keywords_subcategory=" . strtolower($_POST["keywords_subcategory"]) . "&id_category_subcategory=" . $_POST["id_category_subcategory"];

                $url = "subcategories?id=" . base64_decode($_POST["idSubcategory"]) . "&nameId=id_subcategory&token=" . $_SESSION["admin"]->token_admin . "&table=admins&suffix=admin";
                $method = "PUT";

                $updateData = CurlController::request($url, $method, $fields);

                if ($updateData->status == 200) {
                    echo '<script>
                        fncMatPreloader("off");
                        fncFormatInputs();
                        fncSweetAlert("success", "Sus datos han sido actualizados con éxito", "/admin/subcategorias");
                    </script>';
                } else {
                    if ($updateData->status == 303) {
                        echo '<script>
                            fncFormatInputs();
                            fncMatPreloader("off");
                            fncSweetAlert("error", "Token expirado, vuelva a iniciar sesión", "/salir");
                        </script>';
                    } else {
                        echo '<script>
                            fncFormatInputs();
                            fncMatPreloader("off");
                            fncToastr("error", "Ocurrió un error mientras se guardaban los datos, intente de nuevo");
                        </script>';
                    }
                }
            } else {
                //Validar y guardar la imagen
                if (isset($_FILES['image_product']["tmp_name"]) && !empty($_FILES['image_product']["tmp_name"])) {
                    $image = $_FILES['image_product'];
                    $folder = "assets/img/products/" . $_POST["url_product"];
                    $name = $_POST["url_product"];
                    $width = 1000;
                    $height = 600;

                    $saveImageProduct = TemplateController::saveImage($image, $folder, $name, $width, $height);
                } else {
                    echo '<script>
                    fncFormatInputs();
                    fncNotie(3, "El campo de imagen no puede ir vacío");
                </script>';
                    return;
                }

                //Validar y guardar la informacion de la categoria
                $fields = array(
                    "name_product" => trim(TemplateController::capitalize($_POST["name_product"])),
                    "url_product" => $_POST["url_product"],
                    "image_product" => $saveImageProduct,
                    "description_product" => trim($_POST["description_product"]),
                    "keywords_product" => strtolower($_POST["keywords_product"]),
                    "id_category_product" => $_POST["id_category_product"],
                    "id_subcategory_product" => $_POST["id_subcategory_product"],
                    "date_created_product" => date("Y-m-d")
                );

                $url = "products?token=" . $_SESSION["admin"]->token_admin . "&table=admins&suffix=admin";
                $method = "POST";

                $createData = CurlController::request($url, $method, $fields);

                if ($createData->status == 200) {
                    echo '<script>
                    fncMatPreloader("off");
                    fncFormatInputs();
                    fncSweetAlert("success", "Sus datos han sido creado con éxito", "/admin/productos");
                </script>';
                } else {
                    if ($createData->status == 303) {
                        echo '<script>
                        fncFormatInputs();
                        fncMatPreloader("off");
                        fncSweetAlert("error", "Token expirado, vuelva a iniciar sesión", "/salir");
                    </script>';
                    } else {
                        echo '<script>
                        fncFormatInputs();
                        fncMatPreloader("off");
                        fncToastr("error", "Ocurrió un error mientras de guardaban los datos, intente de nuevo");
                    </script>';
                    }
                }
            }
        }
    }
}
