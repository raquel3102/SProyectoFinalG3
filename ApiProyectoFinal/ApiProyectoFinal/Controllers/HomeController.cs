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




    }

}
