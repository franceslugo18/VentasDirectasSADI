using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SADI.Model
{
    public class Cliente
    {
        public int ClienteId { get; set; }
        public string Nombre { get; set; }
        public string Apellido;
        public string Cedula;
        public string Tel1;
        public string Tel2;
        public string Email;
        public Contrato Contrato;

        public Cliente(string nombre, string apellido, string cedula, string tel1, string tel2, string email)
        {
            Nombre = nombre;
            Apellido = apellido;
            Cedula = cedula;
            
            Tel1 = tel1;
            Tel2 = tel2;
            Email = email;
        }

        public Cliente(string nombre, string apellido, string cedula, string tel1, string tel2, string email, Contrato contrato)
        {
            Nombre = nombre;
            Apellido = apellido;
            Cedula = cedula;
            Tel1 = tel1;
            Tel2 = tel2;
            Email = email;
            Contrato = contrato;
        }

        public Cliente()
        {
            // TODO: Complete member initialization
        }

        public Cliente(string nombre, string apellido)
        {
            Nombre = nombre;
            Apellido = apellido;
            
        }





        
    }
}
