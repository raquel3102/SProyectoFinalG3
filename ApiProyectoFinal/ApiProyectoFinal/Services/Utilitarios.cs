﻿using ApiProyectoFinal.Models;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using System.Security.Cryptography;
using System.Text;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace ApiProyectoFinal.Services
{
    public class Utilitarios : IUtilitarios
    {
        private IConfiguration _configuration;
        public Utilitarios(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public RespuestasEstandar RespuestaCorrecta(object contenido)
        {
            return new RespuestasEstandar
            {
                Codigo = 0,
                Mensaje = "Operación exitosa",
                Contenido = contenido
            };
        }

        public RespuestasEstandar RespuestaIncorrecta(string mensaje)
        {
            return new RespuestasEstandar
            {
                Codigo = 99,
                Mensaje = mensaje,
                Contenido = null
            };
        }

        public string GenerarContrasena()
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
            var contrasenna = _configuration.GetSection("SMTP:Contrasenna").Value;

            if (!string.IsNullOrEmpty(remitente) && !string.IsNullOrEmpty(contrasenna))
            {
                var mensaje = new MailMessage(remitente, destinatario, asunto, cuerpo);
                mensaje.IsBodyHtml = true;

                var smtp = new SmtpClient("smtp.office365.com", 587)
                {
                    Credentials = new NetworkCredential(remitente, contrasenna),
                    EnableSsl = true
                };

                smtp.Send(mensaje);
            }
        }

        public string GenerarToken(long ID_Usuario)
        {
            var key = Encoding.UTF8.GetBytes(_configuration.GetSection("Start:LlaveSegura").Value!);

            var claims = new[]
            {
                new Claim("ID_Usuario", ID_Usuario.ToString()),
            };

            var signingCredentials = new SigningCredentials(
                new SymmetricSecurityKey(key),
                SecurityAlgorithms.HmacSha256
            );

            var tokenDescriptor = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(10),
                signingCredentials: signingCredentials
            );

            return new JwtSecurityTokenHandler().WriteToken(tokenDescriptor);
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

        public string Decrypt(string texto)
        {
            byte[] iv = new byte[16];
            byte[] buffer = Convert.FromBase64String(texto);

            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(_configuration.GetSection("Start:LlaveSegura").Value!);
                aes.IV = iv;

                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

                using (MemoryStream memoryStream = new MemoryStream(buffer))
                {
                    using (CryptoStream cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader streamReader = new StreamReader(cryptoStream))
                        {
                            return streamReader.ReadToEnd();
                        }
                    }
                }
            }
        }

        public long ObtenerIdUsuario(IEnumerable<Claim> token)
        {
            if (token.Any())
            {
                var IdUsuarioClaim = token.FirstOrDefault(c => c.Type == "ID_Usuario");
                if (IdUsuarioClaim != null && long.TryParse(IdUsuarioClaim.Value, out long ID_Usuario))
                {
                    return ID_Usuario;
                }
            }

            return 0;
        }

    }
}
