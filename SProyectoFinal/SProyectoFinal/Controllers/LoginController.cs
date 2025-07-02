using Microsoft.AspNetCore.Mvc;
using SProyectoFinal.Models;

namespace SProyectoFinal.Controllers
{
    public class LoginController : Controller
    {

        private readonly IConfiguration _configuration;
        private readonly IHttpClientFactory _http;

        public LoginController(IConfiguration configuration, IHttpClientFactory http)
        {
            _configuration = configuration;
            _http = http;
        }
        [HttpGet]
        public IActionResult RegistrarCuenta()
        {
            return View();
        }

        [HttpPost]
        public IActionResult RegistrarCuenta(UsuarioModel usuario)
        {
            using (var http = _http.CreateClient())
            {
                http.BaseAddress = new Uri(_configuration.GetSection("Api:ApiUrlRaquel").Value!);
                var resultado = http.PostAsJsonAsync("api/Login/RegistrarCuenta", usuario).Result;

                if (resultado.IsSuccessStatusCode)
                    return RedirectToAction("Index", "Home");

                ViewBag.Mensaje = "No se ha podido registrar su información";
                return View();
            }
        }

        [HttpGet]
        public IActionResult IniciarSesion()
        {
            return View();
        }

        [HttpPost]
        public IActionResult IniciarSesion(UsuarioModel usuario)
        {
            using (var http = _http.CreateClient())
            {
                http.BaseAddress = new Uri(_configuration.GetSection("Api:ApiUrlRaquel").Value!);
                var resultado = http.PostAsJsonAsync("api/Login/IniciarSesion", usuario).Result;

                if (resultado.IsSuccessStatusCode)
                    return RedirectToAction("Index", "Home");


                ViewBag.Mensaje = "No se ha podido validar su información";
                return View();
            }
        }

        public IActionResult RecuperarContrasenna()
        {
            return View();
        }
    }
}
