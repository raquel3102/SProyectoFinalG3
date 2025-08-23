using Microsoft.Extensions.Configuration;
using System.Reflection.Metadata.Ecma335;
using ApiProyectoFinal.Models;
using ApiProyectoFinal.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;
using Dapper;

namespace ApiProyectoFinal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {

        private readonly IConfiguration _configuration;
        private readonly IHostEnvironment _environment;
        private readonly IUtilitarios _utilitarios;


        public HomeController(IConfiguration configuration, IHostEnvironment environment, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _environment = environment;
            _utilitarios = utilitarios;
        }



        [HttpGet("Listar")]
        public IActionResult ListarCursos()
        {

            using (var contexto = new SqlConnection((_configuration.GetSection("ConnectionStrings:Connection").Value)))
            {

                var cursos = contexto.Query<Curso>(
               "MostrarCursos",
               commandType: CommandType.StoredProcedure
               ).ToList();
                return Ok(cursos);
            }

        }

        [Authorize]
        [HttpGet("Detalle/{id}")]
        public IActionResult DetalleCurso(int id)
        {
            var idClaim = User.FindFirst("ID_Usuario");
            if (idClaim == null || !int.TryParse(idClaim.Value, out int usuarioId))
            {
                return Unauthorized("No se pudo obtener el ID del usuario desde el token.");
            }

            using (var connection = new SqlConnection(_configuration.GetConnectionString("Connection")))
            {
                var curso = connection.QueryFirstOrDefault<Curso>(
                    @"SELECT c.CursoID, c.Nombre, c.Descripcion, c.Requisitos, c.FechaInicio, c.FechaFin, c.VideoUrl
                      FROM tCursos c
                      INNER JOIN tInscripciones i ON i.CursoID = c.CursoID
                      WHERE c.CursoID = @CursoID AND i.UsuarioID = @UsuarioID",
                    new { CursoID = id, UsuarioID = usuarioId }
                );

                if (curso == null)
                {
                    return NotFound("No tienes acceso a este curso o no existe.");
                }

                return Ok(curso);
            }
        }





    }

}
