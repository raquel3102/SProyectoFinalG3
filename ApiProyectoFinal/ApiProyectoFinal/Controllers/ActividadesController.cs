using ApiProyectoFinal.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ApiProyectoFinal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActividadesController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public ActividadesController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [HttpGet("ObtenerOrganizadores")]
        public IActionResult ObtenerOrganizadores()
        {
            using var conexion = new SqlConnection(_configuration.GetConnectionString("Connection"));

            var organizadores = conexion.Query(
                "ObtenerOrganizadores",
                commandType: CommandType.StoredProcedure
            ).ToList();

            return Ok(organizadores);
        }

        [HttpPost]
        [Route("CrearActividad")]
        public IActionResult CrearActividad([FromBody] Actividades model)
        {
            using var conexion = new SqlConnection(_configuration.GetConnectionString("Connection"));

            conexion.Execute(
                "InsertarActividad",
                new
                {
                    model.Titulo,
                    model.Descripcion,
                    model.Fecha,
                    model.Tipo,
                    model.Ubicacion,
                    model.LinkLlamada,
                    model.OrganizadorID
                },
                commandType: CommandType.StoredProcedure
            );

            return Ok(new { Mensaje = "Actividad creada exitosamente." });
        }



        [HttpGet]
        [Route("ObtenerActividad/{id}")]
        public IActionResult ObtenerActividad(int id)
        {
            using var conexion = new SqlConnection(_configuration.GetConnectionString("Connection"));

            var actividad = conexion.QueryFirstOrDefault<Actividades>(
                "MostrarActividadPorId",
                new { ActividadID = id },
                commandType: CommandType.StoredProcedure
            );

            if (actividad != null)
                return Ok(actividad);
            else
                return NotFound(new { Mensaje = "Actividad no encontrada." });
        }


        [HttpPut("{id}")]
        public IActionResult EditarActividad(int id, [FromBody] Actividades model)
        {
            using var conexion = new SqlConnection(_configuration.GetConnectionString("Connection"));

            conexion.Execute(
                "ActualizarActividad",
                new
                {
                    ActividadID = id,
                    model.Titulo,
                    model.Descripcion,
                    model.Fecha
                },
                commandType: CommandType.StoredProcedure
            );

            return Ok(new { Mensaje = "Actividad actualizada correctamente." });
        }
    }
}