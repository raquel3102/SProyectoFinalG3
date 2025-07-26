using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SProyectoFinal.Models;

namespace SProyectoFinal.Controllers
{
    //[Authorize(Roles = "Usuario")]
    public class SuscripcionesController : Controller
    {
        private readonly HttpClient _client;

        public SuscripcionesController(IHttpClientFactory factory)
        {
            _client = factory.CreateClient("API");
        }

        public IActionResult Index()
        {
            
            return View();
        }

        public async Task<IActionResult> Detalle(int id)
        {
            var actividad = await _client.GetFromJsonAsync<Actividades>($"api/actividades/{id}");
            return View(actividad);
        }

        public async Task<IActionResult> MisSuscripciones(int usuarioId)
        {
            var suscripciones = await _client.GetFromJsonAsync<List<Actividades>>($"api/suscripciones/usuario/{usuarioId}");
            return View(suscripciones);
        }

        [HttpPost]
        public async Task<IActionResult> Suscribirse(int usuarioId, int actividadId)
        {
            await _client.PostAsJsonAsync("api/suscripciones", new
            {
                UsuarioID = usuarioId,
                ActividadID = actividadId
            });
            return RedirectToAction("MisSuscripciones", new { usuarioId });
        }

        [HttpPost]
        public async Task<IActionResult> Cancelar(int suscripcionId, int usuarioId)
        {
            await _client.DeleteAsync($"api/suscripciones/{suscripcionId}");
            return RedirectToAction("MisSuscripciones", new { usuarioId });
        }
    }

}
