using SADI.Model;
using SADIsoft.Controller;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace SADIsoft
{
    public partial class RegistrarPagos : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
   

        }

 

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        

        protected void Button3_Click(object sender, EventArgs e)
        {


                           
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            string queryAplicarMora = string.Format("SELECT Contratos.ContratoId FROM Contratos INNER JOIN Facturas ON Contratos.ContratoId = Facturas.ContratoId WHERE DiaPago = datepart(d,dateadd(d, -5, '{0}')) AND Facturas.Estado = 0", "07-05-2015"/*DateTime.Now*/);
            string queryGenerarFactura = string.Format("SELECT ContratoId FROM Contratos WHERE DiaPago = {0}", 30/*DateTime.Now.Day*/);
            
            string spAplicarMoras = "SP_Aplicar_Moras";
            string spGenerarFactura = "SP_Generar_Factura";
            
            EjecutarQuery(queryAplicarMora, spAplicarMoras);
            EjecutarQuery(queryGenerarFactura, spGenerarFactura);
            

        }

        private void EjecutarQuery(string query, string storeProcedure)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=FRANCISCO-LUGO\SQLEXPRESS;
                Initial Catalog=PostgradoDB; user=sa; Password=adonay");
            conn.Open();

            SqlCommand com = new SqlCommand(query, conn);

            SqlDataReader dr = com.ExecuteReader();

            List<object> lista = new List<object>();

            while (dr.Read())
            {
                lista.Add(dr["ContratoId"]);
            }
            dr.Close();

            com = new SqlCommand();
            com.Connection = conn;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = storeProcedure;

            foreach (object obj in lista)
            {
                com.Parameters.Add("@ContratoId", SqlDbType.Int).Value = obj.ToString();
                com.ExecuteNonQuery();
                com.Parameters.Clear();
            }

            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Contrato con = new Contrato();

                con = RealizarPagoControlador.BuscarContratoPorCedula(txtCedula.Text);

                txtNombre.Text = con.Cliente.Nombre + " " + con.Cliente.Apellido;
                txtNoContrato.Text = con.ContratoId.ToString();
                txtDiaPago.Text = con.DiaPago.ToString();
                txtMensualidad.Text = con.Inmueble.PrecioAlquiler.ToString();

                

                
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        
    }
}