using SADI.Model;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace SADIsoft.Controller
{
    public class MantenimientoInmuebleControlador
    {
        public static Inmueble BuscarPorId(int idInmueble)
        {
            try
            {
                Inmueble inmu = InmuebleDA.BuscarPorIdDB(idInmueble);

                return inmu;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void ActualizarInmuble(Decimal PrecioAlquiler, int Depositos, int Niveles, int Habitaciones, int Banios, string Observaciones, int idInmueble)
        {
            InmuebleDA.ActualizarInmuebleDB(PrecioAlquiler, Depositos, Niveles, Banios, Habitaciones, Observaciones, idInmueble);
            
            
        }
        public static void ActualizarFoto(string foto1,string foto2, string foto3, string foto4,  int idInmueble)
        {
            InmuebleDA.ActualizarFotosDB(foto1,foto2,foto3,foto4, idInmueble);


        }
    }
}