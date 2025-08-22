namespace ApiProyectoFinal.Models
{
    public class ReporteImpacto
    {
        public int ReporteID { get; set; }
        public int? PatrocinadorID { get; set; }
        public string? Descripcion { get; set; }
        public DateTime FechaGeneracion { get; set; }

        public int? UsuarioID { get; set; }
        public int? CursoID { get; set; }
        public int? ActividadID { get; set; }
        public int? InscripcionID { get; set; }
        public int? SuscripcionID { get; set; }
    }
}
