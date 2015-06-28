using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using SADI.Model;
using SADIsoft.DataAccess;

namespace SADIsoft.DataAccess
{
    public class ClienteDA
    {
        private static SqlConnection conn;
        private static SqlCommand com;
        private static SqlDataReader dr;

        public static void RegistrarClienteDA(Cliente cliente)
        {
            try
            {
                conn = Conexion.Conectar();
                string query = string.Format(@"INSERT INTO Clientes(nombre,apellido,cedula,telefono1,telefono2,Email) 
                VALUES('{0}','{1}','{2}','{3}','{4}','{5}')", cliente.Nombre, cliente.Apellido, cliente.Cedula, cliente.Tel1, cliente.Tel2,cliente.Email);
                com = new SqlCommand(query, conn);

                int i = com.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static object CargarClientesDB()
        {
            try
            {
                List<Cliente> lista = new List<Cliente>();

                conn = Conexion.Conectar();
                string query = string.Format(@"SELECT ClienteId, Nombre + ' ' + Apellido AS Nombre	FROM Clientes");
                com = new SqlCommand(query, conn);
                dr = com.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(AgregarCliente(dr));
                }
                Cliente item = new Cliente();
                item.Nombre = "- Seleccione -";
                item.ClienteId = 0;
                lista.Insert(0, item);

                dr.Close();
                conn.Close();
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private static Cliente AgregarCliente(SqlDataReader dr)
        {
            Cliente cliente = new Cliente();
            cliente.Nombre = dr["Nombre"].ToString();
            cliente.ClienteId = Convert.ToInt32(dr["ClienteID"]);

            return cliente;
        }

        
    }
}