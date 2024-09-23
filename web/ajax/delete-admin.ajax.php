<?php

require_once "../controllers/curl.controller.php";

class DeleteController
{
    public $token;
    public $table;
    public $id;
    public $nameId;

    public function ajaxDelete()
    {
        if ($this->table == "admins" && base64_decode($this->id) == "1") {
            echo "no-borrar";
            return;
        }

        if ($this->table == "categories") {
            $select = "url_category,image_category,subcategories_category";
            $url = "categories?linkTo=id_category&equalTo=" . base64_decode($this->id) . "&select=" . $select;
            $method = "GET";
            $fields = array();

            $dataItem = CurlController::request($url, $method, $fields)->results[0];

            //No borrar categoría si tiene subcategorías vinculadas
            if ($dataItem->subcategories_category > 0) {
                echo "no-borrar";
                return;
            }

            //Borrar imagen
            unlink("../views/assets/img/categories/" . $dataItem->url_category . "/" . $dataItem->image_category);

            //Borrar directorio
            rmdir("../views/assets/img/categories/" . $dataItem->url_category);
        }

        if ($this->table == "subcategories") {
            $select = "url_subcategory,image_subcategory,products_subcategory";
            $url = "subcategories?linkTo=id_subcategory&equalTo=" . base64_decode($this->id) . "&select=" . $select;
            $method = "GET";
            $fields = array();

            $dataItem = CurlController::request($url, $method, $fields)->results[0];

            //No borrar subcategoría si tiene productos vinculados
            if ($dataItem->products_subcategory > 0) {
                echo "no-borrar";
                return;
            }

            //Borrar imagen
            unlink("../views/assets/img/subcategories/" . $dataItem->url_subcategory . "/" . $dataItem->image_subcategory);

            //Borrar directorio
            rmdir("../views/assets/img/subcategories/" . $dataItem->url_subcategory);
        }

        $url = $this->table . "?id=" . base64_decode($this->id) . "&nameId=" . $this->nameId . "&token=" . $this->token . "&table=admins&suffix=admin";
        $method = "DELETE";
        $fields = array();

        $delete = CurlController::request($url, $method, $fields);

        echo $delete->status;
    }
}

if (isset($_POST["token"])) {
    $Delete = new DeleteController();
    $Delete->token = $_POST["token"];
    $Delete->table = $_POST["table"];
    $Delete->id = $_POST["id"];
    $Delete->nameId = $_POST["nameId"];
    $Delete->ajaxDelete();
}
