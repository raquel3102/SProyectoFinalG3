function ConsultarPersonaApi() {

    let identificacion = $("#Cedula").val();
    $("#Nombre").val("");

    if (identificacion.length >= 9) {

        $.ajax({
            url: 'https://apis.gometa.org/cedulas/' + identificacion, // The URL to which the request is sent
            method: 'GET', // or 'POST', 'PUT', 'DELETE', etc.
            dataType: 'json', // or 'xml', 'html', 'text', etc., the expected data type from the server
            success: function (response) {
                // This function is executed when the request succeeds
                $("#Nombre").val(response.nombre);
            }
        });
    }
}