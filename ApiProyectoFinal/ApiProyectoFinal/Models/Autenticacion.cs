namespace ApiProyectoFinal.Models
{
    public class Autenticacion
    {

        public int ID_Usuario { get; set; }
        public string? Cedula { get; set; }

        public string? Nombre { get; set; }

        public string? Correo { get; set; }

        public string? Contraseña { get; set; }

        public int? Rol { get; set; }
        public bool Estado { get; set; } = true;

        public string? Token { get; set; }
        public string? NombreRol { get; set; }
    }
}
