using Microsoft.AspNetCore.Mvc;
using SProyectoFinal.Models;
using System.Diagnostics;
using System.Net.Http.Headers;
using System.Text.Json;
using System.Net.Http;
using Microsoft.Extensions.Configuration;
using static System.Net.WebRequestMethods;

namespace SProyectoFinal.Controllers
{ 


    public class HomeController : Controller
    {
        //esta dependencia me permite acceder a valores que tengo el app settings, se ocupa por mas pequeño que sea el proyecto
        private readonly IConfiguration _configuration;
        //me permite acceder a servicios de internet
        private readonly IHttpClientFactory _http;

        public HomeController(IConfiguration configuration, IHttpClientFactory http)
        {
            _configuration = configuration;
            _http = http;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Proyectos()
        {
            return View();
        }

        [HttpGet]
public IActionResult ListarCursos()
{
    try
    {
        var usuarioIdStr = HttpContext.Session.GetString("IdUsuario");
        if (string.IsNullOrEmpty(usuarioIdStr) || !int.TryParse(usuarioIdStr, out int usuarioId))
        {
            ViewBag.Mensaje = "Debe iniciar sesión para ver los cursos.";
            return View(new List<Curso>());
        }

        using (var http = _http.CreateClient())
        {
            http.BaseAddress = new Uri(_configuration.GetSection("Start:ApiUrlRaquel").Value!);
            http.DefaultRequestHeaders.Add("Authorization", "Bearer " + HttpContext.Session.GetString("JWT"));

            // Traer todos los cursos
            var resultadoCursos = http.GetAsync("api/Home/Listar").Result;

            if (!resultadoCursos.IsSuccessStatusCode)
            {
                ViewBag.Mensaje = "No se pudo obtener la lista de cursos.";
                return View(new List<Curso>());
            }

            var cursos = resultadoCursos.Content.ReadFromJsonAsync<List<Curso>>().Result;

            if (cursos == null || !cursos.Any())
            {
                ViewBag.Mensaje = "No se encontraron cursos disponibles.";
                return View(new List<Curso>());
            }

            // Traer cursos en los que el usuario ya está inscrito
            var resultadoInscripciones = http.GetAsync($"api/Inscripcion/MisCursos/{usuarioId}").Result;
            var cursosInscritos = resultadoInscripciones.Content.ReadFromJsonAsync<List<int>>().Result ?? new List<int>();

            // Marcar cursos inscritos
            foreach (var curso in cursos)
            {
                curso.EstaInscrito = cursosInscritos.Contains(curso.CursoID);
            }

            return View(cursos);
        }
    }
    catch (Exception ex)
    {
        ViewBag.Mensaje = $"Error inesperado: {ex.Message}";
        return View(new List<Curso>());
    }
}

    }
}
