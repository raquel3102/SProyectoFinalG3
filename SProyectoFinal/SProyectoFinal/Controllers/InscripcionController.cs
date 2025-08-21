using Microsoft.AspNetCore.Mvc;
using SProyectoFinal.Models;
using SProyectoFinal.Services;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;

namespace SProyectoFinal.Controllers
{
    [Sesiones]
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class InscripcionController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly IHttpClientFactory _http;
        private readonly IUtilitarios _utilitarios;


        public InscripcionController(IConfiguration configuration, IHttpClientFactory http, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _http = http;
            _utilitarios = utilitarios;
        }
        [HttpPost]
        public IActionResult Inscribir(int cursoId)
        {
            if (cursoId <= 0)
                return BadRequest("Debe seleccionar un curso válido.");

            // ⚡ Crear modelo para enviar al API
            var inscripcion = new Inscripcion { CursoID = cursoId };

            using (var http = _http.CreateClient())
            {

                http.BaseAddress = new Uri(_configuration.GetSection("Start:ApiUrlRaquel").Value!);
                http.DefaultRequestHeaders.Add("Authorization", "Bearer " + HttpContext.Session.GetString("JWT"));

                var response = http.PostAsJsonAsync("api/Inscripcion/Inscribir", inscripcion).Result;

                if (response.IsSuccessStatusCode)
                {
                    TempData["Mensaje"] = "Inscripción realizada correctamente";
                    return RedirectToAction("ListarCursos", "Home");
                }

                TempData["Error"] = "No se pudo realizar la inscripción.";
                return RedirectToAction("ListarCursos", "Home");

            }
            
         }
    }
}
