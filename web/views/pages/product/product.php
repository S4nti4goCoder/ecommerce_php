<?php

$select = "id_product,name_product,url_product,info_product";
$url = "relations?rel=variants,products&type=variant,product&linkTo=url_product&equalTo=" . $routesArray[0] . "&select=" . $select;
$method = "GET";
$fields = array();

$product = CurlController::request($url, $method, $fields);

if ($product->status == 200) {
    $product = $product->results[0];
} else {
    echo '<script>
	    window.location = "/404";
	</script>';
}
//Traemos las variantes de los productos
if (!empty($product)) {
    $select = "*";
    $url = "variants?linkTo=id_product_variant&equalTo=" . $product->id_product . "&select=" . $select;
    $variants = CurlController::request($url, $method, $fields)->results;

    $product->variants = $variants;
}

?>

<div class="container-fluid bg-white">
    <hr style="color: #000;">
    <div class="container py-4">
        <div class="row row-cols-1 row-cols-md-2">
            <!-- Bloque galeria o video -->
            <div class="col">
                <figure class="blockMedia">
                    <?php if ($product->variants[0]->type_variant == "gallery"): ?>
                        <div id="slider" class="flexslider" style="margin-bottom:-4px">
                            <ul class="slides">
                                <?php foreach (json_decode($product->variants[0]->media_variant) as $key => $value): ?>
                                    <li>
                                        <img src="/views/assets/img/products/<?php echo $product->url_product ?>/<?php echo $value ?>" class="img-thumbnail">
                                    </li>
                                <?php endforeach ?>
                            </ul>
                        </div>
                        <div id="carousel" class="flexslider">
                            <ul class="slides">
                                <?php foreach (json_decode($product->variants[0]->media_variant) as $key => $value): ?>
                                    <li>
                                        <img src="/views/assets/img/products/<?php echo $product->url_product ?>/<?php echo $value ?>" class="img-thumbnail">
                                    </li>
                                <?php endforeach ?>
                            </ul>
                        </div>
                    <?php else: $video = explode("/", $product->variants[0]->media_variant); ?>
                        <iframe width="100%" height="315" src="https://www.youtube.com/embed/<?php echo end($video) ?>" title="Youtube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                    <?php endif ?>
                </figure>
            </div>
            <!-- Bloque info del producto -->
            <div class="col">
                <!-- Titulo -->
                <h1 class="d-none d-md-block text-center">
                    <?php echo $product->name_product ?>
                </h1>
                <!-- Precio y oferta -->
                <?php if ($product->variants[0]->offer_variant > 0): ?>
                    <div class="blockPrice">
                        <h5 class="my-3 text-center font-weight-bold text-danger">¡Aprovecha la PROMO y llévalo a un increíble precio!<br>↓↓↓</h5>
                        <h3 class="text-center">ANTES <s>$<?php echo number_format($product->variants[0]->price_variant, 2) ?></s></h3>
                        <h3 class="text-center">
                            <span class="text-success pt-4">AHORA $<?php echo number_format($product->variants[0]->offer_variant, 2) ?> </span>
                            <span class="ml-2 px-2 p-1 small rounded-pill" style="font-size: 16px; position:relative; top:-4px; border:2px solid #000 !important">
                                AHORRE $<?php echo number_format(($product->variants[0]->offer_variant - $product->variants[0]->price_variant), 2) ?>
                            </span>
                        </h3>
                    </div>
                <?php else: ?>
                    <div class="blockPrice">
                        <h2 class="text-center">
                            <span class="text-success pt-4">$<?php echo number_format($product->variants[0]->price_variant, 2) ?></span>
                        </h2>
                    </div>
                <?php endif ?>
                <!-- Variantes -->
                <?php if (count($product->variants) > 1): ?>
                    <div class="my-4">
                        <?php foreach ($product->variants as $key => $value): ?>
                            <label class="form-check-label" for="radio_<?php echo $key ?>">
                                <h4 class="text-center border rounded-pill py-2 px-4 btn bg-light">
                                    <div class="form-check font-weight-bold">
                                        <input
                                            type="radio"
                                            class="form-check-input changeVariant"
                                            variant='<?php echo json_encode($product->variants[$key]) ?>'
                                            url="<?php echo $product->url_product ?>"
                                            id="radio_<?php echo $key ?>"
                                            value="option_<?php echo $key ?>"
                                            name="optradio"
                                            <?php if ($key == 0): ?>checked<?php endif ?>>
                                        <?php echo $value->description_variant ?>
                                    </div>
                                </h4>
                            </label>
                        <?php endforeach ?>
                    </div>
                <?php endif ?>

                <!-- Boton de compra -->
                <div class="row my-4">
                    <div class="col-12 col-md-3">
                        <div class="input-group mb-3 mt-2">
                            <span class="input-group-text btnInc" type="btnMin"><i class="fas fa-minus"></i></span>
                            <input type="number" class="form-control text-center showQuantity" onwheel="return false;" value="1">
                            <span class="input-group-text btnInc" type="btnMin"><i class="fas fa-plus"></i></span>
                        </div>
                    </div>
                    <div class="col-12 col-md-9">
                        <button class="btn btn-dark btn-block font-weight-bold py-3">¡AGREGAR AL CARRITO!</button>
                    </div>
                </div>
                <!-- Descripcion del producto -->
                <div class="text-center">
                    <?php echo $product->info_product ?>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<?php echo $path ?>views/assets/js/product/product.js"></script>