using SADI.Model;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SADIsoft.Controller
{
    public class GenerarContratoLitisControlador
    {
        public static List<Inmueble> BuscarInmueblesPropietario(string propietarioId)
        {
            try
            {
                List<Inmueble> inm = InmuebleDA.BuscarInmueblesPropietario(propietarioId);
                return inm;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void guardarContrato(string ProId, string InmId, DateTime fecha)
        {
            ContratoDA.guardarContratoDA(ProId,InmId,fecha);
            
        }
    }
}