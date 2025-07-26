using ApiProyectoFinal.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ApiProyectoFinal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SuscripcionesController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public SuscripcionesController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet("usuario/{usuarioId}")]
        public IActionResult ObtenerSuscripcionesPorUsuario(int usuarioId)
        {
            using var conexion = new SqlConnection(_configuration.GetConnectionString("Connection"));

            var actividades = conexion.Query<Actividades>(
                "MostrarSuscripcionesPorUsuario",
                new { UsuarioID = usuarioId },
                commandType: CommandType.StoredProcedure
            ).ToList();

            return Ok(actividades);
        }

        [HttpGet("actividad/{id}")]
        public IActionResult ObtenerActividadPorId(int id)
        {
            using var conexion = new SqlConnection(_configuration.GetConnectionString("Connection"));

            var actividad = conexion.QueryFirstOrDefault<Actividades>(
                "MostrarActividadPorId",
                new { ActividadID = id },
                commandType: CommandType.StoredProcedure
            );

            if (actividad == null)
                return NotFound();

            return Ok(actividad);
        }

        [HttpPost]
        public IActionResult Suscribirse([FromBody] Suscripciones suscripcion)
        {
            using var conexion = new SqlConnection(_configuration.GetConnectionString("Connection"));

            conexion.Execute(
                "InsertarSuscripcion",
                new { suscripcion.UsuarioID, suscripcion.ActividadID },
                commandType: CommandType.StoredProcedure
            );

            return Ok(new { Mensaje = "Suscripción registrada correctamente." });
        }

        [HttpDelete("{suscripcionId}")]
        public IActionResult CancelarSuscripcion(int suscripcionId)
        {
            using var conexion = new SqlConnection(_configuration.GetConnectionString("Connection"));

            conexion.Execute(
                "EliminarSuscripcion",
                new { SuscripcionID = suscripcionId },
                commandType: CommandType.StoredProcedure
            );

            return Ok(new { Mensaje = "Suscripción cancelada correctamente." });
        }
    }
}