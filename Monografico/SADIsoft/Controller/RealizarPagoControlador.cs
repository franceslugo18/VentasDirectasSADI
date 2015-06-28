using SADI.Model;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
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


        public static DataSet BuscarFacturasContrato(string p)
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



        public static int PagarFacturas(List<int> facturas)
        {
            try
            {
                return FacturaDA.PagarFacturas(facturas);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static List<int> CargarContratosIds(string cedula)
        {
            try
            {
                return FacturaDA.CargarContratosIdsDA(cedula);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}