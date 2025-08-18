using System.Diagnostics;
using System.Security.Cryptography;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using SProyectoFinal.Models;
using SProyectoFinal.Services;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace SProyectoFinal.Controllers
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class LoginController : Controller
    {

        private readonly IConfiguration _configuration;
        private readonly IHttpClientFactory _http;
        private readonly IUtilitarios _utilitarios;

        public LoginController(IConfiguration configuration, IHttpClientFactory http, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _http = http;
            _utilitarios = utilitarios;
        }
        [HttpGet]
        public IActionResult RegistrarCuenta()
        {
            return View();
        }

        [HttpPost]
        public IActionResult RegistrarCuenta(Autenticacion usuario)
        {
            usuario.Contraseña = _utilitarios.Encrypt(usuario.Contraseña!);
            using (var http = _http.CreateClient())
            {
                http.BaseAddress = new Uri(_configuration.GetSection("Api:ApiUrlRaquel").Value!);
                var resultado = http.PostAsJsonAsync("api/Login/RegistrarCuenta", usuario).Result;

                if (resultado.IsSuccessStatusCode)
                {
                    return RedirectToAction("IniciarSesion", "Login"); 
                }
                else
                {
                    var respuesta = resultado.Content.ReadFromJsonAsync<RespuestasEstandar>().Result;
                    ViewBag.Mensaje = respuesta!.Mensaje;
                    return View();
                }
            }
        }

        [HttpGet]
        public IActionResult IniciarSesion()
        {
            return View();
        }

        [HttpPost]
        public IActionResult IniciarSesion(Autenticacion autenticacion)
        {
            autenticacion.Contraseña = _utilitarios.Encrypt(autenticacion.Contraseña!);

            using (var http = _http.CreateClient())
            {
                http.BaseAddress = new Uri(_configuration.GetSection("Api:ApiUrlRaquel").Value!);
                var resultado = http.PostAsJsonAsync("api/Login/IniciarSesion", autenticacion).Result;

                if (resultado.IsSuccessStatusCode) {

                    var datos = resultado.Content.ReadFromJsonAsync<RespuestasEstandar<Autenticacion>>().Result;
                    HttpContext.Session.SetString("IdUsuario", datos?.Contenido?.ID_Usuario.ToString()!);
                    HttpContext.Session.SetString("Nombre", datos?.Contenido?.Nombre!);
                    HttpContext.Session.SetString("IdRol", datos?.Contenido?.Rol.ToString()!);
                    HttpContext.Session.SetString("NombreRol", datos?.Contenido?.Nombre_Rol!);
                    HttpContext.Session.SetString("JWT", datos?.Contenido?.Token!);
                    return RedirectToAction("Index", "Home");
                 }
                else
                {
                    var respuesta = resultado.Content.ReadFromJsonAsync<RespuestasEstandar>().Result;
                    ViewBag.Mensaje = respuesta!.Mensaje;
                    return View();
                }

                   
            }
        }

        [HttpGet]
        public IActionResult RecuperarContrasenna()
        {
            return View();
        }

        [HttpPost]
        public IActionResult RecuperarContrasenna(Autenticacion usuario)
        {
            using (var http = _http.CreateClient())
            {
                http.BaseAddress = new Uri(_configuration.GetSection("Api:ApiUrlRaquel").Value!);
                var resultado = http.PostAsJsonAsync("api/Login/RecuperarContrasenna", usuario).Result;

                if (!resultado.IsSuccessStatusCode)
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    var respuesta = resultado.Content.ReadFromJsonAsync<RespuestasEstandar>().Result;
                    ViewBag.Mensaje = respuesta!.Mensaje;
                    return View();
                }

            }
        }

        [HttpGet]
        public IActionResult CerrarSesion()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }
    }
}
