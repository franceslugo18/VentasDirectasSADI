﻿using System;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["ContId"]);
           

            

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SadiConnectionString"].ConnectionString);
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

            SqlCommand com = new SqlCommand(query,conn);
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
            }
            dr.Close();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}