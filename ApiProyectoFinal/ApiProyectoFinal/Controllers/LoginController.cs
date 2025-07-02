using ApiProyectoFinal.Models;
using ApiProyectoFinal.Services;
using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace ApiProyectoFinal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IRespuestas _respuesta;

        public LoginController(IConfiguration configuration, IRespuestas respuestas)
        {
            _configuration = configuration;
            _respuesta = respuestas;
        }

        [HttpPost]
        [Route("RegistrarCuenta")]
        public IActionResult Registro(UsuarioModel usuario)
        {
            using (var contexto = new SqlConnection((_configuration.GetSection("ConnectionStrings:Connection").Value)))
            {
                //insert, delete or update
                var resultado = contexto.Execute("RegistrarCuenta", new
                {

                    usuario.Cedula,
                    usuario.Nombre,
                    usuario.Correo,
                    usuario.Contraseña,
                    usuario.Rol,
                    usuario.Estado

                });
                if (resultado > 0)
                {
                    return Ok(_respuesta.RespuestaCorrecta(usuario));
                }
                else
                {
                    return BadRequest(_respuesta.RespuestaIncorrecta("Su info no fue registrada correctamente"));
                }
            }

        }

        [HttpPost]
        [Route("IniciarSesion")]
        public IActionResult IniciarSesion(UsuarioModel usuario)
        {
                using (var contexto = new SqlConnection((_configuration.GetSection("ConnectionStrings:Connection").Value)))
                {
                    //select
                    var resultado = contexto.QueryFirstOrDefault("InicioSesion", new
                    {
                        usuario.Cedula,
                        usuario.Contraseña
                    });
                    if (resultado != null)
                    {
                        return Ok(_respuesta.RespuestaCorrecta(resultado));
                    }
                    else
                    {
                        return BadRequest(_respuesta.RespuestaIncorrecta("Su info no fue validada correctamente"));
                    }
                }
        }
    }
}
