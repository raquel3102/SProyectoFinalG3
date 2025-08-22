using Microsoft.AspNetCore.Mvc;
using SProyectoFinal.Services;

namespace SProyectoFinal.Controllers
{
    [Sesiones]
    [Administradores]
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class AdminController : Controller
    {
        public IActionResult IndexAdmin()
        {
            return View();
        }
    }
}
