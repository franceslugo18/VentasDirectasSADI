using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SADI.Model;
using SADIsoft.DataAccess;

namespace SADI.Controller
{
    public class MantenimientoPropietarioControlador
    {
        public static Propietario BuscarPorId(int idPropietario)
        {
            try
            {
                Propietario pro = PropietarioDA.BuscarPorIdDB(idPropietario);

                return pro;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static string ActualizarPropietario(int id, string tel1, string tel2, string dir, string email)
        {
            try
            {
                string s = PropietarioDA.ActualizarPropietarioDB(id, tel1, tel2, dir, email);
                    

                return s;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}