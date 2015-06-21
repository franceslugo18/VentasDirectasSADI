using SADI.Model;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SADIsoft.Controller
{
    public class RealizarPagoControlador
    {

        public static Contrato BuscarContratoPorCedula(string cedula)
        {
            try
            {
                return FacturaDA.BuscarFacturaPorCedulaDA(cedula);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static List<Facturas> BuscarFacturasContrato(int p)
        {
            try
            {
                return FacturaDA.BuscarFacturasContratoDA(p);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        public static void PagarFacturas(List<int> facturas)
        {
            try
            {
                FacturaDA.PagarFacturas(facturas);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}