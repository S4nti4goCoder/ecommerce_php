<div class="content-wrapper" style="min-height: 1504.4px;">
    <div class="content-header">
        <div class="container">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0"> <small>Plantillas</small></h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/admin">Tablero</a></li>
                        <li class="breadcrumb-item active">General</li>
                        <li class="breadcrumb-item active">Plantillas</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <?php
    if (!empty($routesArray[2])) {
        if ($routesArray[2] == "gestion") {
            include "modules/" . $routesArray[2] . ".php";
        } else {
            echo '<script>
                window.location = "' . $path . '404";
            </script>';
        }
    } else {
        include "modules/listado.php";
    }
    ?>

</div>
<script src="<?php echo $path ?>views/assets/js/templates/templates.js"></script>