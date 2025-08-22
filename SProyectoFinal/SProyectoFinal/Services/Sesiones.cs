using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;

namespace SProyectoFinal.Services
{
    public class Sesiones : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (context.HttpContext.Session.GetString("JWT") == null)
            {
                context.Result = new RedirectToActionResult("Index", "Home", null);
            }
            else
            {
                base.OnActionExecuting(context);
            }
        }
    }
    public class Administradores : ActionFilterAttribute
    {
        //el executing se ejecuta antes de llegar al controlador 
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (context.HttpContext.Session.GetString("IdRol") != "1")
            {
                context.Result = new RedirectToActionResult("Principal", "Home", null);
            }
            else
            {
                base.OnActionExecuting(context);
            }
        }

    }
}
