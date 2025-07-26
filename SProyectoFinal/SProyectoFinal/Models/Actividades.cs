namespace SProyectoFinal.Models
{
    public class Actividades
    {
        public int ActividadID { get; set; }
        public string? Titulo { get; set; }
        public string? Descripcion { get; set; }
        public DateTime? Fecha { get; set; }
        public string? Tipo { get; set; }
        public string? Ubicacion { get; set; }
        public string? LinkLlamada { get; set; }
        public int? OrganizadorID { get; set; }

    }
}
