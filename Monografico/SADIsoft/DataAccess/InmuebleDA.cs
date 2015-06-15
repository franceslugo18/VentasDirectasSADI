using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SADIsoft.DataAccess;
using System.Data.SqlClient;
using System.Data;
using SADI.Model;

namespace SADIsoft.DataAccess
{
    public class InmuebleDA
    {
        private static SqlConnection conn;
        private static SqlCommand com;

        
        //---------------------------------------------------
        // Inserta un Inmueble en la Base de Datos
        //---------------------------------------------------
        internal static int RegistrarInmuebleDB(Inmueble inm)
        {

            try
            {
                conn = Conexion.Conectar();
                com = new SqlCommand();
                com.Connection = conn;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "USP_Registrar_Inmueble";

                com.Parameters.Add("@PropietarioId", SqlDbType.Int).Value = inm.PropietarioId;
                com.Parameters.Add("@ProvinciaId", SqlDbType.Int).Value = inm.Direccion.Provincia;
                com.Parameters.Add("@MunicipioId", SqlDbType.Int).Value = inm.Direccion.Municipio;
                com.Parameters.Add("@SectorId", SqlDbType.Int).Value = inm.Direccion.Sector;
                com.Parameters.Add("@Calle", SqlDbType.VarChar).Value = inm.Direccion.Calle;
                com.Parameters.Add("@Numero", SqlDbType.VarChar).Value = inm.Direccion.Numero;
                com.Parameters.Add("@Tipo", SqlDbType.Bit).Value = inm.Tipo;
                com.Parameters.Add("@PrecioVenta", SqlDbType.Money).Value = inm.PrecioVenta;
                com.Parameters.Add("@PrecioAlquiler", SqlDbType.Money).Value = inm.PrecioAlquiler;
                com.Parameters.Add("@Depositos", SqlDbType.Int).Value = inm.Depositos;
                com.Parameters.Add("@Sotano", SqlDbType.Bit).Value = inm.Sotano;
                com.Parameters.Add("@Piscina", SqlDbType.Bit).Value = inm.Piscina;
                com.Parameters.Add("@Observaciones", SqlDbType.VarChar).Value = inm.Comentarios;
                com.Parameters.Add("@Marquesina", SqlDbType.Bit).Value = inm.Marquesina;
                com.Parameters.Add("@CapacidadMarquesina", SqlDbType.Int).Value = inm.Capacidad;
                com.Parameters.Add("@NumeroPlantas", SqlDbType.Int).Value = inm.Niveles;
                com.Parameters.Add("@TipoInmueble", SqlDbType.Bit).Value = inm.TipoInmueble;
                com.Parameters.Add("@Foto1", SqlDbType.VarChar).Value = inm.Foto1;
                com.Parameters.Add("@Foto2", SqlDbType.VarChar).Value = inm.Foto2;
                com.Parameters.Add("@Foto3", SqlDbType.VarChar).Value = inm.Foto3;
                com.Parameters.Add("@Foto4", SqlDbType.VarChar).Value = inm.Foto4;
                com.Parameters.Add("@Habitaciones", SqlDbType.Int).Value = inm.Habitaciones;
                com.Parameters.Add("@Banos", SqlDbType.Int).Value = inm.Banos;

                int inmuebleId = Convert.ToInt32(com.ExecuteScalar());

                conn.Close();
                return inmuebleId;

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        internal static List<Inmueble> BuscarInmueblesPropietario(string propietarioId)
        {
            conn = Conexion.Conectar();
            com = new SqlCommand();
            com.Connection = conn;
            com.CommandType = CommandType.Text;
            com.CommandText = string.Format("SELECT I.InmuebleId, I.TipoInmueble, I.foto1, D.Calle + ', ' + D.Numero + ', ' + S.Nombre + ', ' + M.Nombre + ', ' + P.Nombre AS Direccion FROM Inmuebles AS I INNER JOIN Propietarios AS P ON I.PropietarioId = p.PropietarioId INNER JOIN Direcciones AS D ON I.DireccionId = D.DireccionId INNER JOIN Provincias AS Pr ON D.ProvinciaId = Pr.ProvinciaId INNER JOIN Municipios AS M ON D.MunicipioId = M.MunicipioId INNER JOIN Sectores AS S ON D.SectorId = S.SectorId WHERE I.PropietarioId = {0}",propietarioId);
            List<Inmueble> lista = new List<Inmueble>();
            SqlDataReader dr = com.ExecuteReader();

            while (dr.Read())
            {
                lista.Add(AgregarInmueble(dr));
            }
            dr.Close();
            return lista;
        }

        private static Inmueble AgregarInmueble(SqlDataReader dr)
        {
            Inmueble inm = new Inmueble();
            inm.InmuebleId = dr["InmuebleId"];
            inm.TipoInmueble = Convert.ToBoolean(dr["TipoInmueble"]);
            inm.Foto1 = dr["foto1"].ToString();
            inm.DireccionText = dr["Direccion"].ToString();

            return inm;

        }
    }
}