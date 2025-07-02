
using ApiProyectoFinal.Models;

namespace ApiProyectoFinal.Services
{
    public class Respuestas : IRespuestas
    {
        public Respuesta RespuestaCorrecta(object contenido)
        {
            return new Respuesta
            {
                Codigo = 0,
                Mensaje = "Operación exitosa",
                Contenido = contenido

            };
        }

        public Respuesta RespuestaIncorrecta(string mensaje)
        {
            return new Respuesta
            {
                Codigo = 99,
                Mensaje = mensaje,
                Contenido = null

            };
        }
    }
}
