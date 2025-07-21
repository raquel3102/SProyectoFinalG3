using Microsoft.AspNetCore.Mvc;

namespace SProyectoFinal.Controllers
{
    public class ErrorController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
