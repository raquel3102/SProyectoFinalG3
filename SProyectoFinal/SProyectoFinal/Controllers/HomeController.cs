using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using SProyectoFinal.Models;

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


    }
}
