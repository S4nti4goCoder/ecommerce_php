<?php

/*=============================================
Traer órdenes de compra
=============================================*/
$select = "*";
$url = "relations?rel=orders,variants,products,users&type=order,variant,product,user&linkTo=id_user_order&equalTo=" . $_SESSION["user"]->id_user . "&select=" . $select;
$method = "GET";
$fields = array();

$shopping = CurlController::request($url, $method, $fields);
if ($shopping->status == 200) {
    $shopping = $shopping->results;
} else {
    $shopping = array();
}

?>

<?php if (!empty($shopping)): ?>
    <div class="row list-2">
        <?php foreach ($shopping as $key => $value): ?>
            <div class="media border-bottom px-3 pt-4 pb-3 pb-lg-2">
                <a href="/<?php echo $value->url_product ?>">
                    <figure class="imgProduct">
                        <?php if ($value->type_variant == "gallery"): ?>
                            <img src="<?php echo $path ?>views/assets/img/products/<?php echo $value->url_product ?>/<?php echo json_decode($value->media_variant)[0] ?>" class="img-fluid" style="width:150px">
                        <?php else: $arrayYT = explode("/", $value->media_variant) ?>
                            <img src="http://img.youtube.com/vi/<?php echo end($arrayYT) ?>/maxresdefault.jpg" class="img-fluid bg-light" style="width:150px">
                        <?php endif ?>
                    </figure>
                </a>
                <div class="media-body ps-3">
                    <div class="row row-cols-1 row-cols-lg-2">
                        <div class="col">
                            <a href="/<?php echo $value->url_product ?>">
                                <h5><small class="text-uppercase text-muted"><?php echo $value->name_product ?></small></h5>
                            </a>
                            <div>
                                <small class="m-0"><?php echo $value->description_variant ?></small>
                                <small class="m-0">* <?php echo $value->quantity_order ?></small>
                            </div>
                            <h4 class="mt-2 font-weight-bold">
                                $
                                <?php
                                if ($value->offer_variant > 0) {
                                    echo number_format(($value->quantity_order * $value->offer_variant), 2);
                                } else {
                                    echo number_format(($value->quantity_order * $value->price_variant), 2);
                                }
                                ?>
                            </h4>
                        </div>
                        <div class="col">

                            <?php if ($value->type_variant == "gallery"): ?>

                            <!--==========================================
			                Línea de tiempo
			                ===========================================-->
			                <?php else: ?>

                            <?php endif ?>

                        </div>
                    </div>
                </div>
            </div>
        <?php endforeach ?>
    </div>
<?php else: ?>
    <?php include "views/pages/no-found/no-found.php" ?>
<?php endif ?>