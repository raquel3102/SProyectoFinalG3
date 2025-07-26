using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SProyectoFinal.Models;

namespace SProyectoFinal.Controllers
{
    //[Authorize(Roles = "Admin")]
    public class ActividadesController : Controller
    {
        private readonly HttpClient _client;

        public ActividadesController(IHttpClientFactory factory)
        {
            _client = factory.CreateClient("API");
        }

        public IActionResult Index()
        {
            
            return View();
        }

        public IActionResult Crear() => View();

        [HttpPost]
        public async Task<IActionResult> Crear(Actividades model)
        {
            await _client.PostAsJsonAsync("api/actividades", model);
            return RedirectToAction("Index");
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
