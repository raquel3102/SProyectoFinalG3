using ApiProyectoFinal.Models;

namespace ApiProyectoFinal.Services
{
    public interface IRespuestas
    {
        Respuesta RespuestaCorrecta(object contenido);
        Respuesta RespuestaIncorrecta(string mensaje);
        public string CrearContrasennaNueva();
        public void EnviarCorreo(string destinatario, string asunto, string cuerpo);
        public string Encrypt(string texto);

    }
}
