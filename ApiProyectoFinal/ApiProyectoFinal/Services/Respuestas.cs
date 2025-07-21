
using ApiProyectoFinal.Models;
using Microsoft.Extensions.Configuration;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;

namespace ApiProyectoFinal.Services
{
    public class Respuestas : IRespuestas
    {

        private readonly IConfiguration _configuration;

        public Respuestas(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public Respuesta RespuestaCorrecta(object contenido)
        {
            return new Respuesta
            {
                Codigo = 0,
                Mensaje = "Operación exitosa",
                Contenido = contenido

            };
        }

        public Respuesta RespuestaIncorrecta(string mensaje)
        {
            return new Respuesta
            {
                Codigo = 99,
                Mensaje = mensaje,
                Contenido = null

            };
        }

        public string CrearContrasennaNueva()
        {
            const string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            var resultado = new System.Text.StringBuilder(8);

            for (int i = 0; i < 8; i++)
            {
                int indice = random.Next(caracteres.Length);
                resultado.Append(caracteres[indice]);
            }
            return resultado.ToString();
        }

        public void EnviarCorreo(string destinatario, string asunto, string cuerpo)
        {
            var remitente = _configuration.GetSection("SMTP:Remitente").Value;
            var contrasena = _configuration.GetSection("SMTP:Contrasenna").Value;

            if (!string.IsNullOrEmpty(remitente) && !string.IsNullOrEmpty(contrasena))
            {
                var mensaje = new MailMessage(remitente, destinatario, asunto, cuerpo);
                mensaje.IsBodyHtml = true;

                var smtp = new SmtpClient("smtp.office365.com", 587)
                {

                    Credentials = new NetworkCredential(remitente, contrasena),
                    EnableSsl = true
                };
                smtp.Send(mensaje);
            }
        }

        public string Encrypt(string texto)
        {
            byte[] iv = new byte[16];
            byte[] array;

            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(_configuration.GetSection("Start:LlaveSegura").Value!);
                aes.IV = iv;

                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

                using MemoryStream memoryStream = new();
                using CryptoStream cryptoStream = new(memoryStream, encryptor, CryptoStreamMode.Write);
                using (StreamWriter streamWriter = new(cryptoStream))
                {
                    streamWriter.Write(texto);
                }
                array = memoryStream.ToArray();
            }
            return Convert.ToBase64String(array);
        }
    }
}
