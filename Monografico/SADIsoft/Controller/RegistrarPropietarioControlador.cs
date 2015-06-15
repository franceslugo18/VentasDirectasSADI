using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SADI.Model;
using SADIsoft.DataAccess;

namespace SADI.Controller
{
    public class RegistrarPropietarioControlador
    {
        public static void RegistrarPropietario(string nombre, string apellido, string cedula, string direccion, string tel1, string tel2, string email)
        {
            try
            {

                

                Propietario prop = new Propietario(nombre, apellido, cedula, direccion, tel1, tel2, email);
                PropietarioDA.RegistrarPropietarioDB(prop);

                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

}