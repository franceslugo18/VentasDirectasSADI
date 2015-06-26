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

        public static string ActualizarPropietario(int id, string nom, string apell, string ced, string tel1, string tel2, string dir, string email)
        {
            try
            {
                string s = PropietarioDA.ActualizarPropietarioDB(id, nom, apell, ced, tel1, tel2, dir, email);
                    

                return s;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        internal static List<object> ListaPropietarios()
        {
            return PropietarioDA.ListaPropietariosDB();
        }


        public static int EliminarPropietario(int idPropietario) 
        {
            try
            {
                return PropietarioDA.EliminarPropietarioDB(idPropietario);
            }
            catch (Exception ex)
            {
                throw ex;
            }
               
        }
    }
}