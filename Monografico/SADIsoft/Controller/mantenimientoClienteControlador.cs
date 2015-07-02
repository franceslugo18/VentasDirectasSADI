﻿using SADI.Model;
using SADIsoft.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SADIsoft.Controller
{
    public class MantenimientoClienteControlador
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

        public static void ActualizarCliente(int idCliente, string tel1, string tel2, string dir)
        {
            ClienteDA.ActualizarClienteDB(idCliente, tel1, tel2, dir);
        }
    }
}