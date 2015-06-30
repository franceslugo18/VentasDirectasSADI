using SADI.Model;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SADIsoft.Controller
{
    public class mantenimientoClienteControlador
    {
        public static Cliente BuscarPorId(int idCliente)
        {
            try
            {
                Cliente cli = ClienteDA.BuscarPorIdDB(idCliente);

                return cli;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}