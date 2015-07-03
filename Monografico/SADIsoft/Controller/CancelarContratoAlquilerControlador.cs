using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SADIsoft.Controller
{
    public class CancelarContratoAlquilerControlador
    {
        internal static void CancelarContrato(int ContratoId)
        {
            ContratoDA.CancelarContratoDA(ContratoId);
        }
    }
}