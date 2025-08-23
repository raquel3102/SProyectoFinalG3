using Microsoft.AspNetCore.Mvc;
using SProyectoFinal.Models;
using SProyectoFinal.Services;

namespace SProyectoFinal.Controllers
{
    [Sesiones]
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class UsuarioController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly IHttpClientFactory _http;
        private readonly IUtilitarios _utilitarios;

        public UsuarioController(IConfiguration configuration, IHttpClientFactory http, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _http = http;
            _utilitarios = utilitarios;
        }

        [HttpGet]
        public IActionResult ActualizarPerfil()
        {
            using (var http = _http.CreateClient())
            {
                var IdUsuario = HttpContext.Session.GetString("IdUsuario");

                http.BaseAddress = new Uri(_configuration.GetSection("Start:ApiUrlRaquel").Value!);

                http.DefaultRequestHeaders.Add("Authorization", "Bearer " + HttpContext.Session.GetString("JWT"));

                var resultado = http.GetAsync("api/Usuario/ConsultarUsuario?ID_Usuario=" + IdUsuario).Result;

                if (resultado.IsSuccessStatusCode)
                {
                    var datos = resultado.Content.ReadFromJsonAsync<RespuestasEstandar<Autenticacion>>().Result;



                    return View(datos!.Contenido);
                }
                else
                {
                    var respuesta = resultado.Content.ReadFromJsonAsync<RespuestasEstandar>().Result;
                    ViewBag.Mensaje = respuesta!.Mensaje;
                    return View();
                }
            }
        }

        [HttpPost]
        public IActionResult ActualizarPerfil(Autenticacion autenticacion)
        {
            autenticacion.Contraseña = _utilitarios.Encrypt(autenticacion.Contraseña!);

            using (var http = _http.CreateClient())
            {
                var IdUsuario = HttpContext.Session.GetString("IdUsuario");
                autenticacion.ID_Usuario = int.Parse(IdUsuario!);


                http.BaseAddress = new Uri(_configuration.GetSection("Start:ApiUrlRaquel").Value!);
                http.DefaultRequestHeaders.Add("Authorization", "Bearer " + HttpContext.Session.GetString("JWT"));
                var resultado = http.PutAsJsonAsync("api/Usuario/ActualizarUsuario", autenticacion).Result;

                if (resultado.IsSuccessStatusCode)
                {

                    HttpContext.Session.SetString("Nombre", autenticacion?.Nombre!);

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

        [HttpPost]
        public IActionResult CambiarContrasenna(Autenticacion autenticacion)
        {
            if (autenticacion.Contraseña != autenticacion.ConfirmarContraseña)
            {
                ViewBag.Mensaje = "Las contraseñas no coinciden.";
                return View();
            }
            autenticacion.Contraseña = _utilitarios.Encrypt(autenticacion.Contraseña!);

            using (var http = _http.CreateClient())
            {
                var IdUsuario = HttpContext.Session.GetString("IdUsuario");
                autenticacion.ID_Usuario = int.Parse(IdUsuario!);


                http.BaseAddress = new Uri(_configuration.GetSection("Start:ApiUrlRaquel").Value!);
                http.DefaultRequestHeaders.Add("Authorization", "Bearer " + HttpContext.Session.GetString("JWT"));
                var resultado = http.PutAsJsonAsync("api/Usuario/CambiarContrasenna", autenticacion).Result;

                if (resultado.IsSuccessStatusCode)
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
        public IActionResult CambiarContrasenna()
        {
            return View();
        }
    }
}
