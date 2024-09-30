<?php
if (isset($_GET["product"])) {
    $select = "id_product,name_product,url_product,image_product,description_product,keywords_product,id_category_product,id_subcategory_product,name_subcategory";
    $url = "relations?rel=products,subcategories&type=product,subcategory&linkTo=id_product&equalTo=" . base64_decode($_GET["product"]) . "&select=" . $select;
    $method = "GET";
    $fields = array();

    $product = CurlController::request($url, $method, $fields);
    if ($product->status == 200) {
        $product = $product->results[0];
    } else {
        $product = null;
    }
} else {
    $product = null;
}
?>

<div class="content pb-5">
    <div class="container">
        <div class="card">
            <form method="post" class="needs-validation" novalidate enctype="multipart/form-data">
                <?php if (!empty($product)): ?>
                    <input type="hidden" name="idProduct" value="<?php echo base64_encode($product->id_product) ?>">
                <?php endif ?>
                <div class="card-header">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-lg-6 text-center text-lg-left">
                                <h4>Agregar Producto</h4>
                            </div>
                            <div class="col-12 col-lg-6 mt-2 d-none d-lg-block">
                                <button type="submit" class="btn border-0 bg-success float-right py-2 px-3 btn-sm">Guardar Información</button>
                                <a href="/admin/productos" class="btn btn-default float-right py-2 px-3 btn-sm mr-2">Regresar</a>
                            </div>
                            <div class="col-12 text-center d-flex justify-content-center mt-2 d-block d-lg-none">
                                <div>
                                    <a href="/admin/productos" class="btn btn-default py-2 px-3 btn-sm mr-2">Regresar</a>
                                </div>
                                <div>
                                    <button type="submit" class="btn border-0 bg-success py-2 px-3 btn-sm ">Guardar Información</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <?php
                    require_once "controllers/products.controller.php";
                    $manage = new ProductsController();
                    $manage->productManage();
                    ?>
                    <!-- ====================================
                    PRIMER BLOQUE
                    ==================================== -->
                    <div class="row row-cols-1 row-cols-md-2">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <!-- ====================================
                                     Seleccionar la categoría
                                     ==================================== -->
                                    <div class="form-group pb-3">
                                        <?php if (!empty($product)): ?>
                                            <input type="hidden" name="old_id_category_product" value="<?php echo base64_encode($product->id_category_product) ?>">
                                        <?php endif ?>
                                        <label for="id_category_product">Seleccionar Categoría<sup class="text-danger">*</sup></label>
                                        <?php
                                        $url = "categories?select=id_category,name_category";
                                        $method = "GET";
                                        $fields = array();

                                        $categories = CurlController::request($url, $method, $fields);
                                        if ($categories->status == 200) {
                                            $categories = $categories->results;
                                        } else {
                                            $categories = array();
                                        }
                                        ?>
                                        <select
                                            class="custom-select"
                                            name="id_category_product"
                                            id="id_category_product"
                                            onchange="changeCategory(event)"
                                            required>
                                            <option value="">Selecciona Categoría</option>
                                            <?php foreach ($categories as $key => $value): ?>
                                                <option value="<?php echo $value->id_category ?>" <?php if (!empty($product) && $product->id_category_product == $value->id_category): ?>selected<?php endif ?>><?php echo $value->name_category ?></option>
                                            <?php endforeach ?>
                                        </select>
                                    </div>

                                    <!-- ====================================
                                     Seleccionar la subcategoría
                                     ==================================== -->
                                    <div class="form-group pb-3">
                                        <?php if (!empty($product)): ?>
                                            <input type="hidden" name="old_id_subcategory_product" value="<?php echo base64_encode($product->id_subcategory_product) ?>">
                                        <?php endif ?>
                                        <label for="id_subcategory_product">Seleccionar Subcategoría<sup class="text-danger">*</sup></label>
                                        <select
                                            class="custom-select"
                                            name="id_subcategory_product"
                                            id="id_subcategory_product"
                                            required>
                                            <?php if (!empty($product)): ?>
                                                <option value="<?php echo $product->id_subcategory_product ?>"><?php echo $product->name_subcategory ?></option>
                                            <?php else: ?>
                                                <option value="">Selecciona primero una Categoría</option>
                                            <?php endif ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <!-- ====================================
                                     Título del producto
                                     ==================================== -->
                                    <div class="form-group pb-3">
                                        <label for="name_product">Título <sup class="text-danger font-weight-bold">*</sup></label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Ingresar el título"
                                            id="name_product"
                                            name="name_product"
                                            onchange="validateDataRepeat(event, 'product')"
                                            <?php if (!empty($product)): ?> readonly <?php endif ?>
                                            value="<?php if (!empty($product)): ?><?php echo $product->name_product ?><?php endif ?>"
                                            required>

                                        <div class="valid-feedback"></div>
                                        <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                                    </div>

                                    <!-- ====================================
                                     URL del producto
                                     ==================================== -->
                                    <div class="form-group pb-3">
                                        <label for="url_product">URL <sup class="text-danger font-weight-bold">*</sup></label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            id="url_product"
                                            name="url_product"
                                            value="<?php if (!empty($product)): ?><?php echo $product->url_product ?><?php endif ?>"
                                            readonly
                                            required>

                                        <div class="valid-feedback"></div>
                                        <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ====================================
                    SEGUNDO BLOQUE
                    ==================================== -->
                    <div class="row row-cols-1 row-cols-md-2 pt-2">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">

                                    <!--=====================================
									Descripción del producto
									======================================-->
                                    <div class="form-group pb-3">
                                        <label for="description_product">Descripción<sup class="text-danger font-weight-bold">*</sup></label>
                                        <textarea
                                            rows="9"
                                            class="form-control mb-3"
                                            placeholder="Ingresar la descripción"
                                            id="description_product"
                                            name="description_product"
                                            onchange="validateJS(event,'complete')"
                                            required><?php if (!empty($product)): ?><?php echo $product->description_product ?><?php endif ?></textarea>
                                        <div class="valid-feedback">Válido.</div>
                                        <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                                    </div>

                                    <!-- ====================================
                                    Palabras clave del producto
                                    ==================================== -->
                                    <div class="form-group pb-3">
                                        <label for="keywords_product">Palabras clave<sup class="text-danger font-weight-bold">*</sup></label>
                                        <input
                                            type="text"
                                            class="form-control tags-input"
                                            data-role="tagsinput"
                                            placeholder="Ingresar las palabras clave"
                                            id="keywords_product"
                                            name="keywords_product"
                                            onchange="validateJS(event, 'complete-tags')"
                                            value="<?php if (!empty($product)): ?><?php echo $product->keywords_product ?><?php endif ?>"
                                            required>
                                        <div class="valid-feedback"></div>
                                        <div class="invalid-feedback">Por favor llena este campo correctamente.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <!-- ====================================
                                    Imagen del producto
                                    ==================================== -->
                                    <div class="form-group pb-3 text-center">
                                        <label class="pb-3 float-left">Imagen del Producto<sup class="text-danger"></sup></label>
                                        <label for="image_product">
                                            <?php if (!empty($product)): ?>
                                                <input type="hidden" value="<?php echo $product->image_product ?>" name="old_image_product">
                                                <img src="/views/assets/img/products/<?php echo $product->url_product ?>/<?php echo $product->image_product ?>" class="img-fluid changeImage">
                                            <?php else: ?>
                                                <img src="/views/assets/img/products/default/default-image.jpg" class="img-fluid changeImage">
                                            <?php endif ?>
                                            <p class="help-block small mt-3">Dimensiones recomendadas: 1000 x 600 pixeles | Peso Max. 2MB | Formato: PNG o JPG</p>
                                        </label>
                                        <div class="custom-file">
                                            <input
                                                type="file"
                                                class="custom-file-input"
                                                id="image_product"
                                                name="image_product"
                                                accept="image/*"
                                                maxSize="2000000"
                                                onchange="validateImageJS(event, 'changeImage')"
                                                <?php if (empty($product)): ?>
                                                required
                                                <?php endif ?>>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">Por favor llena este campo correctamente.</div>

                                            <label class="custom-file-label" for="image_product">Buscar Archivo</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ====================================
                    TERCER BLOQUE
                    ==================================== -->
                    <div class="row row-cols-1 pt-2">
                        <div class="col">
                            <div class="card">
                                <div class="card-body col-md-6 offset-md-3">
                                    <!-- ====================================
                                    Visor metadatos
                                    ==================================== -->
                                    <div class="form-group pb-3 text-center">
                                        <label>Visor Metadatos</label>
                                        <div class="d-flex justify-content-center">
                                            <div class="card">
                                                <div class="card-body">

                                                    <!-- ====================================
                                                    Visor imagen
                                                    ==================================== -->
                                                    <figure class="mb-2">
                                                        <?php if (!empty($product)): ?>
                                                            <img src="/views/assets/img/products/<?php echo $product->url_product ?>/<?php echo $product->image_product ?>" class="img-fluid metaImg" style="width:100%">
                                                        <?php else: ?>
                                                            <img src="/views/assets/img/products/default/default-image.jpg" class="img-fluid metaImg" style="width:100%">
                                                        <?php endif ?>
                                                    </figure>

                                                    <!-- ====================================
                                                    Visor titulo
                                                    ==================================== -->
                                                    <h6 class="text-left text-primary mb-1 metaTitle">
                                                        <?php if (!empty($product)): ?>
                                                            <?php echo $product->name_product ?>
                                                        <?php else: ?>
                                                            Lorem ipsum dolor sit
                                                        <?php endif ?>
                                                    </h6>

                                                    <!-- ====================================
                                                    Visor URL
                                                    ==================================== -->
                                                    <p class="text-left text-success small mb-1">
                                                        <?php echo $path ?><span class="metaUrl"><?php if (!empty($product)): ?><?php echo $product->url_product ?><?php else: ?>lorem<?php endif ?>
                                                        </span>
                                                    </p>

                                                    <!-- ====================================
                                                    Visor Descripción
                                                    ==================================== -->
                                                    <p class="text-left small mb-1 metaDescription">
                                                        <?php if (!empty($product)): ?>
                                                            <?php echo $product->description_product ?>
                                                        <?php else: ?>
                                                            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ducimus impedit ipsam obcaecati voluptas unde error quod odit ad sapiente vitae.
                                                        <?php endif ?>
                                                    </p>

                                                    <!-- ====================================
                                                    Visor Palabras claves
                                                    ==================================== -->
                                                    <p class="small text-left text-secondary metaTags">
                                                        <?php if (!empty($product)): ?>
                                                            <?php echo $product->keywords_product ?>
                                                        <?php else: ?>
                                                            lorem, ipsum, dolor, sit
                                                        <?php endif ?>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-lg-6 text-center text-lg-left mt-lg-3">
                                <label class="font-weight-light"><sup class="text-danger">*</sup>Campos obligatorios</label>
                            </div>
                            <div class="col-12 col-lg-6 mt-2 d-none d-lg-block">
                                <button type="submit" class="btn border-0 bg-success float-right py-2 px-3 btn-sm">Guardar Información</button>
                                <a href="/admin/categorias" class="btn btn-default float-right py-2 px-3 btn-sm mr-2">Regresar</a>
                            </div>
                            <div class="col-12 text-center d-flex justify-content-center mt-2 d-block d-lg-none">
                                <div>
                                    <a href="/admin/categorias" class="btn btn-default py-2 px-3 btn-sm mr-2">Regresar</a>
                                </div>
                                <div>
                                    <button type="submit" class="btn border-0 bg-success py-2 px-3 btn-sm ">Guardar Información</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- ====================================
Modal con libreria de iconos
==================================== -->
<div class="modal" id="myIcon">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Cambiar Icono</h4>
                <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body mx-3">
                <input type="text" class="form-control mt-4 mb-3 myInputIcon" placeholder="Buscar Icono">
                <?php
                $data = file_get_contents($path . "views/assets/json/fontawesome.json");
                $icons = json_decode($data);
                ?>
                <div
                    class="row row-cols-1 row-cols-sm-2 row-cols-md-4 py-3"
                    style="overflow-y: scroll; overflow-x: hidden; height:400px">
                    <?php foreach ($icons as $key => $value): ?>
                        <div class="col text-center py-4 btn btnChangeIcon" mode="<?php echo $value  ?>">
                            <i class="<?php echo $value ?> fa-2x"></i>
                        </div>
                    <?php endforeach ?>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-white btn-sm" data-bs-dismiss="modal">Salir</button>
            </div>
        </div>
    </div>
</div>