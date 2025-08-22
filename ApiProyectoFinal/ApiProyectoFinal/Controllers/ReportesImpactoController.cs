using ApiProyectoFinal.Models;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ApiProyectoFinal.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportesImpactoController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        public ReportesImpactoController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        // GET: api/ReportesImpacto
        [HttpGet]
        public IActionResult ObtenerReportesImpacto()
        {
            using var conexion = new SqlConnection(_configuration.GetConnectionString("Connection"));

            var reportes = conexion.Query<ReporteImpacto>(
                "GetReportesImpacto",
                commandType: CommandType.StoredProcedure
            ).ToList();

            return Ok(reportes);
        }
    }
}