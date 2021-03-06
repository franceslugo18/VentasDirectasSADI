﻿using System;
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

        public static void guardarContratoDA(string InmId, DateTime fecha)
        {
            try
            {
                conn = Conexion.Conectar();

                
                com = new SqlCommand();
                com.Connection = conn;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "USP_Reg_ContratoLitis";
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

        internal static void guardarContratoDA(int inmId, int cliId, int diaP, DateTime fecha)
        {
            conn = Conexion.Conectar();


            com = new SqlCommand();
            com.Connection = conn;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "USP_Reg_ContratoAlquiler";
            com.Parameters.Add("@InmuebleId", SqlDbType.Int).Value = Convert.ToInt32(inmId);
            com.Parameters.Add("@ClienteId", SqlDbType.Int).Value = Convert.ToInt32(cliId);
            com.Parameters.Add("@DiaPago", SqlDbType.Int).Value = Convert.ToInt32(diaP);
            com.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = fecha;

            int i = com.ExecuteNonQuery();
            conn.Close();
        }
    }
}