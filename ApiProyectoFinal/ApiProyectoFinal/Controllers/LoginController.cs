using Microsoft.Extensions.Configuration;
using System.Reflection.Metadata.Ecma335;
using ApiProyectoFinal.Models;
using ApiProyectoFinal.Services;
using Dapper;
using Microsoft.AspNetCore.Authorization;
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
        private readonly IHostEnvironment _environment;
       
        private readonly IUtilitarios _utilitarios;

        public LoginController(IConfiguration configuration, IHostEnvironment environment, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _environment = environment;
            _utilitarios = utilitarios;
           
        }

        [HttpPost]
        [Route("RegistrarCuenta")]
        public IActionResult Registro(Autenticacion usuario)
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
                    return Ok(_utilitarios.RespuestaCorrecta(usuario));
                }
                else
                {
                    return BadRequest(_utilitarios.RespuestaIncorrecta("Su info no fue registrada correctamente"));
                }
            }

        }

        [HttpPost]
        [Route("IniciarSesion")]
        [AllowAnonymous]
        public IActionResult IniciarSesion(Autenticacion autenticacion)
        {
            using (var contexto = new SqlConnection((_configuration.GetSection("ConnectionStrings:Connection").Value)))
            {
                //select
                var resultado = contexto.QueryFirstOrDefault<Autenticacion>("ValidarInicioSesion", new
                {
                    autenticacion.Cedula,
                    autenticacion.Contraseña
                });
                if (resultado != null)
                {
                    resultado.Token = _utilitarios.GenerarToken(resultado.ID_Usuario);
                    return Ok(_utilitarios.RespuestaCorrecta(resultado));
                }
                else
                {
                    return BadRequest(_utilitarios.RespuestaIncorrecta("Su información no fue validada correctamente"));
                }
            }
        }

        [HttpPost]
        [Route("RecuperarContrasenna")]
        public IActionResult RecuperarContrasenna(Autenticacion usuario)
        {
            using (var contexto = new SqlConnection((_configuration.GetSection("ConnectionStrings:Connection").Value)))
            {
                var resultado = contexto.QueryFirstOrDefault("RevisarCorreo", new
                {
                    usuario.Correo
                });

                if (resultado != null)
                {

                    var ContrasennaCorreo = _utilitarios.GenerarContrasena();
                    var Contrasenna = _utilitarios.Encrypt(ContrasennaCorreo);
                    var resultadoNuevo = contexto.Execute("ActualizarContra", new
                    {
                        resultado.ID_Usuario,
                        Contraseña = Contrasenna
                    });
                    if (resultadoNuevo > 0)
                    {
                        var ruta = Path.Combine(_environment.ContentRootPath, "PlantillaCorreo.html");
                        var html = System.IO.File.ReadAllText(ruta);

                        html = html.Replace("@@Nombre", resultado.Nombre);
                        html = html.Replace("@@Contrasenna", ContrasennaCorreo);

                        _utilitarios.EnviarCorreo(resultado.Correo!, "Acceso al sistema", html);
                        return Ok(_utilitarios.RespuestaCorrecta(resultado));
                    }

                }

                return BadRequest(_utilitarios.RespuestaIncorrecta("Su información no pudo ser validada en este momento, por favor intente más tarde."));
            }
        }
    }

}

