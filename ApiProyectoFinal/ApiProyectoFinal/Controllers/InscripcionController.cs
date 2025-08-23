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
    public class InscripcionController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly IHostEnvironment _environment;
        private readonly IUtilitarios _utilitarios;


        public InscripcionController(IConfiguration configuration, IHostEnvironment environment, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _environment = environment;
            _utilitarios = utilitarios;
        }

        [HttpPost("Inscribir")]
        public IActionResult Inscribir(Inscripcion inscripcion)
        {
            if (inscripcion == null || inscripcion.CursoID <= 0)
            {
                return BadRequest("Debe indicar un curso válido para inscribirse.");
            }


            var idClaim = User.FindFirst("ID_Usuario");
            if (idClaim == null || !int.TryParse(idClaim.Value, out int usuarioId))
            {
                return Unauthorized("No se pudo obtener el ID del usuario desde el token.");
            }

            inscripcion.UsuarioID = usuarioId;


            using (var connection = new SqlConnection(_configuration.GetConnectionString("Connection")))
            {
                var resultado = connection.Execute("InscribirUsuario",
                    new
                    {
                        UsuarioID = inscripcion.UsuarioID,
                        CursoID = inscripcion.CursoID
                    }

                );

                if (resultado > 0)
                {
                    return Ok(_utilitarios.RespuestaCorrecta(inscripcion));
                }
                else
                {
                    return BadRequest("No se pudo realizar la inscripción. Verifique la información.");
                }
            }

        }

        [HttpGet("MisCursos/{usuarioId}")]
        public IActionResult MisCursos(int usuarioId)
        {
            using (var connection = new SqlConnection(_configuration.GetConnectionString("Connection")))
            {
                var cursosIds = connection.Query<int>(
                    "SELECT CursoID FROM tInscripciones WHERE UsuarioID = @UsuarioID",
                    new { UsuarioID = usuarioId }
                ).ToList();

                return Ok(cursosIds);
            }
        }


        [HttpPost("MarcarCompletado")]
        public IActionResult MarcarCompletado([FromBody] Inscripcion inscripcion)
        {
            if (inscripcion == null || inscripcion.CursoID <= 0)
            {
                return BadRequest("Debe indicar un curso válido.");
            }

            var idClaim = User.FindFirst("ID_Usuario");
            if (idClaim == null || !int.TryParse(idClaim.Value, out int usuarioId))
            {
                return Unauthorized("No se pudo obtener el ID del usuario desde el token.");
            }

            using (var connection = new SqlConnection(_configuration.GetConnectionString("Connection")))
            {
                var result = connection.Execute(
                    "UPDATE tInscripciones SET Completado = 1 WHERE UsuarioID = @UsuarioID AND CursoID = @CursoID",
                    new { UsuarioID = usuarioId, CursoID = inscripcion.CursoID }
                );

                if (result > 0)
                {
                    return Ok(_utilitarios.RespuestaCorrecta(inscripcion));
                }
                else
                {
                    return BadRequest("No se pudo actualizar el estado.");
                }
            }
        }




    }
}
