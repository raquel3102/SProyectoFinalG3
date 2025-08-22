namespace SProyectoFinal.Models
{
    public class ReporteImpactoViewModel
    {
        public int ReporteID { get; set; }
        public string? Descripcion { get; set; }
        public DateTime FechaGeneracion { get; set; }

        public string? NombreUsuario { get; set; }
        public string? NombreCurso { get; set; }
        public string? NombreActividad { get; set; }
        public string? NombreInscripcion { get; set; }
        public string? NombreSuscripcion { get; set; }

        public string? Patrocinador { get; set; }
    }
}
