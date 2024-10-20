// Validación Bootstrap 5
(function () {
  "use strict";
  window.addEventListener(
    "load",
    function () {
      // Get the forms we want to add validation styles to
      var forms = document.getElementsByClassName("needs-validation");
      // Loop over them and prevent submission
      var validation = Array.prototype.filter.call(forms, function (form) {
        form.addEventListener(
          "submit",
          function (event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add("was-validated");
          },
          false
        );
      });
    },
    false
  );
})();

// Función para validar datos repetidos
function validateDataRepeat(event, type) {
  if (type == "category") {
    var table = "categories";
    var linkTo = "name_category";
  }
  if (type == "subcategory") {
    var table = "subcategories";
    var linkTo = "name_subcategory";
  }
  if (type == "product") {
    var table = "products";
    var linkTo = "name_product";
  }
  var value = event.target.value;

  var data = new FormData();
  data.append("table", table);
  data.append("equalTo", value);
  data.append("linkTo", linkTo);

  $.ajax({
    url: "/ajax/forms.ajax.php",
    method: "POST",
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    success: function (response) {
      if (response == 404) {
        validateJS(event, "complete");
        createUrl(event, "url_" + type);
        $(".metaTitle").html(value);
      } else {
        $(event.target).parent().addClass("was-validated");
        $(event.target)
          .parent()
          .children(".invalid-feedback")
          .html("El nombre ya existe en la base de datos");

        event.target.value = "";
        return;
      }
    },
  });
}

// Función para crear Url's
function createUrl(event, input) {
  var value = event.target.value;
  value = value.toLowerCase();
  value = value.replace(
    /[#\\;\\$\\&\\%\\=\\(\\)\\:\\,\\'\\"\\.\\¿\\¡\\!\\?\\]/g,
    ""
  );
  value = value.replace(/[ ]/g, "-");
  value = value.replace(/[á]/g, "a");
  value = value.replace(/[é]/g, "e");
  value = value.replace(/[í]/g, "i");
  value = value.replace(/[ó]/g, "o");
  value = value.replace(/[ú]/g, "u");
  value = value.replace(/[ñ]/g, "n");

  $('[name="' + input + '"]').val(value);
  $(".metaUrl").html(value);
}

// Función para validar formularios
function validateJS(event, type) {
  $(event.target).parent().addClass("was-validated");
  if (type == "email") {
    var pattern =
      /^[.a-zA-Z0-9_]+([.][.a-zA-Z0-9_]+)*[@][a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,4}$/;
    if (!pattern.test(event.target.value)) {
      $(event.target)
        .parent()
        .children(".invalid-feedback")
        .html("El correo electrónico está mal escrito");
      event.target.value = "";
      return;
    }
  }
  if (type == "text") {
    var pattern = /^[A-Za-zñÑáéíóúÁÉÍÓÚ ]{1,}$/;
    if (!pattern.test(event.target.value)) {
      $(event.target)
        .parent()
        .children(".invalid-feedback")
        .html("El campo solo debe contener texto");
      event.target.value = "";
      return;
    }
  }
  if (type == "password") {
    var pattern = /^[*\\$\\!\\¡\\¿\\?\\.\\_\\#\\-\\0-9A-Za-z]{1,}$/;
    if (!pattern.test(event.target.value)) {
      $(event.target)
        .parent()
        .children(".invalid-feedback")
        .html("La contraseña no puede llevar ciertos caracteres especiales");
      event.target.value = "";
      return;
    }
  }
  if (type == "complete") {
    var pattern =
      /^[-\\(\\)\\=\\%\\&\\$\\;\\_\\*\\"\\'\\#\\?\\¿\\!\\¡\\:\\,\\.\\/\\0-9a-zA-ZñÑáéíóúÁÉÍÓÚ ]{1,}$/;
    if (!pattern.test(event.target.value)) {
      $(event.target)
        .parent()
        .children(".invalid-feedback")
        .html("La entrada tiene errores de caracteres especiales");
      event.target.value = "";
      return;
    } else {
      $(".metaDescription").html(event.target.value);
    }
  }
  if (type == "complete-tags") {
    var pattern =
      /^[-\\(\\)\\=\\%\\&\\$\\;\\_\\*\\"\\'\\#\\?\\¿\\!\\¡\\:\\,\\.\\/\\0-9a-zA-ZñÑáéíóúÁÉÍÓÚ ]{1,}$/;
    if (!pattern.test(event.target.value)) {
      $(event.target)
        .parent()
        .children(".invalid-feedback")
        .html("La entrada tiene errores de caracteres especiales");
      event.target.value = "";
      return;
    } else {
      $(".metaTags").html(event.target.value);
    }
  }
}

// Función para recordar email en el login
function rememberEmail(event) {
  if (event.target.checked) {
    localStorage.setItem("emailAdmin", $('[name="loginAdminEmail"]').val());
    localStorage.setItem("checkRem", true);
  } else {
    localStorage.removeItem("emailAdmin");
    localStorage.removeItem("checkRem");
  }
}

function getEmail() {
  if (localStorage.getItem("emailAdmin") != null) {
    $('[name="loginAdminEmail"]').val(localStorage.getItem("emailAdmin"));
  }
  if (
    localStorage.getItem("checkRem") != null &&
    localStorage.getItem("checkRem")
  ) {
    $("#remember").attr("checked", true);
  }
}
getEmail();

//Cambio de icono para la categoria
function addIcon(event) {
  $("#myIcon").show();
  $(document).ready(function () {
    $(".myInputIcon").on("keyup", function () {
      var value = $(this).val().toLowerCase();

      $(".btnChangeIcon").filter(function () {
        $(this).toggle($(this).attr("mode").toLowerCase().indexOf(value) > -1);
      });
    });
  });
  $(document).on("click", ".btnChangeIcon", function (e) {
    e.preventDefault();
    $(".iconView").html(`<i class="` + $(this).attr("mode") + `"></i>`);
    $(event.target).val($(this).attr("mode"));
    $("#myIcon").hide();
  });
}

$(document).on("click", '[data-bs-dismiss="modal"]', function () {
  var modal = $(".modal");
  modal.each((i) => {
    $(modal[i]).hide();
  });
});

//Tags Input
if ($(".tags-input").length > 0) {
  $(".tags-input").tagsinput({
    maxTags: 5,
  });
}

//Validamos imagen
function validateImageJS(event, tagImg) {
  fncSweetAlert("loading", "", "");
  var image = event.target.files[0];
  if (image == undefined) {
    fncSweetAlert("close", "", "");
    return;
  }
  //Validamos el formato
  if (
    image["type"] !== "image/jpeg" &&
    image["type"] !== "image/png" &&
    image["type"] !== "image/gif"
  ) {
    fncSweetAlert(
      "error",
      "La imagen debe estar en formato JPG, GIF O PNG.",
      null
    );
    return;
  }
  //Validamos el tamaño
  else if (image["size"] > 2000000) {
    fncSweetAlert("error", "La imagen debe ser superior a 2MB", null);
    return;
  }

  //Mostramos la imagen temporal
  else {
    var data = new FileReader();
    data.readAsDataURL(image);
    $(data).on("load", function (event) {
      var path = event.target.result;
      fncSweetAlert("close", "", "");
      $("." + tagImg).attr("src", path);
      $(".metaImg").attr("src", path);
    });
  }
}

//Traer subcategorias de acuerdo a la categoría seleccionada
function changeCategory(event) {
  $("#id_subcategory_product").html(
    `<option value="">Selecciona Subcategoría</option>`
  );

  var idCategory = event.target.value;

  var data = new FormData();
  data.append("idCategory", idCategory);

  $.ajax({
    url: "/ajax/forms.ajax.php",
    method: "POST",
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    success: function (response) {
      if (JSON.parse(response).length > 0) {
        JSON.parse(response).forEach((v) => {
          $("#id_subcategory_product").append(
            `
            <option value="` +
              v.id_subcategory +
              `">` +
              v.name_subcategory +
              `</option>
          `
          );
        });
      }
    },
  });
}

//summernote
if ($(".summernote").length > 0) {
  $(".summernote").summernote({
    minHeight: 500,
    prettifyHtml: false,
    followingToolbar: true,
    codemirror: {
      //codemirror options
      mode: "application/xml",
      styleActiveLine: true,
      lineNumbers: true,
      lineWrapping: true,
    },
    toolbar: [
      ["misc", ["codeview", "undo", "redo"]],
      ["style", ["bold", "italic", "underline", "clear"]],
      ["para", ["style", "ul", "ol", "paragraph", "height"]],
      ["fontsize", ["fontsize"]],
      ["color", ["color"]],
      ["insert", ["link", "picture", "hr", "video", "table", "emoji"]],
    ],
    callbacks: {
      onImageUpload: function (files) {
        fncSweetAlert("loading", "Cargando imagen...", "");
        for (var i = 0; i < files.length; i++) {
          upload(files[i]);
        }
      },
    },
  });
}
//Acicionar fondo blanco al toolbar de summernote
if ($(".note-toolbar").length > 0) {
  $(".note-toolbar").addClass("bg-white");

  //Adicionar iconos al toolbar de summernote
  $(".emoji-picker").removeClass("fa-smile-o");
  $(".emoji-picker").addClass("fa-smile");

  $("[aria-label='More Color']").html(`<i class="fas fa-caret-down"></i>`);
}

//Subir imagen al servidor
function upload(file) {
  var data = new FormData();
  data.append("file", file, file.name);

  $.ajax({
    url: "/ajax/upload.ajax.php",
    method: "POST",
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    success: function (response) {
      fncSweetAlert("close", null, null);

      switch (response) {
        case "size":
          fncNotie(3, "Error: la imagen debe pesar menos de 10MB");
          return;
          break;
        case "type":
          fncNotie(3, "Error: la imagen debe ser formato JPG, PNG o GIF");
          return;
          break;
        case "process":
          fncNotie(3, "Error en el proceso de subir la imagen");
          return;
          break;
      }
      $(".summernote").summernote("insertImage", response, function ($image) {
        $image.attr("class", "img-fluid");
        $image.css("width", "100%");
      });
      console.log("response: ", response);
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log("jqXHR", jqXHR);
      if (response == "type") {
        fncNotie(3, textStatus + " " + errorThrown);
        return;
      }
    },
  });
}

//Cambio de variante: Galería o video
function changeVariant(event, item) {
  if (event.target.value == "video") {
    $(".inputVideo_" + item).show();
    $(".iframeYoutube_" + item).show();
    $(".dropzone_" + item).hide();
    $(".galleryProduct_" + item).hide();
  } else {
    $(".inputVideo_" + item).hide();
    $(".iframeYoutube_" + item).hide();
    $(".dropzone_" + item).show();
    $(".galleryProduct_" + item).show();
  }
}

//Dropzone
Dropzone.autoDiscover = false;

$(".dropzone").dropzone({
  url: "/",
  addRemoveLinks: true,
  acceptedFiles: "image/jpeg, image/png, image/gif",
  maxFilesize: 10,
  maxFiles: 10,
  init: function () {
    var elem = $(this.element);
    var arrayFiles = [];
    var countArrayFiles = 0;
    this.on("addedfile", function (file) {
      countArrayFiles++;
      setTimeout(function () {
        arrayFiles.push({
          file: file.dataURL,
          type: file.type,
          width: file.width,
          height: file.height,
        });
        elem
          .parent()
          .children(".galleryProduct_1")
          .val(JSON.stringify(arrayFiles));
      }, 500 * countArrayFiles);
    });
    this.on("removedfile", function (file) {
      countArrayFiles++;
      setTimeout(function () {
        var index = arrayFiles.indexOf({
          file: file.dataURL,
          type: file.type,
          width: file.width,
          height: file.height,
        });
        arrayFiles.splice(index, 1);
        elem
          .parent()
          .children(".galleryProduct_1")
          .val(JSON.stringify(arrayFiles));
      }, 500 * countArrayFiles);
    });
    myDropzone = this;
    $(".saveBtn").click(function () {
      if (arrayFiles.length >= 1) {
        myDropzone.processQueue();
      } else {
        fncSweetAlert("error", "La galería no puede estar vacía", null);
        return;
      }
    });
  },
});

//Insertar video de youtube
function changeVideo(event, item) {
  var idYoutube = event.target.value.split("/").slice(-1);
  $(".iframeYoutube_" + item).attr(
    "src",
    "https://www.youtube.com/embed/" + idYoutube
  );
}

//Edición de Galeria

var arrayFilesEdit = Array();
var arrayFilesDelete = Array();

function removeGallery(elem, item) {
  $(elem).parent().remove();

  var index = JSON.parse($(".galleryOldProduct_" + item).val()).indexOf(
    $(elem).attr("remove")
  );

  arrayFilesEdit = JSON.parse($(".galleryOldProduct_" + item).val());

  arrayFilesEdit.splice(index, 1);

  $(".galleryOldProduct_" + item).val(JSON.stringify(arrayFilesEdit));

  arrayFilesDelete = JSON.parse($(".deleteGalleryProduct_" + item).val());

  arrayFilesDelete.push($(elem).attr("remove"));

  $(".deleteGalleryProduct_" + item).val(JSON.stringify(arrayFilesDelete));
}
