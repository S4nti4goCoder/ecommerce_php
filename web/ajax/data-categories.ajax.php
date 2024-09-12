<?php

require_once "../controllers/curl.controller.php";
require_once "../controllers/template.controller.php";

class DatatableController
{
    public function data()
    {
        if (!empty($_POST)) {
            //Capturando y organizando las variables POST y DataTable
            $draw = $_POST["draw"]; //Contador utilizado por DataTables para garantizar que los retornos de Ajax de las solicitudes de procesamiento del lado del sevidor sean dibujados en secuencia por DataTables.
            $orderByColumnIndex = $_POST["order"][0]["column"]; //Indice de la columna de clasificacion (0 basado en el indice, es decir, 0 es el primer registro).
            $orderBy = $_POST["columns"][$orderByColumnIndex]["data"]; //Obtener el nombre de la columna de clasificacion de su indice.
            $orderType = $_POST["order"][0]["dir"]; //Obtener el orden ASC o DESC.
            $start = $_POST["start"]; //Indicador de primer registro de paginacion.
            $length = $_POST["length"]; // Indicador de la longitud de la paginacion.

            //El total de registros de la data
            $url = "categories?select=id_category";
            $method = "GET";
            $fields = array();

            $response = CurlController::request($url, $method, $fields);

            if ($response->status == 200) {
                $totalData = $response->total;
            } else {
                echo '{
                    "Draw": 1,
                    "recordsTotal": 0,
                    "recordsFiltered": 0,
                    "data": []}';
                return;
            }
            $select = "*";

            //Busqueda de datos
            if (!empty($_POST['search']['value'])) {
                if (preg_match('/^[0-9A-Za-zñÑáéíóú ]{1,}$/', $_POST['search']['value'])) {
                    $linkTo = ["name_category", "url_category", "description_category", "keywords_category", "date_updated_category"];
                    $search = str_replace(" ", "_", $_POST['search']['value']);
                    foreach ($linkTo as $key => $value) {
                        $url = "categories?select=" . $select . "&linkTo=" . $value . "&search=" . $search . "&orderBy=" . $orderBy . "&orderMode=" . $orderType . "&startAt=" . $start . "&endAt=" . $length;

                        $data = CurlController::request($url, $method, $fields)->results;

                        if ($data == "Not Found") {

                            $data = array();
                            $recordsFiltered = 0;
                        } else {

                            $recordsFiltered = count($data);
                            break;
                        }
                    }
                } else {
                    echo '{
                    "Draw": 1,
                    "recordsTotal": 0,
                    "recordsFiltered": 0,
                    "data": []}';
                    return;
                }
            } else {
                //Seleccionar datos
                $url = "categories?select=" . $select . "&orderBy=" . $orderBy . "&orderMode=" . $orderType . "&startAt=" . $start . "&endAt=" . $length;
                $data = CurlController::request($url, $method, $fields)->results;
                $recordsFiltered = $totalData;
            }

            //Cuando la data viene vacia
            if (empty($data)) {
                echo '{
                    "Draw": 1,
                    "recordsTotal": 0,
                    "recordsFiltered": 0,
                    "data": []}';
                return;
            }

            //Construimos el dato JSON a regresar
            $dataJson = '{
                "Draw": ' . intval($draw) . ',
                "recordsTotal": ' . $totalData . ',
                "recordsFiltered": ' . $recordsFiltered . ',
                "data": [';
            foreach ($data as $key => $value) {
                //STATUS
                $status_category = $value->status_category;
                //TEXTOS

                $name_category = $value->name_category;
                $url_category = $value->url_category;
                $image_category = $value->image_category;
                $description_category = $value->description_category;
                $keywords_category = $value->keywords_category;
                $subcategories_category = $value->subcategories_category;
                $products_category = $value->products_category;
                $views_category = $value->views_category;
                $date_updated_category = $value->date_updated_category;

                $actions = "<div class='btn-group'>
                                <a href='/admin/categorias/gestion?admin=" . base64_encode($value->id_category) . "' class='btn bg-warning border-0 mr-2 btn-sm px-3'>
                                    <i class='fas fa-edit text-white'></i>
                                </a>
                                <button href='' class='btn bg-danger border-0 mr-2  btn-sm px-3 deleteItem' rol='admin' table='categories' column='category' idItem='" . base64_encode($value->id_category) . "'>
                                    <i class='fas fa-trash-alt text-white'></i>
                                </button>
                            </div>";
                $actions = TemplateController::htmlClean($actions);
                $dataJson .= '{
                        "id_category":"' . ($start + $key + 1) . '",
                        "status_category":"' . ($status_category) . '",
                        "name_category":"' . ($name_category) . '",
                        "url_category":"' . ($url_category) . '",
                        "image_category":"' . ($image_category) . '",
                        "description_category":"' . ($description_category) . '",
                        "keywords_category":"' . ($keywords_category) . '",
                        "subcategories_category":"' . ($subcategories_category) . '",
                        "products_category":"' . ($products_category) . '",
                        "views_category":"' . ($views_category) . '",
                        "date_updated_category":"' . ($date_updated_category) . '",
                        "actions":"' . $actions . '"
                    },';
            }
            $dataJson = substr($dataJson, 0, -1); //Este substr quita el ultimo caracter de la cadena, que es una coma, para impedir rompa la tabla
            $dataJson .= ']}';
            echo $dataJson;
        }
    }
}

//Activar funcion DataTable
$data = new DatatableController();
$data->data();
