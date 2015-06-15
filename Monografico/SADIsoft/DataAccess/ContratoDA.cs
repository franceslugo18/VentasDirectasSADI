using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SADIsoft.DataAccess
{
    public class ContratoDA
    {
        private static SqlConnection conn;
        private static SqlCommand com;

        public static void guardarContratoDA(string ProId, string InmId, DateTime fecha)
        {
            try
            {
                conn = Conexion.Conectar();

                
                com = new SqlCommand();
                com.Connection = conn;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "USP_Reg_ContratoLits";
                com.Parameters.Add("@InmuebleId", SqlDbType.Int).Value = Convert.ToInt32(InmId);
                com.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = fecha;

                int i = com.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal static void guardarContratoDA(int inmId, int cliId, int diaP, DateTime dateTime)
        {
            conn = Conexion.Conectar();
            string query = string.Format(@"INSERT INTO Contratos(InmuebleId,ClienteId,DiaPago,Fecha) 
                VALUES({0},{1},'{2}','{3}')", inmId,cliId,diaP,dateTime);
            com = new SqlCommand(query, conn);

            int i = com.ExecuteNonQuery();
            conn.Close();
        }
    }
}