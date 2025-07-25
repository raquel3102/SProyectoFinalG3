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
                using (var http = _http.CreateClient())
                {
                    http.BaseAddress = new Uri(_configuration.GetSection("Start:ApiUrlRaquel").Value!);

                    var resultado = http.GetAsync("api/Home/Listar").Result;

                    if (resultado.IsSuccessStatusCode)
                    {
                        var cursos = resultado.Content.ReadFromJsonAsync<List<Curso>>().Result;
                        var json = resultado.Content.ReadAsStringAsync().Result;
                        Console.WriteLine("[DEBUG] JSON recibido: " + json);


                        if (cursos == null || !cursos.Any())
                        {
                            ViewBag.Mensaje = "No se encontraron cursos disponibles.";

                            Console.WriteLine("[DEBUG] Cursos encontrados: " + cursos?.Count);
                            return View(new List<Curso>());

                        }

                        return View(cursos);
                    }
                    else
                    {
                        var contenido = resultado.Content.ReadAsStringAsync().Result;

                        if (!string.IsNullOrWhiteSpace(contenido))
                        {
                            var error = JsonSerializer.Deserialize<RespuestasEstandar>(contenido, new JsonSerializerOptions
                            {
                                PropertyNameCaseInsensitive = true
                            });

                            ViewBag.Mensaje = error?.Mensaje ?? "Error desconocido.";
                        }
                        else
                        {
                            ViewBag.Mensaje = "Error desconocido. No se recibió contenido.";
                        }

                        return View(new List<Curso>());
                    }
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
