<div class="card bg-white">
    <div class="p-4">
        <div class="form-check border px-2 clearfix mb-3">
            <input type="radio" class="form-check-input mt-2 ml-1" id="radio1" name="optradio" value="paypal" checked>
            <label for="radio1" class="form-check-label float-right">
                <span>
                    Pagar con PayPal
                    <img src="/views/assets/img/template/paypal.jpg" class="img-fluid" style="width:200px">
                </span>
            </label>
        </div>
        <button type="submit" class="btn btn-default btn-block templateColor border-0 rounded py-2">Proceder al pago</button>

        <?php
        require_once "controllers/payments.controller.php";
        $payment = new PaymentsController();
        $payment->payment();
        ?>
        
    </div>
</div>