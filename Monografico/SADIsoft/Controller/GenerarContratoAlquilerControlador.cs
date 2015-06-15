using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SADIsoft.Controller
{
    public class GenerarContratoAlquilerControlador
    {
        public static void guardarContrato(int inmId, int cliId, int diaP, DateTime dateTime)
        {
            ContratoDA.guardarContratoDA(inmId,cliId,diaP,dateTime);
        }
    }
}