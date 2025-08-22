using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SProyectoFinal.Models;

namespace SProyectoFinal.Controllers
{
    public class ReportesImpactoController : Controller
    {
        private readonly HttpClient _client;

        public ReportesImpactoController(IHttpClientFactory factory)
        {
            _client = factory.CreateClient("API");
        }

        public async Task<IActionResult> Index()
        {
            var reportes = await _client.GetFromJsonAsync<List<ReporteImpactoViewModel>>("api/ReporteImpacto");
            return View(reportes);
        }
    }
}