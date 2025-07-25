using ApiProyectoFinal.Models;
using System.Security.Claims;

namespace ApiProyectoFinal.Services
{
    public interface IUtilitarios
    {

        RespuestasEstandar RespuestaCorrecta(object contenido);

        RespuestasEstandar RespuestaIncorrecta(string mensaje);

        string GenerarContrasena();

        void EnviarCorreo(string destinatario, string asunto, string cuerpo);

        string GenerarToken(long ID_Usuario);

        string Encrypt(string texto);

        long ObtenerIdUsuario(IEnumerable<Claim> token);

    }
}
