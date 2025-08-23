using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using SProyectoFinal.Models;
using SProyectoFinal.Services;
using System.Data;

namespace SProyectoFinal.Controllers
{
    [Sesiones]
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class ActividadesController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly HttpClient _client;
        private readonly IHttpClientFactory _http;

        public ActividadesController(IHttpClientFactory factory, IConfiguration configuration, IHttpClientFactory http)
        {
            _client = factory.CreateClient("API");
            _configuration = configuration;
            _http = http;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Detalle(int id)
        {
            Actividades actividad = null;

            using (var http = _http.CreateClient())
            {
                http.BaseAddress = new Uri(_configuration.GetSection("Api:ApiUrlRaquel").Value!);
                var resultado = await http.GetAsync($"api/Actividades/ObtenerActividad/{id}");

                if (resultado.IsSuccessStatusCode)
                {
                    actividad = await resultado.Content.ReadFromJsonAsync<Actividades>();
                }
                else
                {
                    ViewBag.Mensaje = "No se pudo cargar la actividad.";
                }
            }

            return View(actividad);
        }


        [HttpGet]
        public IActionResult Crear()
        {
            using (var http = _http.CreateClient())
            {
                http.BaseAddress = new Uri(_configuration.GetSection("Api:ApiUrlRaquel").Value!);
                var resultado = http.GetAsync("api/Actividades/ObtenerOrganizadores").Result;

                if (resultado.IsSuccessStatusCode)
                {
                    var organizadores = resultado.Content.ReadFromJsonAsync<List<Autenticacion>>().Result;

                    ViewBag.Organizadores = new SelectList(organizadores, "ID_Usuario", "Nombre");
                }
                else
                {
                    ViewBag.Mensaje = "No se pudieron cargar los organizadores.";
                    ViewBag.Organizadores = new SelectList(new List<Autenticacion>(), "ID_Usuario", "Nombre");
                }
            }

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Crear(Actividades model)
        {
            using (var http = _http.CreateClient())
            {
                http.BaseAddress = new Uri(_configuration.GetSection("Api:ApiUrlRaquel").Value!);
                var resultado = await http.PostAsJsonAsync("api/Actividades/CrearActividad", model);

                if (resultado.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    var respuesta = await resultado.Content.ReadFromJsonAsync<RespuestasEstandar>();
                    ViewBag.Mensaje = respuesta?.Mensaje ?? "Error al guardar la actividad";
                    return View(model);
                }
            }
        }


        public async Task<IActionResult> Editar(int id)
        {
            var actividad = await _client.GetFromJsonAsync<Actividades>($"api/actividades/{id}");
            return View(actividad);
        }

        [HttpPost]
        public async Task<IActionResult> Editar(Actividades model)
        {
            await _client.PutAsJsonAsync($"api/actividades/{model.ActividadID}", model);
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> VerSuscripciones(int actividadId)
        {
            var suscripciones = await _client.GetFromJsonAsync<List<Suscripciones>>($"api/suscripciones/actividad/{actividadId}");
            return View(suscripciones);
        }
    }


}
