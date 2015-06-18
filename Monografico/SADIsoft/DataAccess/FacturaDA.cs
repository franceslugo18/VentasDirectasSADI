using SADI.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SADIsoft.DataAccess
{
    public class FacturaDA
    {

        private static SqlConnection conn;
        private static SqlCommand com;
        private static SqlDataReader dr;

        public static Contrato BuscarFacturaPorCedulaDA(string cedula)
        {
            try
            {
                conn = Conexion.Conectar();
                string query = string.Format(@" SELECT Clientes.Nombre, Clientes.Apellido, Contratos.ContratoId, Contratos.DiaPago, Inmuebles.PrecioAlquiler FROM Clientes INNER JOIN Contratos ON Contratos.ClienteId = Clientes.ClienteId INNER JOIN Inmuebles ON Inmuebles.InmuebleId = Contratos.InmuebleId WHERE Clientes.Cedula = '{0}'", cedula);
                
                com = new SqlCommand(query, conn);

                dr = com.ExecuteReader();

                string nombre = "";
                string apellido = "";
                int contratoId = 0;
                int diaPago = 0;
                decimal precioAlquiler = 0;

                while (dr.Read())
                {
                    nombre = dr[0].ToString();
                    apellido = dr[1].ToString();
                    contratoId = Convert.ToInt32(dr[2]);
                    diaPago = Convert.ToInt32(dr[3]);
                    precioAlquiler = Convert.ToDecimal(dr[4]);
                }
                Contrato contrato = new Contrato(nombre,apellido,contratoId,diaPago,precioAlquiler);
                dr.Close();
                conn.Close();
                return contrato;


                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static List<Facturas> BuscarFacturasContratoDA(int p)
        {
            List<Facturas> lista = new List<Facturas>();
            Facturas factura;
            conn = Conexion.Conectar();
            string query = string.Format(@" 
                SELECT  
	                Facturas.FacturaId,
		            Facturas.NumeroCuota,
		            Facturas.Mora,
		            Facturas.TotalCuota, 
		            Facturas.FechaGenerada 
		 
		        FROM Facturas INNER JOIN Contratos ON Facturas.ContratoId = Contratos.ContratoId
					   
               WHERE Contratos.ContratoId = {0} and Facturas.Estado = 0", p);

            com = new SqlCommand(query, conn);

            dr = com.ExecuteReader();

            int facturaId = 0;
            int numCuota = 0;
            decimal mora = 0;
            decimal totalCuota = 0;
            DateTime fecha;

            while (dr.Read())
            {
                facturaId = Convert.ToInt32(dr[0]);
                numCuota = Convert.ToInt32(dr[1]);
                mora = Convert.ToDecimal(dr[2]);
                totalCuota = Convert.ToDecimal(dr[3]);
                fecha = Convert.ToDateTime(dr[4]);

                factura = new Facturas(facturaId,numCuota,mora,totalCuota,fecha);

                lista.Add(factura);
            }
            dr.Close();
            conn.Close();
            return lista;
        }
    }
}