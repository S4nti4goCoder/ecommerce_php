//Tabla para administradores
if ($(".adminsTable").length > 0) {
  var url = "/ajax/data-admins.ajax.php";
  var columns = [
    { data: "id_admin" },
    { data: "name_admin" },
    { data: "email_admin" },
    { data: "rol_admin" },
    { data: "date_updated_admin" },
    { data: "actions", orderable: false, searchable: false },
  ];
  var order = [0, "desc"];
}

//Tabla para categorias
if ($(".categoriesTable").length > 0) {
  var url = "/ajax/data-categories.ajax.php";
  var columns = [
    { data: "id_category" },
    { data: "status_category" },
    { data: "name_category" },
    { data: "url_category" },
    { data: "image_category" },
    { data: "description_category" },
    { data: "keywords_category" },
    { data: "subcategories_category" },
    { data: "products_category" },
    { data: "views_category" },
    { data: "date_updated_admin" },
    { data: "actions", orderable: false, searchable: false },
  ];
  var order = [0, "desc"];
}

//Configuracion global DataTable
$("#tables").DataTable({
  responsive: true,
  aLengthMenu: [
    [10, 25, 50, 100],
    [10, 25, 50, 100],
  ],
  order: [order],
  lengthChange: true,
  autoWidth: false,
  processing: true,
  serverSide: true,
  ajax: {
    url: url,
    type: "POST",
  },
  columns: columns,
  language: {
    sProcessing: "Procesando...",
    sLengthMenu: "Mostrar _MENU_ registros",
    sZeroRecords: "No se encontraron resultados",
    sEmptyTable: "Ningún dato disponible en esta tabla",
    sInfo: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
    sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0",
    sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
    sInfoPostFix: "",
    sSearch: "Buscar:",
    sUrl: "",
    sInfoThousands: ",",
    sLoadingRecords: "Cargando...",
    oPaginate: {
      sFirst: "Primero",
      sLast: "Último",
      sNext: "Siguiente",
      sPrevious: "Anterior",
    },
    oAria: {
      sSortAscending: ": Activar para ordenar la columna de manera ascendente",
      sSortDescending:
        ": Activar para ordenar la columna de manera descendente",
    },
  },
});

//Eliminar item

$(document).on("click", ".deleteItem", function () {
  var idItem = $(this).attr("idItem");
  var table = $(this).attr("table");
  var column = $(this).attr("column");
  var rol = $(this).attr("rol");

  fncSweetAlert("confirm", "¿Está seguro de eliminar este item?", "").then(
    (resp) => {
      if (resp) {
        fncMatPreloader("on");
        fncSweetAlert("loading", "", "");
        if (rol == "admin") {
          var token = localStorage.getItem("token-admin");
          var url = "/ajax/delete-admin.ajax.php";
        }
        var data = new FormData();
        data.append("token", token);
        data.append("table", table);
        data.append("id", idItem);
        data.append("nameId", "id_" + column);

        $.ajax({
          url: url,
          method: "POST",
          data: data,
          contentType: false,
          cache: false,
          processData: false,
          success: function (response) {
            if (response == 200) {
              fncMatPreloader("off");
              fncToastr(
                "success",
                "El item ha sido borrado correctamente",
                location.reload()
              );
            } else if (response == "no-borrar") {
              fncMatPreloader("off");
              fncToastr("warning", "Este item no se puede borrar");
            } else {
              fncMatPreloader("off");
              fncToastr("Error", "Este item no se pudo borrar");
            }
          },
        });
      }
    }
  );
});
