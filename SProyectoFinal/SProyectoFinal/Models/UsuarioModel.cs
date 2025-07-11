﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SProyectoFinal.Models
{
    public class UsuarioModel
    {
        public int ID_Usuario { get; set; }
        public string? Cedula { get; set; }

        public string? Nombre { get; set; }

        public string? Correo { get; set; }

        public string? Contraseña { get; set; }

        public int Rol { get; set; }
        public bool Estado { get; set; } = true;
    }
}