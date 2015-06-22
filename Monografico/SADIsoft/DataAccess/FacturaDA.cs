using SADI.Model;
using System;
using System.Collections.Generic;
using System.Data;
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
                string query = string.Format(@"SELECT Clientes.Nombre, Clientes.Apellido, Contratos.ContratoId, Contratos.DiaPago, Contratos.CuotaMensual FROM Clientes INNER JOIN Contratos ON Contratos.ClienteId = Clientes.ClienteId  WHERE Clientes.Cedula = '{0}' and Contratos.isActivo = 1", cedula);

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

                Contrato contrato = new Contrato(nombre, apellido, contratoId, diaPago, precioAlquiler);

                dr.Close();
                conn.Close();
                return contrato;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static DataSet BuscarFacturasContratoDA(string p)
        {
            List<Facturas> lista = new List<Facturas>();
            Facturas factura;
            conn = Conexion.Conectar();
            string query = string.Format(@" 
                SELECT  
	                Facturas.FacturaId,
		            Facturas.NumeroCuota,
					Facturas.ContratoId,
		            isnull(Facturas.Mora,0),
		            Facturas.TotalCuota, 
		            Facturas.FechaGenerada 
		 
		        FROM Facturas INNER JOIN Contratos ON Facturas.ContratoId = Contratos.ContratoId
                              INNER JOIN Clientes ON Contratos.ClienteId = Clientes.ClienteId
					   
               WHERE Clientes.Cedula = '{0}' and Facturas.Estado = 0", p);

            //com = new SqlCommand(query, conn);

            //dr = com.ExecuteReader();

            int facturaId = 0;
            int numCuota = 0;
            int contratoId = 0;
            decimal mora = 0;
            decimal totalCuota = 0;
            DateTime fecha;

            SqlDataAdapter dt = new SqlDataAdapter(query,conn);
            DataSet ds = new DataSet();
            dt.Fill(ds,"Facturas");
            conn.Close();

            /*while (dr.Read())
            {
                facturaId = Convert.ToInt32(dr[0]);
                numCuota = Convert.ToInt32(dr[1]);
                contratoId = Convert.ToInt32(dr[2]);
                mora = Convert.ToDecimal(dr[3]);
                totalCuota = Convert.ToDecimal(dr[4]);
                fecha = Convert.ToDateTime(dr[5]);


                factura = new Facturas(facturaId, numCuota, contratoId, mora, totalCuota, fecha);


                lista.Add(factura);
             
            }
             * */
            //dr.Close();
            //conn.Close();
            return ds;//lista;
        }


        internal static void PagarFacturas(List<int> facturas)
        {
            conn = Conexion.Conectar();
            com = new SqlCommand();
            com.CommandType = System.Data.CommandType.StoredProcedure;
            com.CommandText = "SP_PagarFactura";

            com.Connection = conn;


            foreach (int fact in facturas)
            {
                com.Parameters.Add("@FacturaId", SqlDbType.Int).Value = fact;
                com.ExecuteNonQuery();
                com.Parameters.Clear();
            }

        }


        internal static List<int> CargarContratosIdsDA(string cedula)
        {
            conn = Conexion.Conectar();
            string query = string.Format(@"SELECT Facturas.ContratoId AS ContratoId FROM Facturas INNER JOIN Contratos ON Facturas.ContratoId = Contratos.ContratoId INNER JOIN Clientes ON Contratos.ClienteId = Clientes.ClienteId WHERE Clientes.Cedula = '{0}' GROUP BY Facturas.ContratoId", cedula);
            com = new SqlCommand(query,conn);
            List<int> lista = new List<int>();

            dr = com.ExecuteReader();
            while (dr.Read())
            {
                lista.Add(Convert.ToInt32(dr["ContratoId"]));
            }

            return lista;

        }
    }
}