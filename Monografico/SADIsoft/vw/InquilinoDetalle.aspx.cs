using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SADIsoft.vw
{
    public partial class InquilinoDetalle : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SadiConnectionString"].ConnectionString);
        SqlCommand com;
        int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
                Response.Redirect("~/LoginResponse.aspx");

            if (Convert.ToInt32(Session["Tipo"]) == 3)
            {
                Response.Redirect("~/LoginResponse.aspx");

            }

            try
            {
                id = Convert.ToInt32(Request.QueryString["ContId"]);


                conn.Open();
                string query = string.Format(@" 
             

 SELECT 

 Contratos.CuotaMensual,
 (SELECT COUNT(Facturas.FacturaId) FROM Facturas WHERE  Facturas.ContratoId = Contratos.ContratoId AND isMoraAplicada = 1) AS FacturasConMoras,
 Clientes.Nombre + ' ' + Clientes.Apellido AS NombreInquilino,
 'Calle ' + Direcciones.Calle + ', ' + Direcciones.Numero + ', ' + Sectores.Nombre + ', ' + Municipios.Nombre + ', ' + Provincias.Nombre AS DireccionInmueble,
 Propietarios.Nombre + ' ' + Propietarios.Apellido AS NombrePropietario,
 (select COUNT(Facturas.FacturaId) from Facturas WHERE Facturas.ContratoId = Contratos.ContratoId AND Estado = 0) AS FacturasPendientes,
 (select COUNT(Facturas.FacturaId) from Facturas WHERE Facturas.ContratoId = Contratos.ContratoId) AS TotalFacturas,
 CASE Contratos.ActualizarAutom WHEN 0 THEN 'Manual' WHEN 1 THEN 'Automatica' END Actualizacion

 FROM Contratos 
	INNER JOIN Clientes ON Contratos.ClienteId = Clientes.ClienteId
	INNER JOIN Inmuebles	ON Contratos.InmuebleId = Inmuebles.InmuebleId
	INNER JOIN Direcciones ON Inmuebles.DireccionId = Direcciones.DireccionId
	INNER JOIN Provincias ON Provincias.ProvinciaId = Direcciones.ProvinciaId
	INNER JOIN Municipios ON Municipios.MunicipioId = Direcciones.MunicipioId
	INNER JOIN Sectores ON Sectores.SectorId = Direcciones.SectorId
	INNER JOIN Propietarios ON Propietarios.PropietarioId = Inmuebles.PropietarioId			   
 WHERE Contratos.ContratoId = {0}", id);

                com = new SqlCommand(query, conn);
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    TextBox1.Text = dr["NombreInquilino"].ToString();
                    TextBox2.Text = dr["DireccionInmueble"].ToString();
                    TextBox3.Text = dr["NombrePropietario"].ToString();
                    TextBox4.Text = dr["CuotaMensual"].ToString();
                    TextBox5.Text = Convert.ToDouble(dr["FacturasConMoras"]).ToString();
                    TextBox6.Text = Convert.ToDouble(dr["FacturasPendientes"]).ToString();
                    TextBox7.Text = dr["Actualizacion"].ToString();
                    TextBox8.Text = dr["TotalFacturas"].ToString();
                    TextBox9.Text = dr["TotalFacturas"].ToString();
                }
                dr.Close();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

      

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string query;
                if (TextBox7.Text.Equals("Automatica"))
                {
                    query = string.Format("UPDATE Contratos SET ActualizarAutom = 0 WHERE ContratoId = {0}",id);
                }
                else
                {
                    query = string.Format("UPDATE Contratos SET ActualizarAutom = 1 WHERE ContratoId = {0}",id);
                }
                com = new SqlCommand(query, conn);
                com.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}