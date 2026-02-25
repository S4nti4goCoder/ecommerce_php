<?php

use PHPMailer\PHPMailer\PHPMailer;
// Eliminado: use PHPMailer\PHPMailer\Exception;  ← no se usa

class TemplateController
{

	/*=============================================
    Traemos la Vista Principal de la plantilla
    =============================================*/

	public function index()
	{
		include "views/template.php";
	}

	/*=============================================
    Ruta Principal o Dominio del sitio
    =============================================*/

	static public function path()
	{
		if (!empty($_SERVER["HTTPS"]) && ("on" == $_SERVER["HTTPS"])) {
			return "https://" . $_SERVER["SERVER_NAME"] . "/";
		} else {
			return "http://" . $_SERVER["SERVER_NAME"] . "/";
		}
	}

	/*=============================================
    Función para enviar correos electrónicos
    =============================================*/

	static public function sendEmail($subject, $email, $title, $message, $link)
	{
		date_default_timezone_set("America/Bogota");

		$mail = new PHPMailer;

		$mail->CharSet = 'utf-8';
		//$mail->Encoding = 'base64'; // Habilitar al subir el sistema a un hosting

		$mail->isMail();
		$mail->UseSendmailOptions = 0;

		$mail->setFrom("noreply@ecommerce.com", "Ecommerce");

		if ($email == null) {
			$email = "admin@ecommerce.com";
		}

		$mail->Subject = $subject;
		$mail->addAddress($email);

		$mail->msgHTML('<div style="width:100%; background:#eee; position:relative; font-family:sans-serif; padding-top:40px; padding-bottom: 40px;">
            <div style="position:relative; margin:auto; width:600px; background:white; padding:20px">
                <center>
                    <img src="' . TemplateController::path() . 'views/assets/img/template/1/logo.png" style="padding:20px; width:30%">
                    <h3 style="font-weight:100; color:#999">' . $title . '</h3>
                    <hr style="border:1px solid #ccc; width:80%">
                    ' . $message . '
                    <a href="' . $link . '" target="_blank" style="text-decoration: none;">
                        <div style="line-height:25px; background:#000; width:60%; padding:10px; color:white; border-radius:5px">Haz clic aquí</div>
                    </a>
                    <br>
                    <hr style="border:1px solid #ccc; width:80%">
                    <h5 style="font-weight:100; color:#999">Si no solicitó el envío de este correo, comuníquese con nosotros de inmediato.</h5>
                </center>
            </div>
        </div>');

		$send = $mail->Send();

		if (!$send) {
			return $mail->ErrorInfo;
		} else {
			return "ok";
		}
	}

	/*=============================================
    Función Limpiar HTML
    =============================================*/

	static public function htmlClean($code)
	{
		$search = array('/\>[^\S ]+/s', '/[^\S ]+\</s', '/(\s)+/s');
		$replace = array('>', '<', '\\1');
		$code = preg_replace($search, $replace, $code);
		$code = str_replace("> <", "><", $code);
		return $code;
	}

	/*=============================================
    Función para mayúscula inicial
    =============================================*/

	static public function capitalize($value)
	{
		$value = mb_convert_case($value, MB_CASE_TITLE, "UTF-8");
		return $value;
	}

	/*=============================================
    Función Reducir texto
    =============================================*/

	static public function reduceText($value, $limit)
	{
		if (strlen($value) > $limit) {
			$value = substr($value, 0, $limit) . "...";
		}
		return $value;
	}

	/*=============================================
    Función para almacenar imágenes
    =============================================*/

	static public function saveImage($image, $folder, $name, $width, $height)
	{
		if (isset($image["tmp_name"]) && !empty($image["tmp_name"])) {

			$directory = strtolower("views/" . $folder);

			if (!file_exists($directory)) {
				mkdir($directory, 0755);
			}

			list($lastWidth, $lastHeight) = getimagesize($image["tmp_name"]);

			if ($lastWidth < $width || $lastHeight < $height) {
				$lastWidth = $width;
				$lastHeight = $height;
			}

			if ($image["type"] == "image/jpeg") {
				$newName = $name . '.jpg';
				$folderPath = $directory . '/' . $newName;

				if (isset($image["mode"]) && $image["mode"] == "base64") {
					file_put_contents($folderPath, file_get_contents($image["tmp_name"]));
				} else {
					$start = imagecreatefromjpeg($image["tmp_name"]);
					$end = imagecreatetruecolor($width, $height);
					imagecopyresized($end, $start, 0, 0, 0, 0, $width, $height, $lastWidth, $lastHeight);
					imagejpeg($end, $folderPath);
				}
			}

			if ($image["type"] == "image/png") {
				$newName = $name . '.png';
				$folderPath = $directory . '/' . $newName;

				if (isset($image["mode"]) && $image["mode"] == "base64") {
					file_put_contents($folderPath, file_get_contents($image["tmp_name"]));
				} else {
					$start = imagecreatefrompng($image["tmp_name"]);
					$end = imagecreatetruecolor($width, $height);
					imagealphablending($end, FALSE);
					imagesavealpha($end, TRUE);
					imagecopyresampled($end, $start, 0, 0, 0, 0, $width, $height, $lastWidth, $lastHeight);
					imagepng($end, $folderPath);
				}
			}

			if ($image["type"] == "image/gif") {
				$newName = $name . '.gif';
				$folderPath = $directory . '/' . $newName;

				if (isset($image["mode"]) && $image["mode"] == "base64") {
					file_put_contents($folderPath, file_get_contents($image["tmp_name"]));
				} else {
					move_uploaded_file($image["tmp_name"], $folderPath);
				}
			}

			return $newName;
		} else {
			return "error";
		}
	}

	/*=============================================
    Función para generar códigos alfanuméricos aleatorios
    =============================================*/

	static public function genPassword($length)
	{
		$password = "";
		$chain = "0123456789abcdefghijklmnopqrstuvwxyz";
		$password = substr(str_shuffle($chain), 0, $length);
		return $password;
	}

	/*=============================================
    Función para redireccionar al mismo lugar
    =============================================*/

	static public function urlRedirect()
	{
		if (!empty($_SERVER["HTTPS"]) && ("on" == $_SERVER["HTTPS"])) {
			return "https://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
		} else {
			return "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
		}
	}

	/*=============================================
    Función para generar códigos numéricos aleatorios
    =============================================*/

	static public function genCodec($length)
	{
		$codec = rand(1 * $length, (10 * $length) - 1) . time();
		return $codec;
	}

	/*=============================================
    Convertidor de moneda (con fallback a Bogotá)
    =============================================*/

	static public function exchange($type)
	{
		static $geoData = null;

		if ($geoData === null) {
			$context = stream_context_create([
				'http' => ['header' => "User-Agent: Mozilla/5.0 (compatible; EcommerceApp/1.0)\r\n"]
			]);
			$json = @file_get_contents("http://ip-api.com/json", false, $context);

			if ($json === false) {
				$geoData = (object)[
					'timezone' => 'America/Bogota',
					'country'  => 'Colombia',
					'currency' => 'COP',
					'status'   => 'fail'
				];
			} else {
				$geoData = json_decode($json);
				if (json_last_error() !== JSON_ERROR_NONE || !isset($geoData->status) || $geoData->status !== 'success') {
					$geoData = (object)[
						'timezone' => 'America/Bogota',
						'country'  => 'Colombia',
						'currency' => 'COP',
						'status'   => 'fail'
					];
				}
			}
		}

		if ($type == "currency") {
			return 1; // Ajusta si necesitas conversión real
		}

		if ($type == "country") {
			return $geoData->country ?? "Colombia";
		}

		if ($type == "ip") {
			return $geoData->query ?? $_SERVER['REMOTE_ADDR'];
		}

		if ($type == "timezone") {
			return $geoData->timezone ?? "America/Bogota";
		}

		return "error";
	}

	/*=============================================
    Función para dar formato a las fechas (reemplazo moderno sin strftime)
    =============================================*/

	static public function formatDate($type, $value)
	{
		// Fijamos timezone una vez (mejor práctica: setearlo globalmente si es posible)
		date_default_timezone_set(TemplateController::exchange("timezone"));

		// Usamos IntlDateFormatter para localización en español (Colombia o España)
		$formatter = new IntlDateFormatter(
			'es_CO',                          // Locale: es_CO para Colombia, o es_ES para España
			IntlDateFormatter::LONG,          // Estilo de fecha
			IntlDateFormatter::NONE,          // Sin hora
			TemplateController::exchange("timezone"), // Timezone
			IntlDateFormatter::GREGORIAN
		);

		$date = new DateTime($value);

		// Ajustamos el patrón según $type (similar a tus formatos originales)
		switch ($type) {
			case 1: // "30 abril, 2025" → dd MMMM, yyyy
				$formatter->setPattern("d MMMM, yyyy");
				break;

			case 2: // "abr 2025" → MMM yyyy
				$formatter->setPattern("MMM yyyy");
				break;

			case 3: // "30 - 04 - 2025" → dd - MM - yyyy
				$formatter->setPattern("dd - MM - yyyy");
				break;

			case 4: // "30/04/2025" → dd/MM/yyyy
				$formatter->setPattern("dd/MM/yyyy");
				break;

			default:
				$formatter->setPattern("d MMMM, yyyy");
		}

		return $formatter->format($date);
	}
}
