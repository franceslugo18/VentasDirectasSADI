using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using SADI.Model;
using SADIsoft.DataAccess;
using System.Data;

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
                string query = string.Format(@"INSERT INTO Clientes(nombre,apellido,cedula,telefono1,telefono2,Email,isEliminado) 
                VALUES('{0}','{1}','{2}','{3}','{4}','{5}',0)", cliente.Nombre, cliente.Apellido, cliente.Cedula, cliente.Tel1, cliente.Tel2,cliente.Email);
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
                string query = string.Format(@"SELECT ClienteId, Nombre + ' ' + Apellido AS Nombre	FROM Clientes WHERE isEliminado = 0");
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
        public static Cliente BuscarPorIdDB(int idCliente)
        {
            try
            {
                conn = Conexion.Conectar();
                string query = string.Format(@"SELECT * FROM Clientes  WHERE ClienteId = {0}", idCliente);

                com = new SqlCommand(query, conn);
                dr = com.ExecuteReader();

                Cliente cli = new Cliente();


                while (dr.Read())
                {
                    cli.Nombre = dr["Nombre"].ToString();
                    cli.Apellido = dr["Apellido"].ToString();
                    cli.Cedula = dr["Cedula"].ToString();
                    cli.Tel1 = dr["Telefono1"].ToString();
                    cli.Tel2 = dr["Telefono2"].ToString();
                    cli.Email = dr["Email"].ToString();
                    

                }
                conn.Close();
                dr.Close();
                return cli;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        internal static void ActualizarClienteDB(int id, string nombre, string apellido, string cedula, string tel1, string tel2, string email)
        {
            try
            {
                conn = Conexion.Conectar();
                string query = string.Format(@"UPDATE Clientes SET Nombre = '{0}', Apellido = '{1}', Cedula = '{2}', Telefono1 = '{3}', Telefono2 = '{1}', Email = '{2}' WHERE ClienteId = {3}",
                    nombre,apellido,cedula,tel1,tel2,email,id);
                com = new SqlCommand(query,conn);
                com.ExecuteScalar();
                            
               
                conn.Close();

                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int EliminarClienteDB(int idCliente)
        {
            conn = Conexion.Conectar();
            com = new SqlCommand();
            com.CommandType = CommandType.StoredProcedure;
            com.Connection = conn;
            com.CommandText = "USP_Eliminar_Cliente";
            com.Parameters.Add("@ClienteId", SqlDbType.Int).Value = idCliente;
            int respuesta = Convert.ToInt32(com.ExecuteScalar());

            return respuesta;
        }
    }
}