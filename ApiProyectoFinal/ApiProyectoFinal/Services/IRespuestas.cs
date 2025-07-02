using ApiProyectoFinal.Models;

namespace ApiProyectoFinal.Services
{
    public interface IRespuestas
    {
        Respuesta RespuestaCorrecta(object contenido);
        Respuesta RespuestaIncorrecta(string mensaje);
    }
}
