using ApiProyectoFinal.Models;
using ApiProyectoFinal.Services;
using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;

namespace ApiProyectoFinal.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IHostEnvironment _environment;
        private readonly IUtilitarios _utilitarios;

        public UsuarioController(IConfiguration configuration, IHostEnvironment environment, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _environment = environment;
            _utilitarios = utilitarios;
        }

        [HttpGet]
        [Route("ConsultarUsuario")]
        public IActionResult ConsultarUsuario(long ID_Usuario)
        {

            using (var contexto = new SqlConnection((_configuration.GetSection("ConnectionStrings:Connection").Value)))
            {
                //select
                var resultado = contexto.QueryFirstOrDefault("ConsultarUsuario", new
                {
                    ID_Usuario
                });
                if (resultado != null)
                {
                    return Ok(_utilitarios.RespuestaCorrecta(resultado));
                }
                else
                {
                    return BadRequest(_utilitarios.RespuestaIncorrecta("Su info no fue encontrada."));
                }
            }

        }

        [HttpPut]
        [Route("ActualizarUsuario")]
        public IActionResult ActualizarUsuario(Autenticacion autenticacion)
        {
            using (var contexto = new SqlConnection((_configuration.GetSection("ConnectionStrings:Connection").Value)))
            {
                var resultado = contexto.Execute("ActualizarUsuario", new
                {
                    autenticacion.ID_Usuario,
                    autenticacion.Cedula,
                    autenticacion.Nombre,
                    autenticacion.Correo

                });
                if (resultado > 0)
                {
                    return Ok(_utilitarios.RespuestaCorrecta(autenticacion));
                }
                else
                {
                    return BadRequest(_utilitarios.RespuestaIncorrecta("Su info no fue actualizada correctamente"));
                }
            }

        }
    }
}
