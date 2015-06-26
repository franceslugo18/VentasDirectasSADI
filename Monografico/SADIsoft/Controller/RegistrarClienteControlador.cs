using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SADI.Model;
using SADIsoft.DataAccess;


namespace SADI.Controller
{
    public class RegistrarClienteControlador
    {
        public static void RegistrarCliente(string nombre, string apellido, string cedula, string tel1, string tel2, string email)
        {
            try
            {
                Cliente cliente = new Cliente(nombre,apellido,cedula,tel1,tel2,email);
                ClienteDA.RegistrarClienteDA(cliente);

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}