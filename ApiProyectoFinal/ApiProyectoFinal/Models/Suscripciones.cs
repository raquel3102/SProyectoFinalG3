namespace ApiProyectoFinal.Models
{
    public class Suscripciones
    {
        public int SuscripcionID { get; set; }
        public int? UsuarioID { get; set; }
        public int? ActividadID { get; set; }
        public DateTime? FechaSuscripcion { get; set; }

    }
}
